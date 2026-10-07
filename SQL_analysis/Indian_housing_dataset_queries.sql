-- What is the overall average, minimum, maximum, and median property price, and how widely does property pricing vary across the dataset?
select round(avg(price_lakh),2) as avg_price, 
round(min(price_lakh),2) as min_price, 
round(max(price_lakh),2) as max_price,
round((select avg(price_lakh)
from (select price_lakh,
row_number() over(order by price_lakh) as rn,
count(*) over() as total_count
from `indian_housing_dataset`)t
where rn in (
floor((total_count+1)/2),
ceil((total_count+1)/2))),2)as median_price
from `indian_housing_dataset`;

-- Which cities have the highest and lowest average property prices, and how does the number of properties listed in each city compare?
select city, count(*) as property_count,
round(avg(price_lakh),2) as avg_city_price
from indian_housing_dataset
group by city
order by avg_city_price desc;

-- How does the average property price differ across locality tiers (for example, Premium/Prime/Standard)?
select locality_tier, count(*) as property_count, round(avg(price_lakh),2) as avg_locality_price
from indian_housing_dataset
group by locality_tier
order by avg_locality_price desc;

-- How does property size (area_sqft) vary across different price ranges, and is there a clear relationship between property size and price?
select
case 
	when price_lakh <100 then 'Budget'
    when price_lakh <200 then 'Mid_Range'
    when price_lakh <400 then 'Upper_Mid'
    else 'Premium'
end as price_category,
count(*) as property_count,
round(avg(price_lakh),2) as avg_price,
round(avg(area_sqft),2) as avg_area
from indian_housing_dataset
group by 
case 
	when price_lakh <100 then 'Budget'
    when price_lakh <200 then 'Mid_Range'
    when price_lakh <400 then 'Upper_Mid'
    else 'Premium'
    end
    order by avg_area;

-- Which cities have the highest and lowest average price per square foot?
select city, round(avg((price_lakh*100000)/area_sqft),2) as avg_price_per_sqft
from indian_housing_dataset
group by city
order by avg_price_per_sqft DESC;

-- How do average prices and average property sizes differ across property types such as Apartment, Villa, Independent House, etc.?
select property_type,
count(*) as property_count,
round(avg(price_lakh),2) as avg_price, 
round(avg(area_sqft),2) as avg_area
from indian_housing_dataset
group by property_type
order by avg_price, avg_area;

-- How does the average property price change with the number of bedrooms, and does adding more bedrooms consistently correspond to higher prices?
select bedrooms,
count(*) as total_bedroom_count,
round(avg(price_lakh),2) as avg_price
from indian_housing_dataset
group by bedrooms
order by bedrooms;

-- How does proximity to metro stations, schools, and hospitals relate to average property prices?
-- Metro Proximity
select metro_proximity,
count(*) as property_count,
round(avg(price_lakh),2) as avg_price
from(
select price_lakh,
case
	when distance_to_metro_km is null then 'Unknown'
    when distance_to_metro_km <2 then 'Very Close'
    when distance_to_metro_km <4 then 'Close'
    when distance_to_metro_km <8 then 'Far'
    else 'Very Far'
End as metro_proximity
from indian_housing_dataset) as t
group by metro_proximity
order by 
case metro_proximity
	when 'Very Close' then 1
    when 'Close' then 2
    when 'Far' then 3
    when 'Very Far' then 4
end;

-- Hospital Proximity
select hospital_proximity,
count(*) as property_count,
round(avg(price_lakh),2) as avg_price
from (
select price_lakh,
case
	when distance_to_hospital_km is null then 'Unknown'
    when distance_to_hospital_km <2 then 'Very Close'
    when distance_to_hospital_km <4 then 'Close'
    when distance_to_hospital_km <8 then 'Far'
    else 'Very Far'
    end as hospital_proximity
from indian_housing_dataset) as t
group by hospital_proximity
order by 
case hospital_proximity
	when 'Very Close' then 1
    when 'Close' then 2
    when 'Far' then 3
    when 'Very Far' then 4
end;

-- School Proximity
select school_proximity,
count(*) as property_count,
round(avg(price_lakh),2) as avg_price
from (
select price_lakh,
case
	when distance_to_school_km is null then 'Unknown'
    when distance_to_school_km <2 then 'Very Close'
    when distance_to_school_km <4 then 'Close'
    when distance_to_school_km <8 then 'Far'
    else 'Very Far'
    end as school_proximity
from indian_housing_dataset) as t
group by school_proximity
order by 
case school_proximity
	when null then 'Unknown'
	when 'Very Close' then 1
    when 'Close' then 2
    when 'Far' then 3
    when 'Very Far' then 4
end;

-- Do properties with higher amenities_score command higher average prices compared with properties having lower amenity scores?
select amenities_scores,
count(*) as property_count,
round(avg(price_lakh),2) as avg_price
from(
select price_lakh,
case
	when amenities_score <=3 then 'Low'
    when amenities_score <=7 then 'Medium'
    else 'High'
    end as amenities_scores
from indian_housing_dataset) as t
group by amenities_scores
order by 
case amenities_scores
	when  'Low' then 3
    when 'Medium' then 2
    when 'High' then 1
end;

-- How does property age affect average selling price? Are newer properties consistently more expensive than older properties?
select property_age_grp,
count(*) as property_count,
round(avg(price_lakh),2) as avg_price
from(
select price_lakh,
case
	when property_age_years < 5 then 'New'
    when property_age_years <15 then 'Mid-Age'
    else 'Old'
end as property_age_grp
from indian_housing_dataset) as t
group by property_age_grp
order by 
case property_age_grp
	when 'New' then 1
    when 'Mid-Age' then 2
    else 3
end;

-- How much does furnishing status (Fully Furnished, Semi-Furnished, Unfurnished) differ in terms of average property price and average price per square foot?
SELECT
COALESCE(furnishing, 'Unknown') AS furnishing,
COUNT(*) AS property_count,
ROUND(AVG(price_lakh), 2) AS avg_price,
ROUND(AVG((price_lakh * 100000) / area_sqft), 2) AS avg_price_per_sqft
FROM indian_housing_dataset
GROUP BY COALESCE(furnishing, 'Unknown')
ORDER BY avg_price DESC;

-- How do average property prices differ by the number of parking spaces?
select parking_spaces,
count(*) as property_count,
round(avg(price_lakh),2) as avg_price
from indian_housing_dataset
group by parking_spaces
order by parking_spaces;

-- Within each city, which property type has the highest average price?
with cte as (select city, property_type,
count(*) as property_count,
round(avg(price_lakh),2) as avg_price
from indian_housing_dataset
group by city, property_type),
ranking as (select *,
dense_rank() over(partition by city order by avg_price desc) as ranking
from cte)
select * from ranking
where ranking = 1;

-- What are the top 5 most expensive properties in each city?
with ranks as (select property_id, city, property_type, price_lakh,
row_number() over(partition by city order by price_lakh DESC) as ranking
from indian_housing_dataset)
select * from ranks
where ranking between 1 and 5
order by city;

-- For each city, which properties are priced significantly above their city's average property price?
with avg_price as (select city, price_lakh, 
round(avg(price_lakh) over(partition by city),2) as avg_price_lakh
from indian_housing_dataset)
select * from avg_price
where avg_price_lakh<price_lakh
order by city, price_lakh DESC
# SQL Analysis – Indian Housing Price Prediction

## Overview

This folder contains the SQL-based exploratory analysis performed on the Indian housing dataset using MySQL.

The objective of the analysis was to understand the factors associated with property prices and identify useful patterns across cities, property characteristics, location, accessibility, and amenities before building the machine learning regression model.

## Objectives

The SQL analysis was performed to:

- Understand the overall distribution of property prices
- Compare property prices across cities and locality tiers
- Analyze the relationship between property size and price
- Compare price per square foot across cities
- Analyze property type and bedroom count against price
- Examine the relationship between property accessibility and price
- Understand how property age, furnishing, and parking are associated with price
- Identify the highest-priced properties within each city
- Perform basic data-quality checks

---

## Key SQL Analyses

### 1. Overall Property Price Analysis

Analyzed:

- Average property price
- Minimum property price
- Maximum property price
- Median property price

This provided an overall understanding of the price distribution in the dataset.

---

### 2. City-wise Property Price Analysis

Compared average property prices across cities and examined the number of properties available in each city.

**Key insight:**

Mumbai had the highest average property price among the cities analyzed, while Chennai and Pune were among the lower-priced cities based on average property price.

---

### 3. Price per Square Foot by City

Calculated property-level price per square foot and compared the average across cities.

**Key insight:**

Mumbai had the highest average price per square foot, followed by Delhi NCR and Bengaluru. The average property sizes across cities were relatively similar, indicating that differences in price were not simply due to differences in property size.

---

### 4. Locality Tier vs Property Price

Compared average property prices across:

- Prime
- Standard
- Developing

**Key insight:**

Prime localities had substantially higher average property prices than Standard and Developing localities.

---

### 5. Property Size vs Price Category

Properties were grouped into price categories and their average area was compared.

**Key insight:**

Average property size increased consistently across the price categories, indicating a positive association between property size and property price.

---

### 6. Property Type vs Price

Compared average price and average area across:

- Apartments
- Villas
- Independent Houses

**Key insight:**

Villas had the highest average price, followed by Independent Houses and Apartments. The average property sizes were relatively similar across the three property types, suggesting that property type is associated with price differences beyond size alone.

---

### 7. Bedrooms vs Property Price

Compared average property prices across different bedroom counts.

**Key insight:**

Average property price generally increased with the number of bedrooms. Categories with very few observations, such as 6-bedroom properties, were interpreted with caution.

---

### 8. Property Accessibility vs Price

Analyzed the relationship between property price and distance from:

- Metro stations
- Schools
- Hospitals

**Key insight:**

Properties located closer to these amenities generally showed higher property prices. However, substantial price variation remained among properties with similar distances, indicating that accessibility alone does not determine property price.

---

### 9. Property Age vs Price

Properties were grouped into age categories and compared based on average price.

**Key insight:**

Newer properties had higher average prices than older properties in the dataset.

---

### 10. Furnishing Status vs Price

Compared average property price and average price per square foot across furnishing categories.

**Key insight:**

Fully furnished properties had the highest average price and average price per square foot, followed by semi-furnished and unfurnished properties.

---

### 11. Parking Spaces vs Price

Compared average property prices based on the number of parking spaces.

**Key insight:**

Properties with one or two parking spaces had somewhat higher average prices than properties with no parking. However, the relationship was not strictly increasing.

---

### 12. Top-priced Properties

Identified the highest-priced properties and examined their city and locality characteristics.

**Key insight:**

A large proportion of the highest-priced properties were located in Mumbai, particularly in Prime localities. This is consistent with the overall city-level price patterns observed in the dataset.

---

## SQL Concepts Demonstrated

The analysis demonstrates the use of:

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- Aggregate functions such as AVG(), MIN(), MAX(), COUNT()
- ROUND()
- CASE WHEN
- COALESCE()
- Subqueries
- Common Table Expressions (CTEs)
- Window functions
- ROW_NUMBER()
- RANK()
- Filtering and ranking within groups
- Data-quality checks
- Calculated fields

---

## SQL File

The complete SQL queries used for the analysis are available in:

"Indian_housing_dataset_queries.sql"

The queries are organized according to the analysis questions and can be executed in MySQL using the Indian housing dataset.

---

## Key Takeaway

The SQL analysis showed that property prices are associated with several factors including:

- City
- Locality tier
- Property size
- Property type
- Number of bedrooms
- Accessibility to important amenities
- Property age
- Furnishing status

These findings were subsequently used to support the exploratory data analysis and machine learning stage of the project.

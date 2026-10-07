# Indian Housing Price Prediction

An end-to-end data analytics and machine learning project to analyze Indian housing prices and build a regression model for property price prediction.

The project combines **SQL-based business analysis** with **Python-based machine learning**, covering the complete workflow from data exploration and cleaning to model evaluation and interpretation.

> **Note:** The dataset used in this project is synthetic and created for educational and portfolio purposes. It does not represent actual property listings or real-world transactions.

---

## 📌 Project Overview

Property prices vary significantly based on factors such as location, property size, number of bedrooms, property type, accessibility, amenities, and property age.

The objective of this project is to:

- Analyze housing price patterns using SQL
- Identify important factors associated with property prices
- Perform data cleaning and exploratory data analysis
- Build and compare multiple regression models
- Tune the best-performing model
- Evaluate model performance using appropriate regression metrics
- Interpret the model and derive practical business insights

---

## 🎯 Business Problem

**Can property characteristics and location-related factors be used to predict the price of a residential property?**

The target variable is:

price_lakh — Property price in Indian lakh rupees.

---

## 📊 Dataset

The dataset contains property-level information including:

- City
- Locality tier
- Property type
- Area in square feet
- Bedrooms
- Bathrooms
- Floor information
- Property age
- Parking spaces
- Distance to metro, school and hospital
- Amenities score
- Crime index
- Monthly maintenance
- Furnishing status
- Ownership type
- Property price

The dataset contains approximately **10K+ property records** with both numerical and categorical features.

---

# 🔎 SQL Analysis

MySQL was used to perform exploratory and business-oriented analysis before building the machine learning model.

### Key analyses performed

- Overall average, minimum, maximum and median property prices
- City-wise property prices
- Locality tier vs average price
- Property size across different price ranges
- City-wise price per square foot
- Property type vs average price
- Bedrooms vs average property price
- Accessibility to metro, schools and hospitals
- Property age vs average price
- Furnishing status vs property price
- Parking spaces vs average price
- Highest-priced property type within each city
- Top 5 most expensive properties in each city
- Properties priced above their respective city average
- Data-quality checks including duplicates, missing values and invalid values

### Key SQL Insights

- **Mumbai** has the highest average property price among the cities analyzed.
- Property prices generally increase as **property size increases**.
- Higher-bedroom properties tend to have higher average prices.
- **Villas** have the highest average price among the major property types across the cities.
- Properties with better accessibility to key locations tend to show higher prices.
- Newer properties generally have higher average prices than older properties.
- Mumbai has the highest average **price per square foot**.
- There is substantial variation in property prices even within the same city.

Detailed SQL analysis and queries are available in the [SQL_analysis] folder.

---

# 🤖 Machine Learning

The project uses supervised machine learning regression algorithms to predict price_lakh.

## ML Workflow

```text
Data Loading
     ↓
Data Quality Checks
     ↓
Data Cleaning
     ↓
Exploratory Data Analysis
     ↓
Feature Selection
     ↓
Train-Test Split
     ↓
Data Preprocessing
     ↓
Baseline Model
     ↓
Multiple Regression Models
     ↓
Cross-Validation
     ↓
Hyperparameter Tuning
     ↓
Final Evaluation
     ↓
Feature Importance & Residual Analysis

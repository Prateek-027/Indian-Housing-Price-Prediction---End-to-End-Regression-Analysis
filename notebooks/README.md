# Indian Housing Price Analysis & Prediction

## Overview

This notebook presents an end-to-end machine learning workflow for predicting residential property prices using a synthetic Indian housing dataset.

The project combines exploratory data analysis, data quality checks, preprocessing, regression modeling, hyperparameter tuning, model evaluation, residual analysis, and feature importance analysis.

The target variable is `price_lakh`, representing the property price in INR lakhs.

> **Dataset Note:** The dataset used in this project is synthetic and was created for educational and portfolio purposes. It does not represent actual property listings or real-world transaction data.

---

## Project Objective

The objective is to develop a regression model that can estimate property prices based on characteristics such as:

- Property size
- City
- Locality tier
- Property type
- Bedrooms and bathrooms
- Property age
- Parking availability
- Accessibility to metro, schools and hospitals
- Amenities
- Crime index
- Maintenance cost
- Furnishing
- Ownership type

---

## Notebook Workflow

The notebook follows the following workflow:

1. Problem Definition
2. Data Loading & Data Quality Assessment
3. Data Cleaning
4. Exploratory Data Analysis
5. Correlation Analysis
6. Feature and Target Definition
7. Train-Test Split
8. Data Preprocessing
9. Baseline Model
10. Regression Model Development
11. Model Comparison
12. Cross-Validation
13. Hyperparameter Tuning
14. Final Model Evaluation
15. Actual vs Predicted Analysis
16. Residual Analysis
17. Feature Importance
18. Key Findings and Conclusion

---

## Data Quality & Cleaning

The dataset initially contained 10,025 rows and 20 columns.

The data preparation process included:

- Checking missing values
- Checking duplicate records
- Removing the identifier variable from model features
- Checking for invalid or impossible values
- Handling missing numerical values using median imputation
- Handling missing categorical values using most-frequent imputation
- Checking categorical variables for consistency
- Investigating potential outliers rather than automatically removing legitimate high-value properties

Since this is a regression problem with a continuous target variable, class balancing techniques were not applicable.

---

## Exploratory Data Analysis

The EDA focused on understanding the relationship between property characteristics and price without creating unnecessary visualizations.

Key areas explored included:

- Price distribution
- Property area
- Area vs price
- Property accessibility
- City vs price
- Locality tier vs price
- Property type vs price
- Furnishing status vs price
- Bedroom count vs price
- Correlation between numerical variables

### Key EDA Findings

- Property area showed a strong positive relationship with property price.
- Mumbai had the highest price distribution among the cities analyzed.
- Prime localities generally had higher property prices.
- Larger properties were generally associated with higher price categories.
- Property type showed differences in average price even though average property sizes were relatively similar.
- Properties closer to metro stations, schools and hospitals generally showed higher prices.
- Newer properties had higher average prices than older properties in the dataset.
- The target variable showed some right-skewness due to a relatively small number of high-priced properties.

---

## Data Preprocessing

The preprocessing workflow was implemented using a Scikit-learn pipeline.

### Numerical Features

- Median imputation
- Standard scaling

### Categorical Features

- Most-frequent imputation
- One-hot encoding
- `drop='first'`
- `handle_unknown='ignore'`

A `ColumnTransformer` was used to apply the appropriate preprocessing to numerical and categorical variables.

This approach also helped prevent data leakage by fitting preprocessing steps only on the training data.

---

## Machine Learning Models

The following regression models were evaluated:

- Linear Regression
- Ridge Regression
- Lasso Regression
- Random Forest Regressor
- Gradient Boosting Regressor

A mean-based baseline model was also used for comparison.

The models were evaluated using:

- **MAE (Mean Absolute Error)**
- **RMSE (Root Mean Squared Error)**
- **R² (R-squared)**

Five-fold cross-validation was used during model evaluation, followed by hyperparameter tuning of the best-performing model.

---

## Model Performance

The final model comparison was:

| Model | MAE (₹ Lakh) | RMSE (₹ Lakh) | R² |
|---|---:|---:|---:|
| Baseline | 70.76 | 97.40 | -0.001 |
| Linear Regression | 24.11 | 40.71 | 0.825 |
| Ridge | 24.10 | 40.71 | 0.825 |
| Lasso | 24.65 | 42.07 | 0.813 |
| Random Forest | 22.76 | 38.58 | 0.843 |
| Gradient Boosting | 20.34 | 36.33 | 0.861 |
| **Tuned Gradient Boosting** | **19.02** | **34.62** | **0.874** |

### Final Model

The tuned Gradient Boosting Regressor achieved the best performance among the evaluated models.

On the test set:

- **MAE:** ₹19.02 lakh
- **RMSE:** ₹34.62 lakh
- **R²:** 0.874

The R² indicates that the model explains approximately 87.4% of the variation in property prices in the test dataset.

---

## Feature Importance

Feature importance from the final Gradient Boosting model showed that the most influential features included:

1. `area_sqft`
2. `city_Mumbai`
3. `locality_tier_Prime`
4. `bedrooms`
5. `city_Delhi NCR`

Property size was the most influential feature, followed by location-related variables.

These results were broadly consistent with the patterns observed during EDA.

> Feature importance represents the features the model relied on most when making predictions and should not be interpreted as causation.

---

## Residual Analysis

Residual analysis was performed on the final model to examine prediction errors.

Most residuals were concentrated around zero without a strong systematic pattern across the majority of observations.

However, a small number of very high-priced properties produced large positive residuals, indicating that the model tends to underpredict some properties at the extreme upper end of the price distribution.

These observations were not automatically removed because they appeared to represent legitimate high-value properties rather than obvious data errors.

---

## Key Findings

The overall analysis suggests that property pricing in the dataset is associated with several factors, particularly:

- Property size
- City
- Locality tier
- Property type
- Number of bedrooms
- Accessibility to important amenities

The machine learning results were broadly consistent with the EDA findings, with area and location-related features emerging as important predictors.

---

## Conclusion

This project demonstrates an end-to-end regression workflow for property price prediction, combining data quality assessment, exploratory analysis, SQL-based analysis, preprocessing, multiple regression algorithms, cross-validation, hyperparameter tuning, model evaluation, residual analysis and model interpretation.

The tuned Gradient Boosting model provided the strongest performance among the evaluated approaches, achieving an R² of 0.874 and an MAE of ₹19.02 lakh on the unseen test set.

The model performs well for the majority of properties but has greater difficulty predicting a small number of extremely high-priced properties, which represents an important limitation of the current model.

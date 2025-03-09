# Meteorite Landings Analysis

# Project Overview
This project explores meteorite landings using a dataset curated by Javier de la Torre and provided by The Meteoritical Society. The dataset consists of 34,513 meteorite records, including key attributes such as meteorite type, weight, landing year, discovery method (fall vs. found), latitude, and longitude. The objective is to analyze the distribution, classification, and trends of meteorites over time, providing insights into their characteristics and significance.

# Goals and Objectives
Analyze meteorite distribution based on geographic location.
Identify meteorite types and classifications with the highest frequency.
Determine temporal trends in meteorite landings.
Compare observed falls vs. discovered meteorites over time.
Use predictive modeling to estimate meteorite characteristics based on historical data.

# Dataset Information
Source: The Meteoritical Society
Total Records: 34,513

Key Columns:
## name: Meteorite name
## id: Unique identifier
## mass: Weight of the meteorite
## fall: Whether it was observed falling or found later
## year: Year of landing/discovery
## reclat, reclong: Latitude and longitude coordinates
## recclass: Meteorite classification

# Methodologies & Models Used
## 1. Logistic Regression Model
Used for binary classification to predict whether a meteorite was observed falling or later discovered.
Determines statistical significance of factors influencing meteorite landings.
Findings indicate that certain variables significantly impact the probability of a meteorite falling.

## 2. Multivariable Regression Model
Analyzes relationships between multiple variables, including year, latitude, and longitude, to predict meteorite fall mass.
## Key Insights:
Older meteorites tend to have lower mass.
Meteorites landing at higher latitudes generally have larger masses.
Longitude also has a moderate effect on mass distribution.

## 3. Linear Regression Model
Quantifies the linear relationship between meteorite mass and other factors.
The model suggests that latitude and year are significant predictors, though it has a relatively low R-squared value (0.01514), indicating weak predictive power.

# Exploratory Data Analysis (EDA)
## 1. Meteorite Landings Over Time
The year with the most meteorite landings: 2003 (3,046 landings).
The year with the fewest meteorite landings: 1991 (877 landings).

## Trend: Increased detection in recent years due to better observation tools (e.g., meteor cameras).

## 3. Most Common Meteorite Classes
Meteorite Class	Count
L6	8,285
L5	7,142
H5	4,796
H6	4,528
H4	4,211
Least Common – Ureilite	300

## 4. Geographic Distribution of Meteorite Landings
Northern Hemisphere has more landings than the Southern Hemisphere (due to larger landmass).
Continental regions have more discoveries than oceanic areas.
Desert regions show high meteorite detection rates due to better preservation.
Urban & populated areas report more meteorites, likely due to human activity.

# Key Findings from Predictive Models
## Logistic Regression
P-values indicate that all variables used in the model significantly influence whether a meteorite was observed falling or found later.
## Multivariable Regression
R-squared value of 0.3105, meaning it explains 31.05% of the variance in fall mass.
Latitude and longitude positively correlate with meteorite mass.
Older meteorites tend to be smaller in mass.
## Linear Regression
R-squared of 0.01514, meaning a weak relationship between meteorite characteristics and mass.
Latitude has the strongest positive correlation with fall mass.

# Tools & Libraries Used
Programming Language: Python
Libraries:
pandas – Data manipulation
matplotlib & seaborn – Data visualization
scikit-learn – Machine learning models (Logistic Regression, Linear Regression)
statsmodels – Statistical analysis

# Conclusion
Meteorite landings are more frequently detected in recent years, likely due to technological advancements.
Certain meteorite types (L6, L5, H5) are significantly more common than others.
Geographic factors (latitude, longitude, and climate) influence meteorite discovery rates.
Predictive models provide insights but have limitations, as additional factors like composition and atmospheric entry angles are not considered.

# Limitations & Future Work
The model is trained on a single dataset, and performance may vary with new data.
Additional meteorite properties (composition, speed, angle of entry) should be considered for future models.
Machine learning algorithms (e.g., Random Forest, Neural Networks) could improve predictive accuracy.

# References
[Scikit-learn Documentation](https://scikit-learn.org/stable/)
[Machine Learning Mastery – Regression Models](https://machinelearningmastery.com/)

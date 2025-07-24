❤️ Heart Disease Prediction using Random Forest & XGBoost in R
This project uses supervised machine learning techniques to predict the presence of heart disease using a health dataset. It explores key features such as age, blood pressure, cholesterol, and others, and implements both Random Forest and XGBoost classifiers using R.

🔍 Overview
Cardiovascular diseases are among the leading causes of death globally. Early detection through data-driven analysis can help in timely medical intervention. This project builds predictive models to classify whether a patient has heart disease based on clinical attributes.

📁 Project Structure
bash
Copy
Edit
├── heart_disease_prediction.R   # Main R script for data preprocessing, modeling, evaluation
├── README.md                    # Project overview and instructions
└── data/                        # Folder for your dataset (manually chosen via file dialog)
🧰 Libraries Used
readr – For reading CSV data

tidyverse – Data manipulation and visualization

caret – Data partitioning and evaluation

randomForest – Random Forest classification

corrplot – Correlation matrix visualization

lubridate – Date/time utilities (if needed)

xgboost – Gradient boosting classification

📊 Features Used
Age

RestingBP (Resting Blood Pressure)

Cholesterol

MaxHR (Maximum Heart Rate Achieved)

Oldpeak (ST depression induced by exercise)

🚀 Workflow
Data Loading & Exploration

Select a CSV dataset with relevant clinical data.

Explore structure and distributions.

Visualize correlations.

Data Preprocessing

Convert categorical variables to factors.

Encode target variable (HeartDisease) for modeling.

Train-Test Split

80% training and 20% testing using stratified sampling.

Model 1: Random Forest

Trained with 500 trees.

Feature importance plotted.

Performance evaluated via confusion matrix.

Model 2: XGBoost

Optimized for binary classification.

Probability thresholding for predictions.

Visualized feature importance.

Visualization

Age-wise distribution of heart disease cases.

Correlation heatmaps.

Model accuracy comparison.

📈 Results
Both models are evaluated using confusion matrices.

Feature importances are analyzed to understand which factors most influence the prediction.

Visual aids (histograms, importance plots) support interpretability.

🤝 Acknowledgements
Thanks to open health datasets used for research.

Inspired by healthcare ML applications and Kaggle competitions.


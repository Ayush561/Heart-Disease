#install.packages(c("readr", "tidyverse", "caret", "randomForest", "corrplot", "lubridate", "xgboost"))

library(readr)
library(tidyverse)
library(caret)
library(randomForest)
library(corrplot)
library(lubridate)
library(xgboost)

data <- read_csv(file.choose())

# Check data structure
str(data)
head(data)


table(data$HeartDisease)


data$Sex <- as.factor(data$Sex)
data$HeartDisease <- factor(data$HeartDisease, levels=c(0,1), labels=c("No", "Yes"))

corr_data <- data %>% select(Age, RestingBP, Cholesterol, MaxHR, Oldpeak)
corrplot(cor(corr_data),method="number")


set.seed(123)
trainIndex <- createDataPartition(data$HeartDisease, p=0.8, list=FALSE)
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]

table(trainData$HeartDisease)
table(testData$HeartDisease)


set.seed(123)
rf_model <- randomForest(HeartDisease ~ Age + RestingBP + Cholesterol + MaxHR + Oldpeak,
                         data=trainData, ntree=500, importance=TRUE)
print(rf_model)
varImpPlot(rf_model)


predictions <- predict(rf_model, newdata=testData)
confusionMatrix(predictions, testData$HeartDisease)


ggplot(data, aes(x=Age, fill=HeartDisease)) +
  geom_histogram(binwidth=5, color="black", alpha=0.7, position="identity") +
  scale_fill_manual(values=c("steelblue", "tomato")) +
  labs(title="Age Distribution by Heart Disease",
       x="Age", y="Count")



#XgBoost Implementation
train_features <- trainData %>%
  select(Age, RestingBP, Cholesterol, MaxHR, Oldpeak) %>%
  as.matrix()

train_labels <- ifelse(trainData$HeartDisease == "Yes", 1, 0)

test_features <- testData %>%
  select(Age, RestingBP, Cholesterol, MaxHR, Oldpeak) %>%
  as.matrix()

test_labels <- ifelse(testData$HeartDisease == "Yes", 1, 0)

set.seed(123)
xgb_model <- xgboost(data = train_features,
                     label = train_labels,
                     nrounds = 100,
                     objective = "binary:logistic",
                     eval_metric = "error",
                     verbose = 0)


xgb_pred_prob <- predict(xgb_model, newdata=test_features)
xgb_predictions <- ifelse(xgb_pred_prob > 0.5, 1, 0)

xgb_predictions_factor <- factor(ifelse(xgb_predictions == 1, "Yes", "No"), levels=c("Yes", "No"))
test_labels_factor <- factor(ifelse(test_labels == 1, "Yes", "No"), levels=c("Yes", "No"))

confusionMatrix(xgb_predictions_factor, test_labels_factor)


importance <- xgb.importance(model = xgb_model)
xgb.plot.importance(importance_matrix = importance)







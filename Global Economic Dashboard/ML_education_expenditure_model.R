library(dplyr)  # For data manipulation
library(ggplot2)  # For data visualization
library("tidyverse")
library(stats)
library(caret)



data <- read.csv("data\\cn_filter.csv", header = TRUE, sep = ",")
df=data.frame(data)
df


#Structure of data
str(df)

# View the first few rows of the dataset
head(df)

# Summary statistics for numeric columns
summary(df)

#to know data type of each row
data_types <- sapply(df, class)
print(data_types)


# Check for null values 
na2 <- sum(is.na(df))
na2
df<-na.omit(df)
na2 <- sum(is.na(df))
na2


numeric_columns <- df[, sapply(df, is.numeric)]

# Calculate the correlation matrix for the numeric columns
correlation_matrix <- cor(numeric_columns)

# Display the correlation matrix
print(correlation_matrix)

df
column_names <- names(df)
print(column_names)

# Load the required library for random forest
library(randomForest)


# Assuming df is your dataset
set.seed(123)  # for reproducibility

# Set the proportion for the test set (e.g., 70% training and 30% testing)
test_size <- 0.3

# Create an index for the test set
test_index <- createDataPartition(df$Education.Expenditure....GDP., p = test_size, list = FALSE)

# Split the data into training and testing sets
train_data <- df[-test_index, ]  # Training data
test_data <- df[test_index, ]    # Testing data

# Fit a Random Forest regression model on the training data
rf_model <- randomForest(Education.Expenditure....GDP. ~ Export....GDP.+Health.Expenditure....GDP.+Import....GDP.+Industry....GDP.+Inflation.Rate,data = train_data, ntree = 101)

# Make predictions on the test data
rf_predictions <- predict(rf_model, newdata = test_data)

# Evaluate the model on the test data
rf_rmse <- sqrt(mean((test_data$Education.Expenditure....GDP.- rf_predictions)^2))
rf_r_squared <- 1 - sum((test_data$Education.Expenditure....GDP. - rf_predictions)^2) / sum((test_data$Education.Expenditure....GDP. - mean(test_data$Education.Expenditure....GDP.))^2)

# Print RMSE and R-squared
cat("Random Forest RMSE: ", rf_rmse, "\n")
cat("Random Forest R-squared: ", rf_r_squared, "\n")

# Define a threshold for accuracy (e.g., within 10%)
accuracy_threshold <- 0.30

# Calculate the percentage of predictions within the threshold
accuracy_percentage <- mean(abs(test_data$Education.Expenditure....GDP. - rf_predictions) / test_data$Education.Expenditure....GDP. <= accuracy_threshold) * 100

# Print the accuracy percentage
cat("Accuracy within", accuracy_threshold * 100, "%:", accuracy_percentage, "%\n")
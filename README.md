# Global Economic Dashboard

## Overview

Welcome to the Global Economic Dashboard, an interactive Shiny app designed to provide a comprehensive overview of key economic indicators for selected countries. Explore data on agriculture, ease of doing business, education expenditure, exports, GDP, health expenditure, imports, industry, inflation rate, R&D, service sector, unemployment, population, land area, and more.

## Features

### Data Tab
- Checkbox: Show row names in the data table.
- Data table displaying the selected country's economic indicators.

### Visualization Tab
- Select a country and an economic indicator to visualize trends over the years using an interactive line plot.

### 3D Visualization Tab
- Choose between scatterplot3d or rgl for 3D visualization.
- Select an indicator and a year to explore the economic landscape in three dimensions.

### Future Trends Tab
- Input numeric values for future trends in export, health expenditure, import, industry, and inflation rate.
- Click "Predict" to use the Random Forest model for predicting future trends.
- View the model's prediction in the "Random Forest Model Results" section.

## How to Use

1. Navigate through the tabs to explore different aspects of the global economy.
2. In the "Visualization" tab, select a country and an economic indicator to view historical trends.
3. Use the 3D Visualization tab to explore economic indicators in a three-dimensional space.
4. In the "Future Trends" tab, input numeric values and click "Predict" to get future trend predictions.

## Notes

- This app covers countries such as Argentina, Australia, Brazil, Canada, China, France, Germany, India, Indonesia, Italy, Japan, Korea, Mexico, Saudi Arabia, South Africa, Turkey, United Arab Emirates, United Kingdom, and the United States.
- The Random Forest model is utilized for predicting future trends based on the input parameters.

## Getting Started

1. Open the app by running `shiny::runApp("app_directory_path")` in RStudio.
2. Ensure you have the required packages installed using `install.packages(c("shiny", "leaflet", "DT", "scatterplot3d", "rgl", "tidyverse", "randomForest"))`.

## Credits

This app was developed using the Shiny framework and various R packages. Data is sourced from the "cn_filter.csv" file, and the Random Forest model is built using the "ML_education_expenditure_model.R" script.

## Author

Simran Udhani


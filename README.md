# Global Economic Dashboard

## Overview

Welcome to the Global Economic Dashboard, a data analytics and visualization Shiny app designed to provide insights into key economic indicators for 20 countries. This interactive tool spans the years 2012 to 2022 and incorporates a Regression Machine Learning model to predict Education Expenditure (%GDP). Explore diverse data through 2D and 3D charts, offering a comprehensive view of economic trends.

## Features

### Data Tab
- Checkbox: Show row names in the data table.
- Data table displaying economic indicators for the selected countries.

### Visualization Tab
- Select a country and an economic indicator to visualize trends from 2012 to 2022 using an interactive line plot.

### 3D Visualization Tab
- Choose between scatterplot3d or rgl for 3D visualization.
- Select an indicator and a year to explore economic landscapes in three dimensions.

### Future Trends Tab
- Input numeric values for future trends in export, health expenditure, import, industry, and inflation rate.
- Click "Predict" to use the Regression Machine Learning model for predicting future trends in Education Expenditure (%GDP).
- View the model's prediction in the "Regression Model Results" section.

## How to Use

1. Navigate through the tabs to explore different aspects of the economic data.
2. In the "Visualization" tab, select a country and an economic indicator to view historical trends.
3. Use the 3D Visualization tab to explore economic indicators in a three-dimensional space.
4. In the "Future Trends" tab, input numeric values and click "Predict" to get future trend predictions for Education Expenditure (%GDP).

## Notes

- This app covers 20 countries, including Argentina, Australia, Brazil, Canada, China, France, Germany, India, Indonesia, Italy, Japan, Korea, Mexico, Saudi Arabia, South Africa, Turkey, United Arab Emirates, United Kingdom, and the United States.
- The Regression Machine Learning model is utilized for predicting Education Expenditure (%GDP) based on the input parameters.

## Getting Started

1. Open the app by running `shiny::runApp("app_directory_path")` in RStudio.
2. Ensure you have the required packages installed using `install.packages(c("shiny", "leaflet", "DT", "scatterplot3d", "rgl", "tidyverse", "randomForest"))`.

## PowerBI Report

Check out the [PowerBI report](https://github.com/simran08udhani/RLabBasedProject/blob/main/R%20project%20Report.pbix) for visualizations and insights complementing the Shiny app.

## Credits

This app was developed using the Shiny framework and various R packages. Data is sourced from the World Bank, and the Regression Machine Learning model is built using the "ML_education_expenditure_model.R" script.

## Author

Simran Udhani

## License

The Global Economic Dashboard is licensed under the [MIT License](LICENSE).

---
Feel free to contribute, report issues, or suggest improvements!

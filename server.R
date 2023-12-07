library("DT")
library("tidyverse")
library(shiny)
library("scatterplot3d")
library("rgl")

library(randomForest)
# Load your data and model from "project.R"
source("ML_education_expenditure_model.R")

countries <- read_csv("data/cn_filter.csv")
data <- df # Assuming df is loaded from project.R
rf_model <- rf_model # Assuming your_rf_model is loaded from project.R

function(input, output, session) {
  output$visualization_3d <- renderPlot({
    selected_indicator <- input$select_indicator_3d
    selected_year <- input$select_year_3d
    
    if (selected_indicator == "scatterplot3d") {
      if (selected_year == 2012) {
        scatterplot3d(
          x = countries$`Agriculture (% GDP)`[countries$Year == 2012],
          y = countries$`Industry (% GDP)`[countries$Year == 2012],
          z = countries$`Service (% GDP)`[countries$Year == 2012],
          color = rainbow(sum(countries$Year == 2012)),
          main = "3D Scatterplot - 2012",
          xlab = "Agriculture (%GDP)",
          ylab = "Industry (%GDP)",
          zlab = "Service (%GDP)",
          pch = 17
        )
      } else if (selected_year == 2022) {
        scatterplot3d(
          x = countries$`Agriculture (% GDP)`[countries$Year == 2022],
          y = countries$`Industry (% GDP)`[countries$Year == 2022],
          z = countries$`Service (% GDP)`[countries$Year == 2022],
          color = rainbow(sum(countries$Year == 2022)),
          main = "3D Scatterplot - 2022",
          xlab = "Agriculture (%GDP)",
          ylab = "Industry (%GDP)",
          zlab = "Service (%GDP)",
          pch = 17
        )
      }
    }
  })
  
  output$rgl_plot <- renderRglwidget({
    selected_indicator <- input$select_indicator_3d
    selected_year <- input$select_year_3d
    
    if (selected_indicator == "rgl") {
      if (selected_year == 2012) {
        with(countries[countries$Year == 2012, ], {
          rgl.open()
          plot3d(
            x = `Agriculture (% GDP)`,
            y = `Industry (% GDP)`,
            z = `Service (% GDP)`,
            col = "blue",
            type = "s",
            size = 1.5,
            xlab = "Agriculture as % of GDP",
            ylab = "Education Expenditure as % of GDP",
            zlab = "Health Expenditure as % of GDP"
          )
          rglwidget()
        })
      } else if (selected_year == 2022) {
        with(countries[countries$Year == 2022, ], {
          rgl.open()
          plot3d(
            x = `Agriculture (% GDP)`,
            y = `Industry (% GDP)`,
            z = `Service (% GDP)`,
            col = "blue",
            type = "s",
            size = 1.5,
            xlab = "Agriculture as % of GDP",
            ylab = "Education Expenditure as % of GDP",
            zlab = "Health Expenditure as % of GDP"
          )
          rglwidget()
        })
      }
    }
  })
  
  output$data_tab <- renderDT({
    as_tibble(countries) %>%
      datatable(rownames = input$show_rownames, extensions="Responsive")
  })
  
  updateSelectInput(session,
                    "select_country_with_updateSelectInput",
                    choices = unique(countries$`Country Name`))
  
  output$visualization_tab <- renderPlot({
    selected_country <- input$select_country_with_updateSelectInput
    selected_indicator <- input$selected_indicator_labelled_manual
    
    selected_data <- countries %>%
      filter(`Country Name` == selected_country) %>%
      select(Year, !!sym(selected_indicator)) %>%
      drop_na()
    
    ggplot(selected_data, aes(x = Year, y = !!sym(selected_indicator))) +
      geom_line() +
      labs(
        title = paste(selected_indicator, "in", selected_country),
        x = "Year",
        y = selected_indicator
      )
  })
  
  observeEvent(input$predict_button, {
    isolate({
      if (!is.null(input$Export....GDP.) && !is.null(input$Health.Expenditure....GDP.) && !is.null(input$Import....GDP.) && !is.null(input$Industry....GDP.) && !is.null(input$Inflation.Rate)) {
        # Create a new data frame with the numeric Age, Category, Size, Gender, and Channel
        new_data <- data.frame( Export....GDP.= input$Export....GDP., Health.Expenditure....GDP. = input$Health.Expenditure....GDP., Import....GDP. = input$Import....GDP., Industry....GDP. = input$Industry....GDP., Inflation.Rate = input$Inflation.Rate)
        
        # Predict using the random forest model
        predictions <- predict(rf_model, new_data)
        # Extract the first prediction
        prediction <- predictions[1]
        output$prediction_result <- renderText({
          paste("Predicted Amount:", round(as.numeric(prediction), 2))
        })
      } else {
        output$prediction_result <- renderText({
          "Please enter Age, Category, Size, Gender, and Channel to predict the Amount."
        })
      }
    })
  })
  
}
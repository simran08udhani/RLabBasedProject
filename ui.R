# library(shiny)
# library(shinydashboard)
# library("leaflet")
# library("DT")
# library("scatterplot3d")
# library("rgl")
# 
# source("ML_education_expenditure_model.R")
# countries <- read_csv("data/cn_filter.csv")
# data <- df
# rf_model <- rf_model
# 
# fluidPage(
#   theme = "custom.css",
#   titlePanel(strong("Global Economic Dashboard")),
#   sidebarLayout(
#     sidebarPanel(
#       wellPanel(
#         h4("Welcome to the Global Economic Dashboard!"),
#         p("This interactive Shiny app provides a comprehensive overview of key economic indicators for a selection of countries."),
#         p("Explore data on agriculture, ease of doing business, education expenditure, exports, GDP, health expenditure, imports, industry, inflation rate, R&D, service sector, unemployment, population, land area, and more."),
#         p("Navigate through the tabs to visualize and analyze the economic performance of countries such as Argentina, Australia, Brazil, Canada, China, France, Germany, India, Indonesia, Italy, Japan, Korea, Mexico, Saudi Arabia, South Africa, Turkey, United Arab Emirates, United Kingdom, and the United States."),
#         p("Use the interactive features to compare countries, track trends over the years, and gain insights into the economic landscapes across continents."),
#         p("Whether you are a policymaker, researcher, or curious enthusiast, this Global Economic Dashboard offers a user-friendly interface to explore and understand the dynamics of these diverse economies."),
#         p("Start your exploration now and uncover the stories behind the numbers!")
#       )
#     ),
#     mainPanel(
#       tabsetPanel(
#         tabPanel("Data",
#                  checkboxInput("show_rownames", label = "Show rownames?"),
#                  DTOutput("data_tab")
#         ),
#         tabPanel("Visualization",
#                  fluidPage(
#                    fluidRow(
#                      column(
#                        selectInput("select_country_with_updateSelectInput",
#                                    label = "Choose a country:",
#                                    choices = NULL), width = 6
#                      ),
#                      column(
#                        selectInput(
#                          "selected_indicator_labelled_manual",
#                          "Select an indicator to display",
#                          choices = c(
#                            "Health Expenditure (% GDP)",
#                            "Education Expenditure (% GDP)" ,
#                            "Export (% GDP)" ,
#                            "Ease of Doing Business",
#                            "GDP","R&D"
#                          ),
#                          width = "100%"
#                        ),
#                        width = 6
#                      )
#                    ),
#                    plotOutput("visualization_tab")
#                  )
#         ),
#         tabPanel("3D Visualization",
#                  fluidPage(
#                    fluidRow(
#                      column(
#                        selectInput("select_indicator_3d",
#                                    label = "Select Indicator",
#                                    choices = c("scatterplot3d", "rgl")),
#                        width = 6
#                      ),
#                      column(
#                        selectInput("select_year_3d",
#                                    label = "Select Year",
#                                    choices = c(2012, 2022),
#                                    selected = 2012),
#                        width = 6
#                      )
#                    ),
#                    rglwidgetOutput("rgl_plot") ,
#                    plotOutput("visualization_3d")
#                  )
#         ),
#         tabPanel("Future Trends",
#                  numericInput("Export....GDP.", "Export (% GDP)", min = 10.20, max = 98.34, value = 30.54),
#                  numericInput("Health.Expenditure....GDP.", "Health Expenditure (% GDP):", min = 2.668 , max = 18.816  , value = 7.864),
#                  numericInput("Import....GDP.", "Import (% GDP)", min = 11.78, max = 74.46, value = 28.75),
#                  numericInput("Industry....GDP.", "Industry (% GDP)", min = 16.50, max = 62.21, value = 28.75),
#                  numericInput("Inflation.Rate", "Inflation Rate", min = -2.093 , max = 72.309, value = 4.081),
#                  actionButton("predict_button", "Predict"),
#                  br(),
#                  h3("Random Forest Model Results:"),
#                  textOutput("prediction_result")
#         )
#       )
#     )
#   )
# )





library(shiny)
library(shinydashboard)
library("leaflet")
library("DT")
library("scatterplot3d")
library("rgl")
library("tidyverse")

source("ML_education_expenditure_model.R")
countries <- read_csv("data/cn_filter.csv")
data <- df
rf_model <- rf_model

fluidPage(
  theme = "custom.css",
  titlePanel("Global Economic Dashboard", windowTitle = "Global Economic Dashboard"),
  sidebarLayout(
    sidebarPanel(
      wellPanel(
        h4("Welcome to the Global Economic Dashboard!"),
        p("This interactive Shiny app provides a comprehensive overview of key economic indicators for a selection of countries."),
        p("Explore data on agriculture, ease of doing business, education expenditure, exports, GDP, health expenditure, imports, industry, inflation rate, R&D, service sector, unemployment, population, land area, and more."),
        p("Navigate through the tabs to visualize and analyze the economic performance of countries such as Argentina, Australia, Brazil, Canada, China, France, Germany, India, Indonesia, Italy, Japan, Korea, Mexico, Saudi Arabia, South Africa, Turkey, United Arab Emirates, United Kingdom, and the United States."),
        p("Use the interactive features to compare countries, track trends over the years, and gain insights into the economic landscapes across continents."),
        p("Whether you are a policymaker, researcher, or curious enthusiast, this Global Economic Dashboard offers a user-friendly interface to explore and understand the dynamics of these diverse economies."),
        p("Start your exploration now and uncover the stories behind the numbers!")
      )
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Data",
                 checkboxInput("show_rownames", label = "Show rownames?"),
                 DTOutput("data_tab")
        ),
        tabPanel("Visualization",
                 fluidPage(
                   fluidRow(
                     column(
                       selectInput("select_country_with_updateSelectInput",
                                   label = "Choose a country:",
                                   choices = NULL), width = 6
                     ),
                     column(
                       selectInput(
                         "selected_indicator_labelled_manual",
                         "Select an indicator to display",
                         choices = c(
                           "Health Expenditure (% GDP)",
                           "Education Expenditure (% GDP)",
                           "Export (% GDP)",
                           "Ease of Doing Business",
                           "GDP",
                           "R&D"
                         ),
                         width = "100%"
                       ),
                       width = 6
                     )
                   ),
                   plotOutput("visualization_tab")
                 )
        ),
        tabPanel("3D Visualization",
                 fluidPage(
                   fluidRow(
                     column(
                       selectInput("select_indicator_3d",
                                   label = "Select Indicator",
                                   choices = c("scatterplot3d", "rgl")),
                       width = 6
                     ),
                     column(
                       selectInput("select_year_3d",
                                   label = "Select Year",
                                   choices = c(2012, 2022),
                                   selected = 2012),
                       width = 6
                     )
                   ),
                   rglwidgetOutput("rgl_plot"),
                   plotOutput("visualization_3d")
                 )
        ),
        tabPanel("Future Trends",
                 numericInput("Export....GDP.", "Export (% GDP)", min = 10.20, max = 98.34, value = 30.54),
                 numericInput("Health.Expenditure....GDP.", "Health Expenditure (% GDP):", min = 2.668, max = 18.816, value = 7.864),
                 numericInput("Import....GDP.", "Import (% GDP)", min = 11.78, max = 74.46, value = 28.75),
                 numericInput("Industry....GDP.", "Industry (% GDP)", min = 16.50, max = 62.21, value = 28.75),
                 numericInput("Inflation.Rate", "Inflation Rate", min = -2.093, max = 72.309, value = 4.081),
                 actionButton("predict_button", "Predict"),
                 br(),
                 h3("Random Forest Model Results:"),
                 textOutput("prediction_result")
        )
      )
    )
  )
)

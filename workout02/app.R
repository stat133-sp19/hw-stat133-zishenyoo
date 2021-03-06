############################################
# Savings and Annuity Simulator 
# Zishen Liu
# UC Berkeley 
# Professor 
# Statistics 133
############################################

library(shiny)
library(ggplot2)
library(tidyr)


# Define UI for application
ui <- fluidPage(
  # Application title
  titlePanel("Modes of Investment"),
  fluidRow(
    column(
      4,
      sliderInput(
        "initialamount",
        label = "Initial Amount",
        min = 1,
        max = 100000,
        value = 1000
      )
      
    ),
    column(
      4,
      sliderInput(
        "rrate",
        label = "Return Rate(in %)",
        min = 0,
        max = 20,
        value = 5
      )
    ),
    column(4,
           sliderInput(
             "years",
             label = "Years",
             min = 0,
             max = 50,
             value = 20
           ))
  ),
  fluidRow(
    column(
      4,
      sliderInput(
        "annualcontrib",
        label = "Annual Contribution",
        min = 0,
        max = 50000,
        value = 2000
      )
      
    ),
    column(
      4,
      sliderInput(
        "grate",
        label = "Growth Rate (in %)",
        min = 0,
        max = 20,
        value = 2
      )
    ),
    column(4,
           selectInput("facet",
                       "Facet?",
                       c("No",
                         "Yes")))
  )
  ,
  
  h4("Timelines"),
  fluidRow(plotOutput("freqs_plot")),
  h4("Balances"),
  verbatimTextOutput("summary")
  
  
)

#' @title Future Value Function
#' @description computes the future value of an investment
#' @param amount initial invested amount
#' @param rate annual rate of return
#' @param years number of years
#' @return the Future Value of an investment

future_value <- function(amount, rate, years) {
  fv = amount * (1 + rate) ^ years
  return(fv)
}

#' @title Future Value of Annuity Function
#' @description computes the Future Value of Annuity
#' @param contrib contributed amount
#' @param rate annual rate of return
#' @param years number of years
#' @return the Future Value of Annuity

annuity <- function(contrib, rate, years) {
  fva = contrib * ((1 + rate) ^ years - 1) / rate
  return(fva)
}

#' @title Future Value of Annuity Function
#' @description computes the Future Value of Annuity
#' @param contrib contributed amount
#' @param rate annual rate of return
#' @param years number of years
#' @return the Future Value of Annuity

growing_annuity <- function(contrib, rate, growth, years) {
  fvga = contrib * ((1 + rate) ^ years - (1 + growth) ^ years) / (rate - growth)
  return(fvga)
}

# Define server logic required to draw the plot
server <- function(input, output) {
  modalities <- reactive({
    n <- input$years + 1
    no_contrib <- vector("double", n)
    fixed_contrib <- vector("double", n)
    growing_contrib <- vector("double", n)
    
    for (k in 1:n) {
      no_contrib[k] <-
        future_value(input$initialamount, input$rrate / 100, years = k - 1)
      fixed_contrib[k] <-
        future_value(input$initialamount, input$rrate / 100, years = k - 1) + annuity(input$annualcontrib, input$rrate /
                                                                                        100, years = k -
                                                                                        1)
      growing_contrib[k] <-
        future_value(input$initialamount, input$rrate / 100, years = k - 1) + growing_annuity(input$annualcontrib,
                                                                                              input$rrate / 100,
                                                                                              input$grate / 100,
                                                                                              years = k -
                                                                                                1)
    }
    
    modalities <-
      data.frame(
        year = c(0:input$years),
        no_contrib = no_contrib,
        fixed_contrib = fixed_contrib,
        growing_contrib = growing_contrib
      )
  })
  
  output$freqs_plot <- renderPlot({
    df <-
      modalities() %>% gather(modality,
                              value,
                              no_contrib,
                              fixed_contrib,
                              growing_contrib)
    
    df$modality <-
      factor(df$modality,
             levels = c("no_contrib", "fixed_contrib", "growing_contrib"))
    if (input$facet == 'Yes') {
      ggplot(df, aes(
        x = year,
        y = value,
        colour = modality
      )) +
        geom_line() + geom_point() + ggtitle("Three modes of Investing") + facet_wrap( ~
                                                                                         modality) + geom_area(aes(fill = modality, group = modality),
                                                                                                               alpha = 0.5) +
        theme_bw()
    } else{
      ggplot(df, aes(
        x = year,
        y = value,
        colour = modality
      )) +
        geom_line() + geom_point() + ggtitle("Three modes of Investing")
    }
    
  })
  
  output$summary <- renderPrint({
    head(modalities(), input$years + 1)
  })
}


# Run the application
shinyApp(ui = ui, server = server)
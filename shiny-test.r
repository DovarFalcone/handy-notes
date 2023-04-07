library(shiny)

# Define UI
ui <- fluidPage(
  # Application title
  titlePanel("Hello Shiny!"),

  # Sidebar with a slider input
  sidebarLayout(
    sidebarPanel(
      sliderInput("num_points",
                  "Number of Points:",
                  min = 1,
                  max = 100,
                  value = 50)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("plot")
    )
  )
)

# Define server
server <- function(input, output) {
  output$plot <- renderPlot({
    x <- rnorm(input$num_points)
    hist(x)
  })
}

# Run the application
shinyApp(ui = ui, server = server)

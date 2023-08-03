library(shiny)
library(shinydashboard)

# UI part of the Shiny app
ui <- dashboardPage(
  dashboardHeader(title = "Embedded URL in ShinyDashboard"),
  dashboardSidebar(),
  dashboardBody(
    # Use iframe to embed a URL
    tags$iframe(src = "https://example.com", width = "100%", height = "800px")
  )
)

# Server part of the Shiny app (you can leave this part empty if you don't have any reactive elements)
server <- function(input, output) {
}

# Run the Shiny app
shinyApp(ui, server)

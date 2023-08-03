library(shiny)
library(shinydashboard)

# UI part of the Shiny app
ui <- dashboardPage(
  dashboardHeader(title = "Custom Page in ShinyDashboard"),
  dashboardSidebar(),
  dashboardBody(
    # Use tags$div and includeHTML to display the custom HTML content
    tags$div(
      htmltools::includeHTML("custom_page.html")
    )
  )
)

# Server part of the Shiny app (you can leave this part empty if you don't have any reactive elements)
server <- function(input, output) {
}

# Run the Shiny app
shinyApp(ui, server)

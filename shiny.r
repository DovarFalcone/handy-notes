library(shiny)
library(shinydashboard)

# Read the content of the custom_page.html file
custom_html <- readLines("custom_page.html", warn = FALSE)

# UI part of the Shiny app
ui <- dashboardPage(
  dashboardHeader(title = "Custom Page in ShinyDashboard"),
  dashboardSidebar(),
  dashboardBody(
    # Use renderUI and uiOutput to display the custom HTML content
    shiny::uiOutput("custom_html")
  )
)

# Server part of the Shiny app
server <- function(input, output) {
  # Render the custom HTML content
  output$custom_html <- shiny::renderUI({
    HTML(paste(custom_html, collapse = "\n"))
  })
}

# Run the Shiny app
shinyApp(ui, server)

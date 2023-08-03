library(shiny)
library(shinydashboard)

# Read the content of the custom_page.html file
custom_html <- readLines("custom_page.html", warn = FALSE)
custom_html <- paste(custom_html, collapse = "\n")

# UI part of the Shiny app
ui <- dashboardPage(
  dashboardHeader(title = "Custom Page in ShinyDashboard"),
  dashboardSidebar(),
  dashboardBody(
    # Use HTML to display the custom HTML content
    HTML(custom_html)
  )
)

# Server part of the Shiny app (you can leave this part empty if you don't have any reactive elements)
server <- function(input, output) {
}

# Run the Shiny app
shinyApp(ui, server)

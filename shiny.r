# Load required libraries
library(shiny)
library(shinydashboard)

# Get the absolute path to the custom_page.html file
custom_page_path <- file.path(Sys.getenv("HOME"), "path_to_custom_page_folder", "custom_page.html")

# UI part of the Shiny app
ui <- dashboardPage(
  dashboardHeader(title = "Custom Page in ShinyDashboard"),
  dashboardSidebar(),
  dashboardBody(
    # Use iframe to display the custom HTML content
    tags$iframe(src = custom_page_path, width = "100%", height = "100%")
  )
)

# Server part of the Shiny app (you can leave this part empty if you don't have any reactive elements)
server <- function(input, output) {
}

# Run the Shiny app
shinyApp(ui, server)

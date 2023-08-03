library(shiny)
library(shinydashboard)
library(markdown)

ui <- dashboardPage(
  dashboardHeader(title = "Shiny Dashboard with R Markdown Tab"),
  dashboardSidebar(
    # Your sidebar content here (if any)
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "dashboard",
        # Your dashboard content here
        h2("This is the dashboard content")
      ),
      tabItem(tabName = "rmarkdown_tab",
        # Use uiOutput to render the .html content from the .Rmd file
        uiOutput("rmarkdown_output")
      )
    )
  )
)

server <- function(input, output) {
  # Render the .html content from the .Rmd file as UI output
  output$rmarkdown_output <- renderUI({
    # Read the .html content from the .Rmd file
    rmarkdown_content <- readLines("report.html", warn = FALSE)

    # Convert the .html content to HTML
    HTML(paste(rmarkdown_content, collapse = "\n"))
  })
}

shinyApp(ui, server)

library(shiny)
library(shinydashboard)
library(htmltools)

ui <- dashboardPage(
  dashboardHeader(title = "Shiny Dashboard with R Markdown Tab"),
  dashboardSidebar(
    # Your sidebar content here (if any)
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "dashboard",
        # Your dashboard content here
        h2("This is the dashboard content")
      ),
      tabItem(tabName = "rmarkdown_tab",
        # Use htmltools::tags$iframe to embed the R Markdown content
        htmltools::tags$iframe(src = "report.html", width = "100%", height = "100%")
      )
    )
  )
)

server <- function(input, output) {
  # Server logic goes here, if needed
}

shinyApp(ui, server)

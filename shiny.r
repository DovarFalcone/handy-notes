library(shiny)
library(shinydashboard)
library(rmarkdown)

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
        # Use uiOutput to render the R Markdown content
        uiOutput("rmarkdown_output")
      )
    )
  )
)

server <- function(input, output) {
  # Render the R Markdown content as Shiny UI elements
  output$rmarkdown_output <- renderUI({
    # Read the R Markdown file
    rmarkdown_content <- rmarkdown::render("report.Rmd")

    # Return the HTML content of the rendered R Markdown
    HTML(rmarkdown_content)
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

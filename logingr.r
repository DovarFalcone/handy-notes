##ui.r
library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "My ShinyDashboard App"),
  dashboardSidebar(
    # ... your sidebar content ...
  ),
  dashboardBody(
    tags$h2("Record inputs change"),
    tags$script('
      // JavaScript code to show logs in the browser console
      Shiny.addCustomMessageHandler("consoleLogs", function(message) {
        console.log(message);
      });
    '),
    
    # ... your UI components ...
  )
)





##server.r
library(shiny)
library(shinydashboard)

server <- function(input, output, session) {
  observe({
    # Log a message to the browser console using custom message
    session$sendCustomMessage("consoleLogs", "This is a log message from Shiny app.")
  })
  
  # ... your server logic ...
}

shinyApp(ui, server)

##server.r with shinylogs
library(shiny)
library(shinylogs)

server <- function(input, output, session) {
  # temporary directory for writing logs
  tmp <- tempdir()

  # when app stop,
  # navigate to the directory containing logs
  onStop(function() {
    browseURL(url = tmp)
  })

  # Store JSON with logs in the temp dir
  track_usage(
    storage_mode = store_json(path = tmp)
  )
  }

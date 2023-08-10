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
library(shinylogs)

server <- function(input, output, session) {
  # Show logs in the browser console
  observeEvent(get_usage(), {
    logs <- get_usage()$log_messages
    logs <- paste(logs, collapse = "\n")
    session$sendCustomMessage("consoleLogs", logs)
  })

  # Track inputs change
  track_usage(storage_mode = store_null())

  # ... your server logic ...

}

shinyApp(ui, server)


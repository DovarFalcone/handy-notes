##ui.r
library(shiny)

ui <- fluidPage(
  tags$h2("Record inputs change"),
  tags$script('
    // JavaScript code to show logs in the browser console
    Shiny.addCustomMessageHandler("consoleLogs", function(message) {
      console.log(message);
    });

    // Rest of your Shiny UI components
  '),
  
  # ... your UI components ...
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

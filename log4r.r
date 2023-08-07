# Load required libraries
library(shiny)
library(log4r)

# Initialize the logger to log to a file
log_file_appender("app.log", threshold = "INFO")
log_threshold("INFO")

# Define the Shiny server function
server <- function(input, output, session) {
  
  # Log session information at the start of the app
  loginfo("Shiny app started.")
  loginfo("Session ID:", session$token)
  loginfo("Client address:", session$clientData$session$clientAddress)
  loginfo("User agent:", session$clientData$session$userAgent)
  loginfo("Server address:", session$clientData$url_protocol$HTTP_HOST)
  loginfo("App path:", session$clientData$url_pathname)
  
  observe({
    # Some computation or data manipulation
    loginfo("Data manipulation completed.")
    # More code...
  })
  
  output$plot <- renderPlot({
    # Some plotting code
    logdebug("Plot rendering started.")
    # More code...
  })
  
  observeEvent(input$button, {
    # Some action taken upon button click
    logwarn("Button clicked with input:", input$button)
    # More code...
  })
  
  # More server code...
  
  # Log session information when the app is closed
  session$onSessionEnded(function() {
    loginfo("Shiny app session ended.")
  })
}

# Run the Shiny app
shinyApp(ui, server)

# server.R
library(shiny)
library(log4r)

# Define the logger
logger <- log4r::logger("my_app")

# Configure the appender to log to a file
log_file <- file("app.log")
appender <- log4r::fileAppender("file_appender", file = log_file)
log4r::appender(logger) <- appender

# Set log level (DEBUG, INFO, WARN, ERROR, FATAL)
log4r::threshold(logger) <- "DEBUG"

function(input, output, session) {
  # Your server logic goes here...

  # Example: Log an info message when a button is clicked
  observeEvent(input$button_click, {
    log4r::info(logger, "Button clicked.")
    # Your other code here...
  })

  # Example: Log an error when an error occurs
  observeEvent(input$error_button_click, {
    tryCatch({
      # Your code that may raise an error
      stop("An example error occurred.")
    }, error = function(e) {
      log4r::error(logger, "An error occurred:", conditionMessage(e))
      log4r::error(logger, "Stack Trace:", conditionCall(e))
    })
  })

}

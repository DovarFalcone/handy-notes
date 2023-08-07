# server.R
library(shiny)
library(shinydashboard)
library(log4r)

# Initialize the logger
logger <- log4r::logger()

# Configure the appender to log to a file
log_file <- file("app.log")
appender <- log4r::fileAppender("file_appender", file = log_file)
log4r::appender(logger) <- appender

# Set log level (DEBUG, INFO, WARN, ERROR, FATAL)
log4r::threshold(logger) <- "INFO"  # Adjust log level as needed

server <- function(input, output) {

  # Function to log button clicks
  log_button_click <- function(button_name) {
    log4r::info(logger, paste("Button clicked:", button_name))
  }

  # Observe button clicks and log them
  observeEvent(input$count, {
    log_button_click("Progress Button")
  })
  observeEvent(input$approval, {
    log_button_click("Approval Button")
  })

  # ... Your other server logic ...

}

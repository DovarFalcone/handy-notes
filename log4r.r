library(shiny)
library(shinydashboard)

# Function to log button clicks
log_button_click <- function(button_name) {
  message(paste("Button clicked:", button_name))
}

# Observe button clicks and log them
observeEvent(input$count, {
  log_button_click("Progress Button")
})
observeEvent(input$approval, {
  log_button_click("Approval Button")
})

# ... Your other server logic ...

# Redirect R console output to a log file
log_file <- "app.log"
sink(log_file, append = TRUE, split = TRUE)
on.exit(sink(NULL))  # To close the connection when the app exits

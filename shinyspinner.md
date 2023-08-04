library(shiny)
library(shinyjs)

ui <- fluidPage(
  useShinyjs(),  # Initialize shinyjs

  # Tabbed content
  tabsetPanel(
    id = "tabs",
    tabPanel("Tab 1",
      # ... UI components for Tab 1 ...
      actionButton("query_button_1", "Send Query in Tab 1")
    ),

    tabPanel("Tab 2",
      # ... UI components for Tab 2 ...
      actionButton("query_button_2", "Send Query in Tab 2")
    )
  ),

  # ... other UI components ...
)

server <- function(input, output, session) {
  # Function to execute the query and show a notification
  shinyjs::onclick("query_button_1", {
    showNotification("Query in Tab 1 is running...", duration = 3, closeButton = FALSE)

    # Simulate a delay for the query execution
    query_duration <- 3  # Adjust the sleep duration as needed
    Sys.sleep(query_duration)

    showNotification("Query in Tab 1 completed!", duration = 3, closeButton = FALSE)
  })

  shinyjs::onclick("query_button_2", {
    showNotification("Query in Tab 2 is running...", duration = 3, closeButton = FALSE)

    # Simulate a delay for the query execution
    query_duration <- 5  # Adjust the sleep duration as needed
    Sys.sleep(query_duration)

    showNotification("Query in Tab 2 completed!", duration = 3, closeButton = FALSE)
  })
}

shinyApp(ui, server)

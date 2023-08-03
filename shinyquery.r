## global.r
# Load required libraries
library(RPostgreSQL)

# Database connection parameters (common for all servers)
db_params <- list(
  dbname = "your_db_name",
  host = "",  # The specific server name will be provided later
  port = 5432,  # Your port number, default is 5432 for PostgreSQL
  user = "your_username",
  password = "your_password"
)

# Function to perform the database query for a given server
perform_query <- function(server_name) {
  conn_params <- db_params
  conn_params$host <- server_name
  
  conn <- dbConnect(PostgreSQL(), dbname = conn_params$dbname, host = conn_params$host,
                    port = conn_params$port, user = conn_params$user, password = conn_params$password)

  query <- "SELECT * FROM your_table;"  # Replace with your actual query

  print(paste("Executing query for server", server_name, "..."))
  data <- dbGetQuery(conn, query)

  dbDisconnect(conn)
  print(paste("Query executed successfully for server", server_name, "."))
  return(data)
}


## ui.r
library(shiny)
library(shinydashboard)

# Define the UI
ui <- dashboardPage(
  dashboardHeader(title = "Multiple PostgreSQL Servers Query App"),
  dashboardSidebar(),
  dashboardBody(
    fluidRow(
      box(
        title = "Combined Query Result",
        status = "primary",
        solidHeader = TRUE,
        width = 12,
        dataTableOutput("combined_result")
      )
    ),
    fluidRow(
      box(
        title = "Send Query to All Servers",
        status = "info",
        solidHeader = TRUE,
        width = 6,
        actionButton("send_query", "Send Query")
      )
    )
  )
)

## server.r
# Load required libraries
library(shiny)
library(shinydashboard)

# Include the global.R file
source("global.R")

# Define the server function
server <- function(input, output) {
  # Function to get the combined result from all servers
  get_combined_result <- function() {
    # Replace the server names with your actual server names
    servers <- c("server1", "server2", "server3")

    combined_data <- lapply(servers, perform_query)
    combined_data <- do.call(rbind, combined_data)

    return(combined_data)
  }

  # Button event handler
  observeEvent(input$send_query, {
    output$combined_result <- renderDataTable({
      data <- get_combined_result()
      data
    })
  })
}


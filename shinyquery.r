library(shiny)
library(shinydashboard)
library(RPostgreSQL)

# Database connection parameters
db_params <- list(
  dbname = "your_db_name",
  host = "your_host",
  port = 5432,  # Your port number, default is 5432 for PostgreSQL
  user = "your_username",
  password = "your_password"
)

# UI
ui <- dashboardPage(
  dashboardHeader(title = "PostgreSQL Query App"),
  dashboardSidebar(),
  dashboardBody(
    fluidRow(
      box(
        title = "Query Result",
        status = "primary",
        solidHeader = TRUE,
        width = 6,
        dataTableOutput("query_result")
      )
    ),
    fluidRow(
      box(
        title = "Send Query",
        status = "info",
        solidHeader = TRUE,
        width = 6,
        actionButton("send_query", "Send Query")
      )
    )
  )
)

# Server
server <- function(input, output) {
  # Function to perform the database query
  perform_query <- function() {
    conn <- dbConnect(PostgreSQL(), dbname = db_params$dbname, host = db_params$host,
                      port = db_params$port, user = db_params$user, password = db_params$password)
    
    query <- "SELECT * FROM your_table;"  # Replace with your actual query
    
    print("Executing query...")
    data <- dbGetQuery(conn, query)
    
    dbDisconnect(conn)
    print("Query executed successfully.")
    return(data)
  }
  
  # Button event handler
  observeEvent(input$send_query, {
    output$query_result <- renderDataTable({
      data <- perform_query()
      data
    })
  })
}

# Run the application
shinyApp(ui, server)

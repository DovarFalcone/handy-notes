To show a spinning icon (loading spinner) while the queries are running in your Shiny dashboard, you can use the `shinycssloaders` package, which provides a variety of loading spinner options.

Here's how you can do it:

1. Install the Required Package:

   First, make sure you have the `shinycssloaders` package installed. You can install it from CRAN using the `install.packages` function:

   ```r
   install.packages("shinycssloaders")
   ```

2. Load the Required Libraries:

   In your Shiny app script, load the required libraries:

   ```r
   library(shiny)
   library(shinycssloaders)
   ```

3. Use the `withSpinner` Function:

   Wrap the part of your app where you want the loading spinner to be displayed using the `withSpinner` function. Typically, you want to wrap the query execution code in the `server` function.

   ```r
   server <- function(input, output, session) {
     # ... other server code ...

     observeEvent(input$query_button, {
       # Show the loading spinner while the query is running
       withSpinner({
         # Execute your query or time-consuming operation here
         # Replace this with your actual query execution code
         Sys.sleep(3)  # Simulate a delay of 3 seconds
       })
     })

     # ... other server code ...
   }
   ```

   In this example, the `withSpinner` function will display the loading spinner while the query is executing. Replace `Sys.sleep(3)` with your actual query execution code.

4. Add the Spinner to the UI:

   In the `ui` function of your Shiny app, add the `spinnerOutput` function to display the spinner in the UI:

   ```r
   ui <- fluidPage(
     # ... other UI components ...

     # Add the spinner to the UI
     spinnerOutput("query_spinner"),

     # ... other UI components ...
   )
   ```

5. Define Spinner Output:

   In the `server` function, define the output for the spinner:

   ```r
   server <- function(input, output, session) {
     # ... other server code ...

     output$query_spinner <- renderUI({
       # Render the spinner in the UI
       spinner("query_spinner")
     })

     # ... other server code ...
   }
   ```

That's it! With these steps, when you click the button to execute the query, the loading spinner will be displayed in the UI while the query is running. Once the query execution is complete, the spinner will disappear, and the results or any other outputs will be displayed in the UI. The `shinycssloaders` package offers different styles and customization options for the loading spinner. You can explore those options in the package documentation to find the one that best fits your Shiny app's style.

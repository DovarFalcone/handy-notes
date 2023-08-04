Apologies for the confusion. I made a mistake in the previous response. The `spinnerOutput` function does not exist in Shiny. To display a loading spinner while the query is running, you can use the `shinyjs` package along with custom CSS to achieve the desired effect. Here's how you can do it:

1. Install the Required Packages:

   Make sure you have the `shinyjs` package installed. You can install it from CRAN using the `install.packages` function:

   ```r
   install.packages("shinyjs")
   ```

2. Load the Required Libraries:

   In your Shiny app script, load the required libraries:

   ```r
   library(shiny)
   library(shinyjs)
   ```

3. Use `shinyjs` to Show and Hide Spinner:

   Add the following JavaScript code to your Shiny app to show and hide the spinner:

   ```r
   shinyjs::jsCode(
     'shinyjs.showSpinner = function() {
        $(".spinner").show();
      }'
   )

   shinyjs::jsCode(
     'shinyjs.hideSpinner = function() {
        $(".spinner").hide();
      }'
   )
   ```

4. Define the UI:

   In the `ui` function of your Shiny app, define the spinner along with your other UI components:

   ```r
   ui <- fluidPage(
     useShinyjs(),  # Initialize shinyjs

     # Add the spinner (replace with your desired HTML/CSS for the spinner)
     tags$div(class = "spinner", "Loading..."),

     # ... other UI components ...

     actionButton("query_button", "Send Query")
   )
   ```

   Replace `tags$div(class = "spinner", "Loading...")` with your desired HTML/CSS for the spinner. You can style the spinner using custom CSS.

5. Use `shinyjs` in the `server` Function:

   In the `server` function, use `shinyjs` to show and hide the spinner as needed:

   ```r
   server <- function(input, output, session) {
     observeEvent(input$query_button, {
       shinyjs::js$showSpinner()  # Show the spinner before executing the query

       # Execute your query or time-consuming operation here
       # Replace this with your actual query execution code
       Sys.sleep(3)  # Simulate a delay of 3 seconds

       shinyjs::js$hideSpinner()  # Hide the spinner after query execution
     })
   }
   ```

   Replace `Sys.sleep(3)` with your actual query execution code.

With these changes, when you click the "Send Query" button, the spinner will be displayed while the query is running. Once the query execution is complete, the spinner will disappear, and the results or any other outputs will be displayed in the UI. Remember to customize the spinner's appearance using CSS to match your app's style.

To display a loading spinner while the query is running, you can use the `shinyjs` package along with custom CSS to achieve the desired effect. Here's how you can do it:

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

You should put the `shinyjs::jsCode` calls in the `ui` file of your Shiny app. The `shinyjs::jsCode` function is used to include custom JavaScript code, which is typically placed in the `ui` section.

Here's how you should structure your `ui` file:

```r
# ui.R
library(shiny)
library(shinyjs)

shinyUI(fluidPage(
  useShinyjs(),  # Initialize shinyjs

  # Add the spinner (replace with your desired HTML/CSS for the spinner)
  tags$div(class = "spinner", "Loading..."),

  # ... other UI components ...

  actionButton("query_button", "Send Query")
))
```

The `shinyjs::jsCode` calls are included directly in the `ui` section, alongside other UI components. In this example, the spinner is placed inside the `tags$div(class = "spinner", "Loading...")` div. You can replace the "Loading..." text with your desired HTML/CSS for the spinner.

The JavaScript code inside `shinyjs::jsCode` is used to define the custom functions `showSpinner` and `hideSpinner`. These functions will be accessible from the `server` section of your Shiny app, where you can use them to show and hide the spinner based on events, such as when the "Send Query" button is clicked.

In summary, the `shinyjs::jsCode` calls to define the spinner-related JavaScript functions should be placed in the `ui` file of your Shiny app, while their usage (i.e., calling `shinyjs::js$showSpinner()` and `shinyjs::js$hideSpinner()`) should be placed in the `server` file in response to the relevant events.

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

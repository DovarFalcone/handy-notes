If you prefer a simpler method to let the user know that the query is loading and to wait, you can use the `shiny::showModal` function to display a basic "Please wait" modal dialog.

Here's how you can do it:

1. Load the Required Libraries:

   In your Shiny app script, load the required library:

   ```r
   library(shiny)
   ```

2. Define the UI:

   In the `ui` function of your Shiny app, add a "Please wait" modal dialog:

   ```r
   ui <- fluidPage(
     # ... other UI components ...

     # Modal dialog for "Please wait"
     modalDialog(
       id = "modal_loading",
       title = "Please Wait",
       "Loading...",
       footer = NULL
     ),

     # ... other UI components ...

     actionButton("query_button", "Send Query")
   )
   ```

   The `modalDialog` function will create a basic modal dialog with the title "Please Wait" and the text "Loading...". You can customize this dialog further if needed.

3. Use `shinyjs` in the `server` Function:

   In the `server` function, use the `shinyjs::showModal` and `shinyjs::hideModal` functions to show and hide the "Please wait" modal dialog as needed:

   ```r
   server <- function(input, output, session) {
     observeEvent(input$query_button, {
       shinyjs::showModal("modal_loading")  # Show the modal before executing the query

       # Execute your query or time-consuming operation here
       # Replace this with your actual query execution code
       Sys.sleep(3)  # Simulate a delay of 3 seconds

       shinyjs::hideModal("modal_loading")  # Hide the modal after query execution
     })
   }
   ```

   Replace `Sys.sleep(3)` with your actual query execution code.

With these changes, when you click the "Send Query" button, the "Please wait" modal dialog will be displayed, indicating that the query is loading. Once the query execution is complete, the modal dialog will automatically disappear, and the results or any other outputs will be displayed in the UI.

Using the `shiny::showModal` and `shiny::hideModal` functions provides a simple way to show a loading message to users without the need for custom CSS or JavaScript. The modal dialog provides a clean and straightforward method to inform users that the query is running and to wait for the results.

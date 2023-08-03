import os
import dash
import dash_bootstrap_components as dbc
from dash import dcc, html

# Get the port from the environment variable set by CDSW
port = int(os.environ.get("CDSW_APP_PORT", 8080))

# Import the Dash app from your app.py file
from app import app
from app import perform_query  # Correctly import the perform_query function

# Add your layout components and callbacks here if needed
# For example, you can add more components to the layout:
app.layout = html.Div([
    html.H1("Shiny App with Python - PostgreSQL"),
    dcc.Input(id="server-input", type="text", value="server1"),
    html.Button("Send Query", id="query-button", n_clicks=0),
    html.Div(id="loading-output"),
    html.Div(id="output-table")
])

@app.callback(
    [Output("output-table", "children"),
     Output("loading-output", "children")],
    [Input("query-button", "n_clicks")],
    [State("server-input", "value")]
)
def update_table(n_clicks, server_name):
    if n_clicks > 0:
        loading_spinner = html.Div(dbc.Spinner(color="primary"))
        data = perform_query(server_name)  # Use the imported perform_query function
        table = dash_table.DataTable(
            columns=[{"name": col, "id": col} for col in data[0]._fields],
            data=data
        )
        return table, loading_spinner
    else:
        return html.Div(), html.Div()

if __name__ == "__main__":
    app.run_server(host='0.0.0.0', port=port)

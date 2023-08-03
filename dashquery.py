pip install dash dash-html-components dash-core-components dash-table psycopg2

import dash
import dash_core_components as dcc
import dash_html_components as html
import dash_table
import dash_bootstrap_components as dbc
from dash.dependencies import Input, Output, State
import psycopg2

# Retrieve database username and password from environment variables
db_username = os.environ.get("DB_USERNAME", "default_username")
db_password = os.environ.get("DB_PASSWORD", "default_password")

# Database connection parameters (common for all servers)
db_params = {
    "dbname": "your_db_name",
    "host": "",  # The specific server name will be provided later
    "port": "5432",  # Your port number, default is 5432 for PostgreSQL
    "user": "your_username",
    "password": "your_password",
}

# Function to perform the database query for a given server
def perform_query(server_name):
    conn_params = db_params.copy()
    conn_params["host"] = server_name

    conn = psycopg2.connect(**conn_params)

    query = "SELECT * FROM your_table;"  # Replace with your actual query

    print(f"Executing query for server {server_name}...")
    cursor = conn.cursor()
    cursor.execute(query)
    data = cursor.fetchall()

    conn.close()
    print(f"Query executed successfully for server {server_name}.")
    return data

app = dash.Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])

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
        data = perform_query(server_name)
        table = dash_table.DataTable(
            columns=[{"name": col, "id": col} for col in data[0]._fields],
            data=data
        )
        return table, loading_spinner
    else:
        return html.Div(), html.Div()

if __name__ == "__main__":
    app.run_server(debug=True)

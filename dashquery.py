import psycopg2

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

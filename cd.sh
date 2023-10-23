#!/bin/bash

# Check if required environment variables are set
if [ -z "$DSW_APP_PORT" ] || [ -z "$CDSW_READONLY_PORT" ]; then
    echo "Error: DSW_APP_PORT and CDSW_READONLY_PORT environment variables are not set."
    exit 1
fi

# Define MkDocs build and serve commands
BUILD_COMMAND="mkdocs build"
SERVE_COMMAND="mkdocs serve -a 0.0.0.0:$DSW_APP_PORT"

# Change directory to your MkDocs project directory
cd /path/to/your/mkdocs/project

# Build the MkDocs site
echo "Building MkDocs site..."
$BUILD_COMMAND

# Serve the MkDocs site on the specified port
echo "Serving MkDocs site at http://127.0.0.1:$DSW_APP_PORT"
$SERVE_COMMAND

import os
import subprocess

# Check if required environment variables are set
if not os.getenv("DSW_APP_PORT") or not os.getenv("CDSW_READONLY_PORT"):
    print("Error: DSW_APP_PORT and CDSW_READONLY_PORT environment variables are not set.")
    exit(1)

# Define MkDocs build and serve commands
BUILD_COMMAND = "mkdocs build"
SERVE_COMMAND = f"mkdocs serve -a 0.0.0.0:{os.getenv('DSW_APP_PORT')}"

# Change directory to your MkDocs project directory
os.chdir("/path/to/your/mkdocs/project")

# Build the MkDocs site
print("Building MkDocs site...")
subprocess.run(BUILD_COMMAND, shell=True, check=True)

# Serve the MkDocs site on the specified port
print(f"Serving MkDocs site at http://127.0.0.1:{os.getenv('DSW_APP_PORT')}")
subprocess.run(SERVE_COMMAND, shell=True, check=True)

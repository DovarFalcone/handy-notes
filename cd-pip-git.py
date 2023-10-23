import os
import subprocess

# Check if required environment variables are set
if not os.getenv("DSW_APP_PORT") or not os.getenv("CDSW_READONLY_PORT"):
    print("Error: DSW_APP_PORT and CDSW_READONLY_PORT environment variables are not set.")
    exit(1)

# Path to requirements.txt file (adjust the path accordingly)
requirements_file = "/path/to/your/requirements.txt"

# Git repository URL
git_repo_url = "https://github.com/username/repo.git"  # Replace with your Git repository URL

# Directory where the Git repository will be cloned
clone_directory = "/path/to/clone/directory"  # Replace with the desired clone directory

# Clone the Git repository
print(f"Cloning Git repository from {git_repo_url} to {clone_directory}...")
subprocess.run(f"git clone {git_repo_url} {clone_directory}", shell=True, check=True)

# Change directory to the cloned repository
os.chdir(clone_directory)

# Install Python packages from requirements.txt
print(f"Installing Python packages from {requirements_file}...")
subprocess.run(f"pip install -r {requirements_file}", shell=True, check=True)

# Define MkDocs build and serve commands
BUILD_COMMAND = "mkdocs build"
SERVE_COMMAND = f"mkdocs serve -a 0.0.0.0:{os.getenv('DSW_APP_PORT')}"

# Build the MkDocs site
print("Building MkDocs site...")
subprocess.run(BUILD_COMMAND, shell=True, check=True)

# Serve the MkDocs site on the specified port
print(f"Serving MkDocs site at http://127.0.0.1:{os.getenv('DSW_APP_PORT')}")
subprocess.run(SERVE_COMMAND, shell=True, check=True)

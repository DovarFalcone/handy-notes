packages_to_install <- c("RPostgreSQL", "shiny", "shinydashboard")

# Function to install packages if not already installed
install_if_not_installed <- function(package_list) {
  installed_pkgs <- installed.packages()[, "Package"]
  missing_pkgs <- setdiff(package_list, installed_pkgs)
  
  if (length(missing_pkgs) > 0) {
    print(paste("Installing the following packages:", paste(missing_pkgs, collapse = ", ")))
    install.packages(missing_pkgs)
    print(paste("Installed packages:", paste(missing_pkgs, collapse = ", ")))
  } else {
    print("All packages are already installed.")
  }
}

# Call the function to install packages if needed
install_if_not_installed(packages_to_install)

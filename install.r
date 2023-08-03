packages_to_install <- c("RPostgreSQL", "shiny", "shinydashboard")

# Function to install packages if not already installed
install_if_not_installed <- function(package_list) {
  installed_pkgs <- installed.packages()[, "Package"]
  missing_pkgs <- setdiff(package_list, installed_pkgs)
  
  if (length(missing_pkgs) > 0) {
    install.packages(missing_pkgs)
  }
}

# Call the function to install packages if needed
install_if_not_installed(packages_to_install)

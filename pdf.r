# Load necessary packages
library(jsonlite)
library(dplyr)
library(purrr)
library(tidyr)
library(knitr)
library(kableExtra)

# Define input and output file paths
input_path <- "path/to/your/file.json"
output_path <- "path/to/output/file.html"

# Read in the JSON file
tryCatch({
  json_data <- fromJSON(input_path, simplifyDataFrame = FALSE)
}, error = function(e) {
  stop("Failed to read JSON data: ", e$message)
})

# Check if the input data is a list
if (!is.list(json_data)) {
  stop("JSON data is not a list.")
}

# Flatten the JSON data into a data frame
flat_data <- tryCatch({
  as.data.frame(json_data, recursive = TRUE) %>%
    gather(key, value) %>%
    unnest(value) %>%
    select(-key)
}, error = function(e) {
  stop("Failed to flatten JSON data: ", e$message)
})

# Check if the flattened data frame is empty
if (nrow(flat_data) == 0) {
  stop("No data found in JSON file.")
}

# Convert the data frame to a knitr kable object
kable_data <- tryCatch({
  kable(flat_data, "html", row.names = FALSE) %>%
    kable_styling("striped", full_width = FALSE)
}, error = function(e) {
  stop("Failed to convert data to kable format: ", e$message)
})

# Write the kable object to an HTML file
tryCatch({
  cat(kable_data, file = output_path)
}, error = function(e) {
  stop("Failed to write HTML file: ", e$message)
})

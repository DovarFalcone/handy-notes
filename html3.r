# Load necessary packages
library(jsonlite)
library(dplyr)
library(purrr)
library(tidyr)
library(knitr)
library(kableExtra)

# Define input and output file paths
input_path <- "path/to/your/file.csv"
output_path <- "path/to/output/file.html"

# Read in the CSV file
tryCatch({
  csv_data <- read.csv(input_path, stringsAsFactors = FALSE)
}, error = function(e) {
  stop("Failed to read CSV file: ", e$message)
})

# Check if the CSV file contains a "json_data" column
if (!"json_data" %in% colnames(csv_data)) {
  stop("CSV file does not contain a 'json_data' column.")
}

# Convert the "json_data" column from JSON to a list
json_list <- tryCatch({
  lapply(csv_data$json_data, fromJSON, simplifyDataFrame = FALSE)
}, error = function(e) {
  stop("Failed to convert JSON data to list: ", e$message)
})

# Flatten the JSON data into a data frame
flat_data <- tryCatch({
  json_df <- bind_rows(lapply(json_list, as.data.frame, recursive = TRUE), .id = "id")
  json_df %>%
    gather(key, value, -id) %>%
    unnest(value) %>%
    mutate(key = gsub("\\.", " ", key),
           key = tolower(key),
           key = tools::toTitleCase(key)) %>%
    select(id, key, value) %>%
    distinct()
}, error = function(e) {
  stop("Failed to flatten JSON data: ", e$message)
})

# Check if the flattened data frame is empty
if (nrow(flat_data) == 0) {
  stop("No data found in CSV file.")
}

# Convert the data frame to a knitr kable object
kable_data <- tryCatch({
  kable(flat_data, "html", row.names = FALSE) %>%
    kable_styling("striped", full_width = FALSE) %>%
    column_spec(1, bold = TRUE, background = "#F2F2F2")
}, error = function(e) {
  stop("Failed to convert data to kable format: ", e$message)
})

# Write the kable object to an HTML file
tryCatch({
  cat(kable_data, file = output_path)
}, error = function(e) {
  stop("Failed to write HTML file: ", e$message)
})

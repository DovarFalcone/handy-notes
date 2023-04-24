# Load necessary packages
library(jsonlite)
library(dplyr)
library(purrr)
library(tidyr)
library(knitr)
library(kableExtra)

# Define input file path
input_path <- "path/to/your/file.csv"

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

# Flatten the JSON data into a data frame for each row
kable_data_list <- tryCatch({
  map2(json_list, csv_data$facility, function(json, facility) {
    flat_data <- json %>%
      as.data.frame(recursive = TRUE) %>%
      gather(key, value) %>%
      unnest(value) %>%
      select(-key) %>%
      mutate(key = gsub("\\.", " ", key),
             key = tolower(key),
             key = tools::toTitleCase(key)) %>%
      distinct()

    # Convert the data frame to a knitr kable object
    kable_data <- kable(flat_data, "html", row.names = FALSE) %>%
      kable_styling("striped", full_width = FALSE) %>%
      column_spec(1, bold = TRUE, background = "#F2F2F2")

    # Write the kable object to an HTML file
    output_path <- paste0("path/to/output/", gsub(" ", "_", facility), ".html")
    cat(kable_data, file = output_path)

    # Return the kable object for use in later steps
    kable_data
  })
}, error = function(e) {
  stop("Failed to flatten JSON data: ", e$message)
})

# Check if any of the kable data lists are empty
if (any(map_int(kable_data_list, nrow) == 0)) {
  stop("No data found in one or more rows of CSV file.")
}

# Combine the kable data lists into a single HTML string
html_str <- tryCatch({
  reduce(kable_data_list, function(x, y) {
    paste(x, y, sep = "\n")
  })
}, error = function(e) {
  stop("Failed to combine kable data: ", e$message)
})

# Write the combined HTML string to a file
output_path <- "path/to/output/combined.html"
tryCatch({
  cat(html_str, file = output_path)
}, error = function(e) {
  stop("Failed to write combined HTML file: ", e$message)
})

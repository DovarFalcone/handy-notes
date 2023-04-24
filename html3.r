# Load necessary packages
library(jsonlite)
library(dplyr)
library(purrr)
library(tidyr)
library(knitr)
library(kableExtra)

# Define input and output file paths
input_path <- "path/to/your/file.csv"
output_folder <- "path/to/output/folder/"

# Read in the CSV file
tryCatch({
  csv_data <- read.csv(input_path, stringsAsFactors = FALSE)
}, error = function(e) {
  stop("Failed to read CSV data: ", e$message)
})

# Check if the input data is a data frame
if (!is.data.frame(csv_data)) {
  stop("CSV data is not a data frame.")
}

# Loop through each row in the data frame
for (i in 1:nrow(csv_data)) {
  row <- csv_data[i, ]
  
  # Convert the JSON string to a list
  tryCatch({
    json_data <- fromJSON(row$json_column, simplifyDataFrame = FALSE)
  }, error = function(e) {
    stop(paste0("Failed to read JSON data in row ", i, ": ", e$message))
  })
  
  # Flatten the JSON data into a data frame
  flat_data <- tryCatch({
    as.data.frame(json_data, recursive = TRUE) %>%
      gather(key, value) %>%
      unnest(value) %>%
      mutate(key = gsub("\\.", " ", key),
             key = tolower(key),
             key = tools::toTitleCase(key)) %>%
      select(key, value) %>%
      distinct()
  }, error = function(e) {
    stop(paste0("Failed to flatten JSON data in row ", i, ": ", e$message))
  })
  
  # Check if the flattened data frame is empty
  if (nrow(flat_data) == 0) {
    stop(paste0("No data found in JSON object in row ", i, "."))
  }
  
  # Convert the data frame to a knitr kable object
  kable_data <- tryCatch({
    kable(flat_data, "html", row.names = FALSE) %>%
      kable_styling("striped", full_width = FALSE) %>%
      column_spec(1, bold = TRUE, background = "#F2F2F2")
  }, error = function(e) {
    stop(paste0("Failed to convert data in row ", i, " to kable format: ", e$message))
  })
  
  # Write the kable object to an HTML file
  tryCatch({
    output_file <- paste0(output_folder, "output_", i, ".html")
    cat(kable_data, file = output_file)
  }, error = function(e) {
    stop(paste0("Failed to write HTML file for row ", i, ": ", e$message))
  })
}

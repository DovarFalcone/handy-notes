# Load required libraries
library(jsonlite)

# Set file paths
csv_file <- "path/to/csv/file.csv"
output_dir <- "path/to/output/directory"

# Read in the CSV file
df <- read.csv(csv_file)

# Loop through each row in the data frame and create a JSON file
for (i in 1:nrow(df)) {
  # Extract the data for the current row
  row_data <- df[i, ]
  
  # Convert the row data to a JSON object
  json_data <- toJSON(row_data, pretty = TRUE)
  
  # Set the output file name
  output_file <- paste0(output_dir, "/row_", i, ".json")
  
  # Write the JSON object to a file
  write(json_data, file = output_file)
}

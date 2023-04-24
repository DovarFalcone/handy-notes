library(tidyverse)
library(jsonlite)

data <- read_csv("your_csv_file.csv")

for (i in 1:nrow(data)) {
  # Extract the necessary information
  facility_name <- data[i, "facility_name"]
  clean_name <- data[i, "clean_name"]
  time <- data[i, "time"]
  json_str <- data[i, "json_data"]
  
  # Skip over rows with invalid JSON data
  if (!jsonlite::validate(json_str)) {
    warning(paste0("Skipping row ", i, " due to invalid JSON data."))
    next
  }
  
  # Parse the JSON data into a JSON object
  json_data <- jsonlite::fromJSON(json_str)
  
  # Create a filename
  filename <- paste0(facility_name, "_", clean_name, "_", time, ".json")
  
  # Write the JSON file
  jsonlite::write_json(json_data, filename)
}

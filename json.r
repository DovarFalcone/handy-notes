library(tidyverse)
library(jsonlite)

data <- read_csv("your_csv_file.csv")

for (i in 1:nrow(data)) {
  # Extract the necessary information
  facility_name <- data[i, "facility_name"]
  clean_name <- data[i, "clean_name"]
  time <- data[i, "time"]
  json_data <- fromJSON(data[i, "json_data"])
  
  # Create a filename
  filename <- paste0(facility_name, "_", clean_name, "_", time, ".json")
  
  # Write the JSON file
  write_json(json_data, filename)
}

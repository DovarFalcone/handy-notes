# Load necessary packages
library(jsonlite)
library(dplyr)
library(purrr)
library(tidyr)
library(knitr)
library(kableExtra)

# Read in the JSON file
json_data <- fromJSON("path/to/your/file.json")

# Flatten the JSON data into a data frame
flat_data <- as.data.frame(json_data, recursive = TRUE) %>%
  gather(key, value) %>%
  unnest(value) %>%
  select(-key)

# Convert the data frame to a knitr kable object
kable_data <- kable(flat_data, "latex", booktabs = TRUE)

# Write the kable object to a PDF file
knitr::kable_styling(kable_data, full_width = FALSE) %>%
  as.character() %>%
  cat(file = "path/to/output/file.pdf", sep = "\n")

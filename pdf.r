library(jsonlite)

# Load the JSON object from a file
data <- fromJSON("data.json")

# Convert the list to a data frame with row names
df <- as.data.frame(data, row.names = paste0("row", seq_along(data)))

# Check for duplicate row names and add prefix if necessary
if (any(duplicated(row.names(df)))) {
  row.names(df) <- paste0("row", seq_along(data))
}

# Open a connection to the output PDF file
pdf("output.pdf")

# Print the contents of the data frame to the PDF file
for (i in seq_len(nrow(df))) {
  for (j in seq_len(ncol(df))) {
    cat(paste(names(df)[j], ": ", df[i, j], "\n"))
  }
  cat("\n")
}

# Close the connection to the PDF file
dev.off()

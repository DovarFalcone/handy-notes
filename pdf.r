library(jsonlite)

# Load the JSON object from a file
data <- fromJSON("data.json")

# Convert the list to a data frame with an index column
df <- as.data.frame(data)
df$index <- 1:nrow(df)
rownames(df) <- paste0("row", df$index)

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

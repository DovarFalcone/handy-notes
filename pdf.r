library(fpdf)
library(jsonlite)

# Load the JSON object from a file
data <- fromJSON("data.json")

# Create a new PDF document
pdf <- PDF()

# Define the table header
header <- c("Key", "Value")

# Add the table header to the PDF
pdf <- AddPage()
pdf <- SetFont("Arial", "B", 16)
for (i in 1:length(header)) {
  pdf <- Cell(50, 10, header[i], 1)
}
pdf <- Ln()

# Add the data to the PDF
pdf <- SetFont("Arial", "", 12)
for (i in 1:length(data)) {
  for (j in 1:length(header)) {
    pdf <- Cell(50, 10, names(data)[i], 1)
    pdf <- Cell(50, 10, data[[i]], 1)
  }
  pdf <- Ln()
}

# Save the PDF file
pdf <- Output("output.pdf", "F")

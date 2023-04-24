library(ReporteRs)
library(jsonlite)

# Load the JSON object from a file
data <- fromJSON("data.json")

# Create a new document object
doc <- docx()

# Add a header to the document
doc <- addParagraph(doc, "My JSON Data", style = "Title")

# Add a table to the document
header <- c("Key", "Value")
data_rows <- lapply(names(data), function(nm) {
  row <- as.data.frame(t(c(nm, data[[nm]])))
  colnames(row) <- header
  return(row)
})
doc <- addFlexTable(doc, value = data_rows, header.columns = header)

# Save the document
writeDoc(doc, file = "output.docx")

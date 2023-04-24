library(jsonlite)
library(Rcpp)

data <- fromJSON("data.json")

pdf("output.pdf")

for (key in names(data)) {
  cat(key, ": ", data[[key]], "\n")
}

dev.off()

irod <- read.csv2("Irod_gy.csv", fileEncoding = "utf8", skip = 1)
fejléc <- read.csv2("Irod_gy.csv", nrow = 1, head = FALSE)
fejléc[9:15] <- names(irod)[9:15]
names(irod) <- fejléc

## Faktorok
jelleg <- factor(irod$`felmérés jellege`, levels = c("lokális", "regionális", "országos", "Európa", "globális"), ordered = TRUE)

## xlsx beolvasás
library(readxl)
irod2 <- as.data.frame(read_excel("Irodalom_gyűjtemény.xlsx"))

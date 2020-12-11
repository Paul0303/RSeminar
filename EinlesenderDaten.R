library(pls)
library(fs)
(MinW_text <- path_home("Documents", "R", "RSeminar", "Mineralwasser.txt"))
  #Path wird zur Datei kreiert
Mineralwasser <- read.table(MinW_text, header = TRUE, sep = ";")
# Textdatei wird eingelesen
(MinWRoh_text <- path_home("Documents", "R", "RSeminar", "Mineralwasser_Rohdaten.txt"))
MineralwasserRohdaten <- read.table(MinWRoh_text,header = TRUE, sep = ";")
#Gasoline data holen
data("gasoline", package = "pls")

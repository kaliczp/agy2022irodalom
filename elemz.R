gdta <- read.csv("gim-dam_taplalkozas_adatok.csv", header=TRUE, sep= ";", row.names=1)

boxplot(Egysziku ~ korosztaly2, gdta[gdta$vadfaj == "gimszarvas",])

bendo <- data.frame(Typ = rep(names(gdta[,20:25]), each= 52 ) ,tomeg = as.vector(as.matrix(gdta[,20:25])))


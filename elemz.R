gdta <- read.csv("gim-dam_taplalkozas_adatok.csv", header=TRUE, sep= ";", row.names=1)

boxplot(Egysziku ~ korosztaly2, gdta[gdta$vadfaj == "gimszarvas",])

bendo <- data.frame(vadfaj = gdta$vadfaj, kor = gdta$korosztaly2,
    Typ = rep(names(gdta[,20:25]), each= 52 ) ,
                      tomeg = as.vector(as.matrix(gdta[,20:25])))

boxplot(tomeg ~ Typ , bendo[bendo$vadfaj == "damszarvas",], main = "Dam")
boxplot(tomeg ~ Typ , bendo[bendo$vadfaj == "gimszarvas",])

bendo <- cbind(bendo, Komb = paste(bendo$kor, bendo$Typ, sep = "_"))
boxplot(tomeg ~ Komb , bendo[bendo$vadfaj == "damszarvas",], main = "Dam")
bendo$komb <- factor(bendo$Komb, levels = c("fiatal_Egysziku", "felnott_Egysziku", "fiatal_Ketsziku", "felnott_Ketsziku", 
                                            "fiatal_Hajtas", "felnott_Hajtas", "fiatal_Tulevel", "felnott_Tulevel", 
                                            "fiatal_Erdei_termes", "felnott_Erdei_termes", "fiatal_Mezogazdasagi_termes", 
                                            "felnott_Mezogazdasagi_termes")
                     )
boxplot(tomeg ~ komb , bendo[bendo$vadfaj == "damszarvas",], main = "Dam")

par(mar = c(9.6,4.1,4.1,2.1))
boxplot(tomeg ~ komb , bendo[bendo$vadfaj == "damszarvas",], main = "Dam", las = 2, xlab = "")

bendo$komb2 <- factor(bendo$Komb, levels = c("fiatal_Egysziku", "felnott_Egysziku", "fiatal_Ketsziku", "felnott_Ketsziku", 
                                            "fiatal_Hajtas", "felnott_Hajtas", "fiatal_Tulevel", "felnott_Tulevel", 
                                            "fiatal_Erdei_termes", "felnott_Erdei_termes", "fiatal_Mezogazdasagi_termes", 
                                            "felnott_Mezogazdasagi_termes"),
                     labels = c("f_E", "F_E", "f_K", "F_K", "f_H", "F_H", "f_T", "F_T", "f_Er", 
                                "F_Er", "f_Mg", "F_Mg"))

boxplot(tomeg ~ komb2 , bendo[bendo$vadfaj == "damszarvas",], main = "Dam")


## csak a szerkesztéshez
dput(levels(factor(bendo$Komb)))
dput(paste(rep(c("fiatal", "felnott"), 6), rep(names(gdta[,20:25]), each = 2), sep = "_"))
dput(paste(rep(c("f","F"),6), rep(c("E","K","H","T","Er","Mg"),each =2), sep = "_"))

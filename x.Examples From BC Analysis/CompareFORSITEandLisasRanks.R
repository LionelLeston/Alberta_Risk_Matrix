Lisamatrix<-read.csv("LisaMatrix.csv", header=TRUE)
str(Lisamatrix)

require(reshape)
ranks <- melt(Lisamatrix)
head(ranks)
#didn't work

library(tidyr)

# The arguments to gather():
# - data: Data object
# - key: Name of new key column (made from names of data columns)
# - value: Name of new value column
# - ...: Names of source columns that contain values
# - factor_key: Treat the new key column as a factor (instead of character vector)
data_long <- gather(Lisamatrix, agetpr, LisaRank, "Age.3.30.Y.Good":"Age.141..Unproductive", factor_key=TRUE)
data_long

#write.csv(data_long, file="LisamatrixLong.csv")

LisamatrixLong<-read.csv("LisamatrixLongJan25.csv", header=TRUE)
str(LisamatrixLong)

LisamatrixranksbyForID <- aggregate(LisamatrixLong$LisaRank, by=list(ForestID=LisamatrixLong$ForestID), FUN=function(x) {unique(x)})
LisamatrixnumranksbyForID <- aggregate(LisamatrixLong$LisaRank, by=list(ForestID=LisamatrixLong$ForestID), FUN=function(x) {length(unique(x))})
nrow(LisamatrixranksbyForID)#4896
nrow(LisamatrixnumranksbyForID)#4896

FORSITEmatrixLong<-read.csv("AlbertaForID_Ranks_final_long.csv", header=TRUE)
str(FORSITEmatrixLong)
FORSITEmatrixranksbyForID <- aggregate(FORSITEmatrixLong$Rating, by=list(ForestID=FORSITEmatrixLong$ForestID), FUN=function(x) {unique(x)})
FORSITEmatrixnumranksbyForID <- aggregate(FORSITEmatrixLong$Rating, by=list(ForestID=FORSITEmatrixLong$ForestID), FUN=function(x) {length(unique(x))})
nrow(FORSITEmatrixranksbyForID)#3264
nrow(FORSITEmatrixnumranksbyForID)#3264

tocompare <- merge(FORSITEmatrixLong, LisamatrixLong[c("ForestID", "LisaRank")], by="ForestID", all.x=T)
write.csv(tocompare, file="tocompare.csv")


tocompare<-read.csv("tocompare.csv", header=TRUE)

tocompare$Rating <- as.character(tocompare$Rating)
tocompare$LisaRank<- as.character(tocompare$LisaRank)

tocompare$Rating[tocompare$Rating == "0"] <- "unranked"
tocompare$Rating[tocompare$Rating == "999"] <- "unranked"
tocompare$Rating[is.na(tocompare$Rating)] <- "unranked"
tocompare$LisaRank[tocompare$LisaRank == "0"] <- "unranked"
tocompare$LisaRank[is.na(tocompare$LisaRank)] <- "unranked"

tocompare$sameranks.FORSITE.LisaMat <- tocompare$Rating == tocompare$LisaRank
differences<-tocompare[tocompare$sameranks.FORSITE.LisaMat==FALSE,]
nrow(tocompare)#5886
nrow(differences)#2602

nrow(tocompare[tocompare$Rating == "unranked",])#2651
nrow(tocompare[tocompare$LisaRank == "unranked",])#49
#September: This differs from the July script only in that there is a section for summarizing the risk ratings
#of each forest ID combination class.

#July script: When calculating the number of points per forest ID class, this script differs from the one run in May 
#in that it is filtered to only contain certain combinations of TPR, subregion, standtype, and age class


# load the whole risk matrix AVI attribute table. For some reason, I can't easily combine
#MOD1YR or ORIGINYR from the detailed AVI geodatabase, so the age-structure calculated
#here is as of 2017. Probably not an issue, just that the age structure as of 2017
#is different from what would have been present when surveys were actually being done.
#1. Calculate age of stand during survey using age2017 - (2017-YEAR). Some values will be negative
#because stand age assessed in 2017 is calculated differently (just based on age2017)
#than it was in the point counts.

#As all contents of the risk matrix AVI attribute table are far more records than can be
#exported to or stored in a single Excel file, I am combining several separate
#CSV files after reading them into R, using rbind().
#The process of manually splitting up a large geodatabase and exporting each section to a
#separate CSV file could probably be replaced by a script in Python.
#before combining the separate read-in files with rbind(), I made sure that 
#the columns and column names in each .csv file were identical.

riskmatrixAVI1<-read.csv("May17RiskMatrixV3_SubrCM_AlpacAVI.600Kplus.csv", header=TRUE)
nrow(riskmatrixAVI1)#518283
unique(nrow(riskmatrixAVI1))#518283 unique.

riskmatrixAVI2<-read.csv("May17RiskMatrixV3_SubrCM_AlpacAVI.below600K.csv", header=TRUE)
nrow(riskmatrixAVI2)#600000
unique(nrow(riskmatrixAVI2))#600000 unique

riskmatrixAVI3<-read.csv("May17RiskMatrixV3_SubrCM_noFMA.csv", header=TRUE)
nrow(riskmatrixAVI3)#10
unique(nrow(riskmatrixAVI3))#10 unique

riskmatrixAVI4<-read.csv("RiskMatrixV3attributetableSubregion0.csv", header=TRUE)
nrow(riskmatrixAVI4)#998582
unique(nrow(riskmatrixAVI4))#998582 unique

riskmatrixAVI5<-read.csv("RiskMatrixV3attributetableSubregionABandM.csv", header=TRUE)
nrow(riskmatrixAVI5)#150578
unique(nrow(riskmatrixAVI5))#150578 unique

riskmatrixAVI6<-read.csv("July11RiskMatrixV3_SubrCM_newANCtoMillar.csv", header=TRUE)
nrow(riskmatrixAVI6)#275373 (more than obtained back in June)
unique(nrow(riskmatrixAVI6))#275373 unique

riskmatrixAVI7<-read.csv("July11RiskMatrixV3_SubrCM_newTolkoHighPrairieAndFootner.csv", header=TRUE)
nrow(riskmatrixAVI7)#339223 (more than obtained back in June)
unique(nrow(riskmatrixAVI7))#339223 unique

riskmatrixAVI8<-read.csv("July11RiskMatrixV3_SubrCM_TolkoVanderwell.csv", header=TRUE)
nrow(riskmatrixAVI8)#113163 
unique(nrow(riskmatrixAVI8))#113163 unique

riskmatrixAVI9<-read.csv("July11RiskMatrixV3_SubrCM_VanderwellContractorsFMA.csv", header=TRUE)
nrow(riskmatrixAVI9)#20549 
unique(nrow(riskmatrixAVI9))#20549 unique

riskmatrixAVI10<-read.csv("July11RiskMatrixV3_SubrCM_WestFraserAndTolko.csv", header=TRUE)
nrow(riskmatrixAVI10)#38333 
unique(nrow(riskmatrixAVI10))#38333 unique

riskmatrixAVI11<-read.csv("July11RiskMatrixV3_SubrCM_WestFraserSlaveLakeFMA.csv", header=TRUE)
nrow(riskmatrixAVI11)#71215 
unique(nrow(riskmatrixAVI11))#71215 unique

riskmatrixAVI12<-read.csv("July11RiskMatrixV3_SubrCM_WeyerhauserGrandePrairie.csv", header=TRUE)
nrow(riskmatrixAVI12)#42769 
unique(nrow(riskmatrixAVI12))#42769 unique

riskmatrixAVI13<-read.csv("July11RiskMatrixV3_SubrCM_WeyerhauserPembinaTimberland.csv", header=TRUE)
nrow(riskmatrixAVI13)#35435 
unique(nrow(riskmatrixAVI13))#35435 unique

riskmatrixAVI14<-read.csv("RiskMatrixV3attributetableSubregionLBHandDM.csv", header=TRUE)
nrow(riskmatrixAVI14)#888382
unique(nrow(riskmatrixAVI14))#888382 unique

riskmatrixAVI15<-read.csv("RiskMatrixV3attributetableSubregionLFabove700K.csv", header=TRUE)
nrow(riskmatrixAVI15)#624345
unique(nrow(riskmatrixAVI15))#624345 unique

riskmatrixAVI16<-read.csv("RiskMatrixV3attributetableSubregionLFbelow700K.csv", header=TRUE)
nrow(riskmatrixAVI16)#700000
unique(nrow(riskmatrixAVI16))#700000 unique

riskmatrixAVI17<-read.csv("RiskMatrixV3attributetableSubregionNandU.csv", header=TRUE)
nrow(riskmatrixAVI17)#704720
unique(nrow(riskmatrixAVI17))#704720 unique

names(riskmatrixAVI1)
names(riskmatrixAVI2)
names(riskmatrixAVI3)
names(riskmatrixAVI4)
names(riskmatrixAVI5)
names(riskmatrixAVI6)
names(riskmatrixAVI7)
names(riskmatrixAVI8)
names(riskmatrixAVI9)
names(riskmatrixAVI10)
names(riskmatrixAVI11)
names(riskmatrixAVI12)

riskmatrixAVI.CM<-rbind(riskmatrixAVI1, riskmatrixAVI2, riskmatrixAVI3,
                       riskmatrixAVI6, riskmatrixAVI7, riskmatrixAVI8)

#now combine the separate tables into one
riskmatrixAVI.A<-rbind(riskmatrixAVI1, riskmatrixAVI2, riskmatrixAVI3,
                       riskmatrixAVI4, riskmatrixAVI5, riskmatrixAVI6,
                       riskmatrixAVI7, riskmatrixAVI8, riskmatrixAVI9,
                       riskmatrixAVI10, riskmatrixAVI11, riskmatrixAVI12,
                       riskmatrixAVI13, riskmatrixAVI14, riskmatrixAVI15,
                       riskmatrixAVI16, riskmatrixAVI17)
nrow(riskmatrixAVI.A)#6120960
#Note: there were 6120960 polygons in the risk matrix AVI geodatabase, 365016 more than in riskmatrixAVI.A back in May.
#11 of the 12 subregions had exactly the same number of polygons in the original database as observations in the CSV files
#read into R. All missing polygons were from the CentralMixedwood subregion and have now been accounted for, as of July 11.

#Redoing the gap analysis in July with all of the polygons.
riskmatrixAVI.B<-riskmatrixAVI.A[!is.na(riskmatrixAVI.A$AGE_2017),]
nrow(riskmatrixAVI.B)#6120960 
#riskmatrixAVI.C<-riskmatrixAVI.B[!is.na(riskmatrixAVI.B$NaturalSub),]
#nrow(riskmatrixAVI.C)#5122378
#riskmatrixAVI.D<-riskmatrixAVI.C[!is.na(riskmatrixAVI.C$StandType),]
#nrow(riskmatrixAVI.D)#5122378
#riskmatrixAVI.E<-riskmatrixAVI.D[!is.na(riskmatrixAVI.D$TPR),]
#nrow(riskmatrixAVI.E)#5122378
#str(riskmatrixAVI.E)

riskmatrixAVI.A$AGE_2017<-as.numeric(riskmatrixAVI.A$AGE_2017)
riskmatrixAVI.A$Shape_Area<-as.numeric(riskmatrixAVI.A$Shape_Area)
str(riskmatrixAVI.A)
riskmatrixAVI.A$ageclass<-{ifelse(riskmatrixAVI.A$AGE_2017==9999,"NA",
                            ifelse(riskmatrixAVI.A$AGE_2017 <3,"Age 0-2 Y",
                              ifelse(riskmatrixAVI.A$AGE_2017 <31,"Age 3-30 Y",
                                ifelse(riskmatrixAVI.A$AGE_2017 <61,"Age 31-60 Y",                                
                                  ifelse(riskmatrixAVI.A$AGE_2017 <81,"Age 61-80 Y",
                                    ifelse(riskmatrixAVI.A$AGE_2017 <101,"Age 81-100 Y",
                                      ifelse(riskmatrixAVI.A$AGE_2017 <141,"Age 101-140 Y","Age 141+")))))))
}


library(dplyr)
# totalpersubregion.stand<-pointsC%>%
#   group_by(subregion.name,standtype.name)%>%
#   summarize(totalcount=sum(counter))
# write.csv(totalpersubregion.stand, file="totalpersubregion.stand.csv")
riskmatrixAVI.A$subregion.name<-riskmatrixAVI.A$NaturalSub
riskmatrixAVI.A$standtype.name<-riskmatrixAVI.A$StandType
riskmatrixAVI.A$tpr.name<-riskmatrixAVI.A$TPR

riskmatrixAVI.A$ForestID<-paste0(riskmatrixAVI.A$subregion.name,".",riskmatrixAVI.A$standtype.name,".",riskmatrixAVI.A$ageclass,".",riskmatrixAVI.A$tpr.name)
#NEW SECTION (September, 2018)
#ranks and area summarized by ForestID
AlbertaForID_Ranks_final_long<-riskmatrixAVI.A%>%
  group_by(ForestID,Rating)%>%
  summarize(ForestArea=sum(Shape_Area)/10000)
AlbertaForID_Ranks_final_long$ForestArea[is.na(AlbertaForID_Ranks_final_long$ForestArea)]<-0 #replace NAs
write.csv(AlbertaForID_Ranks_final_long, file="AlbertaForID_Ranks_final_long.csv")
#Calculates cumulative area in risk matrix AVI geodatabase within each combination of subregion, stand, age class, and TPR, and ForestID ranking


#SECTION BELOW (Done Back in July, 2018: Used to calculate area and points sampled per ForestID class)
totalpers.s.3.30.Good<-riskmatrixAVI.A%>%
  group_by(subregion.name,standtype.name)%>%
  filter(tpr.name=="G", ageclass=="Age 3-30 Y")%>%
  summarize(G.3.30=sum(Shape_Area)/10000)
totalpers.s.3.30.Medium<-riskmatrixAVI.A%>%
  group_by(subregion.name,standtype.name)%>%
  filter(tpr.name=="M", ageclass=="Age 3-30 Y")%>%
  summarize(M.3.30=sum(Shape_Area)/10000)
totalpers.s.3.30.Fair<-riskmatrixAVI.A%>%
  group_by(subregion.name,standtype.name)%>%
  filter(tpr.name=="F", ageclass=="Age 3-30 Y")%>%
  summarize(F.3.30=sum(Shape_Area)/10000)
totalpers.s.3.30.Unproductive<-riskmatrixAVI.A%>%
  group_by(subregion.name,standtype.name)%>%
  filter(tpr.name=="U", ageclass=="Age 3-30 Y")%>%
  summarize(U.3.30=sum(Shape_Area)/10000)

totalpers.s.31.60.Good<-riskmatrixAVI.A%>%
  group_by(subregion.name,standtype.name)%>%
  filter(tpr.name=="G", ageclass=="Age 31-60 Y")%>%
  summarize(G.31.60=sum(Shape_Area)/10000)
totalpers.s.31.60.Medium<-riskmatrixAVI.A%>%
  group_by(subregion.name,standtype.name)%>%
  filter(tpr.name=="M", ageclass=="Age 31-60 Y")%>%
  summarize(M.31.60=sum(Shape_Area)/10000)
totalpers.s.31.60.Fair<-riskmatrixAVI.A%>%
  group_by(subregion.name,standtype.name)%>%
  filter(tpr.name=="F", ageclass=="Age 31-60 Y")%>%
  summarize(F.31.60=sum(Shape_Area)/10000)
totalpers.s.31.60.Unproductive<-riskmatrixAVI.A%>%
  group_by(subregion.name,standtype.name)%>%
  filter(tpr.name=="U", ageclass=="Age 31-60 Y")%>%
  summarize(U.31.60=sum(Shape_Area)/10000)

totalpers.s.61.80.Good<-riskmatrixAVI.A%>%
  group_by(subregion.name,standtype.name)%>%
  filter(tpr.name=="G", ageclass=="Age 61-80 Y")%>%
  summarize(G.61.80=sum(Shape_Area)/10000)
totalpers.s.61.80.Medium<-riskmatrixAVI.A%>%
  group_by(subregion.name,standtype.name)%>%
  filter(tpr.name=="M", ageclass=="Age 61-80 Y")%>%
  summarize(M.61.80=sum(Shape_Area)/10000)
totalpers.s.61.80.Fair<-riskmatrixAVI.A%>%
  group_by(subregion.name,standtype.name)%>%
  filter(tpr.name=="F", ageclass=="Age 61-80 Y")%>%
  summarize(F.61.80=sum(Shape_Area)/10000)
totalpers.s.61.80.Unproductive<-riskmatrixAVI.A%>%
  group_by(subregion.name,standtype.name)%>%
  filter(tpr.name=="U", ageclass=="Age 61-80 Y")%>%
  summarize(U.61.80=sum(Shape_Area)/10000)

totalpers.s.81.100.Good<-riskmatrixAVI.A%>%
  group_by(subregion.name,standtype.name)%>%
  filter(tpr.name=="G", ageclass=="Age 81-100 Y")%>%
  summarize(G.81.100=sum(Shape_Area)/10000)
totalpers.s.81.100.Medium<-riskmatrixAVI.A%>%
  group_by(subregion.name,standtype.name)%>%
  filter(tpr.name=="M", ageclass=="Age 81-100 Y")%>%
  summarize(M.81.100=sum(Shape_Area)/10000)
totalpers.s.81.100.Fair<-riskmatrixAVI.A%>%
  group_by(subregion.name,standtype.name)%>%
  filter(tpr.name=="F", ageclass=="Age 81-100 Y")%>%
  summarize(F.81.100=sum(Shape_Area)/10000)
totalpers.s.81.100.Unproductive<-riskmatrixAVI.A%>%
  group_by(subregion.name,standtype.name)%>%
  filter(tpr.name=="U", ageclass=="Age 81-100 Y")%>%
  summarize(U.81.100=sum(Shape_Area)/10000)

totalpers.s.101.140.Good<-riskmatrixAVI.A%>%
  group_by(subregion.name,standtype.name)%>%
  filter(tpr.name=="G", ageclass=="Age 101-140 Y")%>%
  summarize(G.101.140=sum(Shape_Area)/10000)
totalpers.s.101.140.Medium<-riskmatrixAVI.A%>%
  group_by(subregion.name,standtype.name)%>%
  filter(tpr.name=="M", ageclass=="Age 101-140 Y")%>%
  summarize(M.101.140=sum(Shape_Area)/10000)
totalpers.s.101.140.Fair<-riskmatrixAVI.A%>%
  group_by(subregion.name,standtype.name)%>%
  filter(tpr.name=="F", ageclass=="Age 101-140 Y")%>%
  summarize(F.101.140=sum(Shape_Area)/10000)
totalpers.s.101.140.Unproductive<-riskmatrixAVI.A%>%
  group_by(subregion.name,standtype.name)%>%
  filter(tpr.name=="U", ageclass=="Age 101-140 Y")%>%
  summarize(U.101.140=sum(Shape_Area)/10000)#differing number of rows in each tibble, so do a merge

totalpers.s.141up.Good<-riskmatrixAVI.A%>%
  group_by(subregion.name,standtype.name)%>%
  filter(tpr.name=="G", ageclass=="Age 141+")%>%
  summarize(G.141up=sum(Shape_Area)/10000)
totalpers.s.141up.Medium<-riskmatrixAVI.A%>%
  group_by(subregion.name,standtype.name)%>%
  filter(tpr.name=="M", ageclass=="Age 141+")%>%
  summarize(M.141up=sum(Shape_Area)/10000)
totalpers.s.141up.Fair<-riskmatrixAVI.A%>%
  group_by(subregion.name,standtype.name)%>%
  filter(tpr.name=="F", ageclass=="Age 141+")%>%
  summarize(F.141up=sum(Shape_Area)/10000)
totalpers.s.141up.Unproductive<-riskmatrixAVI.A%>%
  group_by(subregion.name,standtype.name)%>%
  filter(tpr.name=="U", ageclass=="Age 141+")%>%
  summarize(U.141up=sum(Shape_Area)/10000)#differing number of rows in each tibble, so do a merge

merged1a<-merge(totalpers.s.3.30.Good, totalpers.s.3.30.Medium, by=c("subregion.name", "standtype.name"), all=TRUE)
merged1b<-merge(merged1a, totalpers.s.3.30.Fair, by=c("subregion.name", "standtype.name"), all=TRUE)
merged1c<-merge(merged1b, totalpers.s.3.30.Unproductive, by=c("subregion.name", "standtype.name"), all=TRUE)
merged1d<-merge(merged1c, totalpers.s.31.60.Good, by=c("subregion.name", "standtype.name"), all=TRUE)
merged1e<-merge(merged1d, totalpers.s.31.60.Medium, by=c("subregion.name", "standtype.name"), all=TRUE)
merged1f<-merge(merged1e, totalpers.s.31.60.Fair, by=c("subregion.name", "standtype.name"), all=TRUE)
merged1g<-merge(merged1f, totalpers.s.31.60.Unproductive, by=c("subregion.name", "standtype.name"), all=TRUE)
merged1h<-merge(merged1g, totalpers.s.61.80.Good, by=c("subregion.name", "standtype.name"), all=TRUE)
merged1i<-merge(merged1h, totalpers.s.61.80.Medium, by=c("subregion.name", "standtype.name"), all=TRUE)
merged1j<-merge(merged1i, totalpers.s.61.80.Fair, by=c("subregion.name", "standtype.name"), all=TRUE)
merged1k<-merge(merged1j, totalpers.s.61.80.Unproductive, by=c("subregion.name", "standtype.name"), all=TRUE)
merged1l<-merge(merged1k, totalpers.s.81.100.Good, by=c("subregion.name", "standtype.name"), all=TRUE)
merged1m<-merge(merged1l, totalpers.s.81.100.Medium, by=c("subregion.name", "standtype.name"), all=TRUE)
merged1n<-merge(merged1m, totalpers.s.81.100.Fair, by=c("subregion.name", "standtype.name"), all=TRUE)
merged1o<-merge(merged1n, totalpers.s.81.100.Unproductive, by=c("subregion.name", "standtype.name"), all=TRUE)
merged1p<-merge(merged1o, totalpers.s.101.140.Good, by=c("subregion.name", "standtype.name"), all=TRUE)
merged1q<-merge(merged1p, totalpers.s.101.140.Medium, by=c("subregion.name", "standtype.name"), all=TRUE)
merged1r<-merge(merged1q, totalpers.s.101.140.Fair, by=c("subregion.name", "standtype.name"), all=TRUE)
merged1s<-merge(merged1r, totalpers.s.101.140.Unproductive, by=c("subregion.name", "standtype.name"), all=TRUE)
merged1t<-merge(merged1s, totalpers.s.141up.Good, by=c("subregion.name", "standtype.name"), all=TRUE)
merged1u<-merge(merged1t, totalpers.s.141up.Medium, by=c("subregion.name", "standtype.name"), all=TRUE)
merged1v<-merge(merged1u, totalpers.s.141up.Fair, by=c("subregion.name", "standtype.name"), all=TRUE)
merged1w<-merge(merged1v, totalpers.s.141up.Unproductive, by=c("subregion.name", "standtype.name"), all=TRUE)

merged1w$G.3.30[is.na(merged1w$G.3.30)]<-0 #replace NAs
merged1w$M.3.30[is.na(merged1w$M.3.30)]<-0 #replace NAs
merged1w$F.3.30[is.na(merged1w$F.3.30)]<-0 #replace NAs
merged1w$U.3.30[is.na(merged1w$U.3.30)]<-0 #replace NAs
merged1w$G.31.60[is.na(merged1w$G.31.60)]<-0 #replace NAs
merged1w$M.31.60[is.na(merged1w$M.31.60)]<-0 #replace NAs
merged1w$F.31.60[is.na(merged1w$F.31.60)]<-0 #replace NAs
merged1w$U.31.60[is.na(merged1w$U.31.60)]<-0 #replace NAs
merged1w$G.61.80[is.na(merged1w$G.61.80)]<-0 #replace NAs
merged1w$M.61.80[is.na(merged1w$M.61.80)]<-0 #replace NAs
merged1w$F.61.80[is.na(merged1w$F.61.80)]<-0 #replace NAs
merged1w$U.61.80[is.na(merged1w$U.61.80)]<-0 #replace NAs
merged1w$G.81.100[is.na(merged1w$G.81.100)]<-0 #replace NAs
merged1w$M.81.100[is.na(merged1w$M.81.100)]<-0 #replace NAs
merged1w$F.81.100[is.na(merged1w$F.81.100)]<-0 #replace NAs
merged1w$U.81.100[is.na(merged1w$U.81.100)]<-0 #replace NAs
merged1w$G.101.140[is.na(merged1w$G.101.140)]<-0 #replace NAs
merged1w$M.101.140[is.na(merged1w$M.101.140)]<-0 #replace NAs
merged1w$F.101.140[is.na(merged1w$F.101.140)]<-0 #replace NAs
merged1w$U.101.140[is.na(merged1w$U.101.140)]<-0 #replace NAs
merged1w$G.141up[is.na(merged1w$G.141up)]<-0 #replace NAs
merged1w$M.141up[is.na(merged1w$M.141up)]<-0 #replace NAs
merged1w$F.141up[is.na(merged1w$F.141up)]<-0 #replace NAs
merged1w$U.141up[is.na(merged1w$U.141up)]<-0 #replace NAs
write.csv(merged1w, file="totalarea.persubregion.stand.age.tpr.csv")
#Calculates cumulative area in risk matrix AVI geodatabase within each combination of subregion, stand, age class, and TPR

#Reformat as long dataset "areabyForestID" (did so manually)
#DONE UP TO HERE AS OF 5 PM July 11

#Now get point counts
#Recast by ForestID
pointcountsformatrix<-read.csv("pointsCdatacheckMay23.csv", header=TRUE)
pointcountsformatrix$ForestID<-paste0(pointcountsformatrix$subregion.name,".",pointcountsformatrix$standtype.name,".",pointcountsformatrix$ageclass,".",pointcountsformatrix$tpr.name)
pointsbyForestID<-tapply(pointcountsformatrix$counter, pointcountsformatrix$ForestID, sum)
write.csv(pointsbyForestID, file = "pointsbyForestID.csv")
#Used Data to Columns in Excel to split ForestID back into separate columns.
#matched up column categories from separate files in Excel, using the values in "pointsbyForestID"

pointsbyForestID<-read.csv("pointsbyForestID.csv", header=TRUE)
areabyForestID<-read.csv("areabyForestID.csv", header=TRUE)
merged1<-merge(pointsbyForestID, areabyForestID, by=c("ForestID"), all=TRUE)
write.csv(merged1, file="merged1.csv")
#For subregions other than CentralMixedwood (which was missing polygons in the combined R data frames back in May),
#total point counts per combination of subregion, stand, age class, and TPR are the same as those summed back in May.

#At this point Area.1000 (area in 1000-ha units) and survey effort can be calculated then merged back into the data 
#frame riskmatrixAVI.A to see how they look. Then if it looks all right, merged1 can be added to the risk matrix AVI in 
#a spatial join, and reformatted to make the risk matrix survey effort Excel file with coloured cells.

merged1<-read.csv("merged1.csv", header=TRUE)
merged1$tpr.name<-ifelse(merged1$tpr.name=="Fair","F",ifelse(merged1$tpr.name=="Good","G", ifelse(merged1$tpr.name=="Medium", "M", ifelse(merged1$tpr.name=="Unproductive", "U",  "0"))))

merged2<-merge(riskmatrixAVI.A, merged1, by=c("subregion.name", "standtype.name", "tpr.name", "ageclass"), all=TRUE)#6125635 obs. of  22 variables
str(merged2)
merged2[1000:1100,]
merged3<-merge(riskmatrixAVI.A, merged1, by=c("ForestID"), na.rm=TRUE)#0
merged4<-merged2[!is.na(merged2$Area.1000units),]#3316227 obs
str(merged3)

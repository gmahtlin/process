# Combining Datasets. 

# Set working directory to folder with the BM files 

setwd("H:/hww923/Documents/Process Evaluation")

# Import datasets into the R environment.Password protected so using the excel.link package as readxl 
# does not allow for password protected files

install.packages("excel.link")

#Leyhill Data

library("excel.link")
BM_Leyhill <- xl.read.file("BM_Leyhill_Merge_Finished.xlsx", password = "")           
View(BM_Leyhill)

#Springhill Data

BM_Springhill <- xl.read.file("BM_Springhill.xlsx", password = "")           
View(BM_Springhill)

#Stanford Hill Data 

library("excel.link")
BM_Stanfordhill <- xl.read.file("BM_Stanfordhill.xlsx", password = "")           
View(BM_Stanfordhill)

#NSC Data

library("excel.link")
BM_NSC <- xl.read.file("BM_NSC.xlsx", password = "")           
View(BM_NSC)

# All datasets that need combining are in the global environment 

-----------------------------------------------------------------------------
  
# The data is being combined vertically. All the columns in each data set 
# are the same, but the information in the rows are different.

#check if column names are identical between two data sets
  
identical(names(BM_Stanfordhill), names(BM_NSC))

# if names not identical 

names(BM_Stanfordhill) <- names(BM_NSC)

#check the names being made the same has worked 

identical(names(BM_Stanfordhill), names(BM_NSC))


#combining data sets

BM_All <- rbind(BM_NSC, BM_Stanfordhill, BM_Springhill, BM_Leyhill)


#Export BM_All as excel sheet


install.packages("rio")
library(rio)

export(BM_All, "BM_All.csv", col.names = TRUE, na= "NA")






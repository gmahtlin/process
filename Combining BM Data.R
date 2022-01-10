# Combining Behavioural Monitoring Datasets. 

# Set working directory to folder with the BM files 

setwd("H:/hww923/Documents/Process Evaluation")

# Import datasets into the R environment 

#Leyhill Data

library(readxl)
BM_Leyhill <- read_excel("BM_Leyhill_Merge_Finished.xlsx")
View(BM_Leyhill)

#Springhill Data - password protected so using the excel.link package as readxl 
#does not allow for password protected files

install.packages("excel.link")
library("excel.link")
BM_Springhill <- xl.read.file("BM_Springhill.xlsx", password = "PERSBMd8a")           
View(BM_Springhill)

#Stanford Hill Data - same steps as above.

library("excel.link")
BM_Stanfordhill <- xl.read.file("BM_Stanfordhill.xlsx", password = "PERSBMd8a")           
View(BM_Stanfordhill)

#NSC Data - as above. 

library("excel.link")
BM_NSC <- xl.read.file("BM_NSC.xlsx", password = "PERSBMd8a")           
View(BM_NSC)

-----------------------------------------------------------------------------
  
#Now the data is imported they can be combined into one file. The data is being 
#combined vertically all the columns in each dataset are the same, 
#but the information in the rows are different.

#check if column names are identical between two data frames
identical(names(BM_Leyhill), names(BM_Springhill))

#names not identical 
#making the names the same as Leyhill 
names(BM_Leyhill) <- names(BM_Springhill)

#check the names being made the same has worked 
identical(names(BM_Leyhill), names(BM_Springhill))

#combining datasets vertically
rbind(BM_Leyhill, BM_Springhill)

#Getting an error message "in as.POSIXlt" character string is not in a standard unambiguous format

#Identifying what the variables are
str(BM_Leyhill) #showed they were all characters - DOB not in correct format 

#Changed this in excel
#fixing issue with Springhill DOB
BM_Springhill <- xl.read.file("BM_Springhill.xlsx", password = "PERSBMd8a")           
View(BM_Springhill)
str(BM_Springhill)

#combining datasets vertically
rbind(BM_NSC, BM_Stanfordhill) #combining NSC and Stanford Hill

BM_NSC_Stanfordhill <- rbind(BM_NSC, BM_Stanfordhill) #Naming the dataframe of the bind

BM_NSC_Stanfordhill_Leyhill <- rbind(BM_NSC_Stanfordhill, BM_Leyhill) #Combining NSC + Standord Hill with Leyhill

BM_NSC_Stanfordhill_Leyhill_Sph <- rbind(BM_NSC_Stanfordhill_Leyhill, BM_Springhill) #Adding Spring Hill

#renaming combined BM data 

BM_All <- (BM_NSC_Stanfordhill_Leyhill_Sph)












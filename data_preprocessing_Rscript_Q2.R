setwd("C:/Users/sumar/OneDrive/Documents/data scientist")
kidney_disease=read.csv("kidney_disease.csv", stringsAsFactors = FALSE)
 View(kidney_disease)
 str(kidney_disease)  #to see the details of data
 kidney_disease$pcv <- as.numeric(kidney_disease$pcv) #change the data type from
                                                      #chr to numeric
 kidney_disease$wc <- as.numeric(kidney_disease$wc)
 kidney_disease$rc <- as.numeric(kidney_disease$rc)
 str(kidney_disease) #pcv,wc and rc data is converted to numeric from chr
 sum(is.na(kidney_disease)) #how many missing values in data
 sum(is.na(kidney_disease$pot))
 
 sum(is.na(kidney_disease$bp)) #finding missing values in each column
 
sum(is.na(kidney_disease$rbc))
#there is no NA in rbc column but there are empty values, these empty values 
#need to be converted to NA
kidney_disease[kidney_disease == ""]<-NA 
#all the empty values in data are converted to NA
 View(kidney_disease)
 sum(is.na(kidney_disease$rbc))
 sum(is.na(kidney_disease)) #total number of missing values are changed now
 
 
 #handling missing data
 #see the attribute/level of the data 
 levels(as.factor(kidney_disease$rbc))# level normal/abnormal
 levels(as.factor(kidney_disease$su)) #level 0,1,2,3,4,5
 levels(as.factor(kidney_disease$bgr)) # numeric data
 
 #replace missing value in age column with median 
 summary(kidney_disease$age)
 median_Age <- as.numeric(median(kidney_disease$age,na.rm=TRUE))
  kidney_disease$age[is.na(kidney_disease$age)] = median_Age
 
  #if the data is normally distributed,preferably to use mean for missing values
   summary(kidney_disease$bgr)
   summary(kidney_disease$pcv)
   barplot(kidney_disease$pcv)
   
   #replace missing value in bgr column with mean
   mean_RC <- as.numeric(mean(kidney_disease$rc,na.rm=TRUE))
   kidney_disease$rc[is.na(kidney_disease$rc)] = mean_RC
   
   #for nominal missing values. first convert text to number
   #then replace Na to one number
   kidney_disease$cad = factor(kidney_disease$cad, levels = c('yes', 'No'), labels = c(1, 0))
   kidney_disease$cad[is.na(kidney_disease$cad)] <- 0
   # pc and rbc have alot of missing values. so it is not a 
   #wise decision to replace  them with 0 or 1. it is better to 
   #replace them with previous or next value in data
   #first encode them in numeric
   kidney_disease$pc = factor(kidney_disease$pc, levels = c('normal', 'abnormal'), labels = c(1, 0))
   kidney_disease$pc[is.na(kidney_disease$pc)] <- 0
   #replace missing values with the previous value
   library(tidyr) #installed the package
   kidney_disease1 <- kidney_disease %>% fill(pc, .direction = 'down')
   PC
   View(kidney_disease1)
   
   #export save the data file
   write.csv(kidney_disease1, "kidney_disease_cleandata", row.names = FALSE)
   cat("The data frame is exported", "\n")
   
   options(digits=4)#format the digits to be appeared on screen
    View(kidney_disease_cleandata)
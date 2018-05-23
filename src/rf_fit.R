library(caret)
library(data.table)
library(dplyr)
library(devtools)
library(readr)
library(randomForest)

setwd("C:/Users/Richard/Desktop/csx415-project/data")
dat <- sample_course_data <- read_csv("SampleCourseData.csv")
setDT(dat)
dat
form <- EnrlTotal~CourseID+MaxUnits+TotalCapacity+TotalSections


#Create the fit object using a the random fores
rf_fit <- randomForest::randomForest(form,data=course_set,mtry=3,ntree=50)
# Build Model Packages 
pkg <- "pkgs/TotalEnrlPredictor"
if( ! dir.exists(pkg) ) devtools::create(pkg)

devtools::use_data(rf_fit, pkg = pkg, overwrite = TRUE )

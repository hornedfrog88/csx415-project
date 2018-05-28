library(caret)
library(data.table)
library(dplyr)
library(devtools)
library(readr)
library(randomForest)

setwd("C:/Users/Richard/Desktop/csx415-project")

#Read in the entire data set
sample_course_data <- read_csv("./data/SampleCourseData.csv")

#Filter Out Under and Over Enrolled Courses
course_set <- sample_course_data %>% filter((EnrlTotal) > 1,(TotalCapacity > 0))
course_set <- course_set %>% filter((EnrlTotal/TotalCapacity) >.75,(EnrlTotal/TotalCapacity)<1.10)
setDT(course_set)

#Save the model formula to a variable called form
form <- EnrlTotal~CourseID+MaxUnits+TotalCapacity+TotalSections

#Create the rf_fit object using a the random forest ML algorithm
rf_fit <- randomForest(form,data=course_set,mtry=4,ntree=50,na.action=na.exclude)

#Testing the call of the random forest model
#input <- data.frame(CourseID=154233,
#                    MaxUnits=3,
#                    TotalCapacity=63,
#                    TotalSections=4)

#rbind(data_prototype,input)
  
#predict(rf_fit,input)


# Build Model Packages 
pkg <- "pkgs/TotalEnrlPredictor"
if( ! dir.exists(pkg) ) devtools::create(pkg)
pkg <- "pkgs/TotalEnrlPredictor"
devtools::use_data(rf_fit, pkg = pkg, overwrite = TRUE )


#devtools::use_data(rf_fit, pkg = pkg, overwrite = TRUE )


library(caret)
library(data.table)
library(dplyr)
library(devtools)
library(readr)
library(randomForest)

setwd("C:/Users/Richard/Desktop/csx415-project")

#Read in the entire data set
sample_course_data <- read_csv("./data/SampleCourseData.csv")
#Filter Out Data Science Courses
course_set <- sample_course_data %>% filter(Subject == 'DATASCI')
setDT(course_set)

#Save the model formula to a variable called form
form <- EnrlTotal~CourseID+MaxUnits+TotalCapacity+TotalSections

#Create the fit object using a the random fores
rf_fit <- randomForest::randomForest(form,data=course_set,mtry=3,ntree=50)

# Build Model Packages 
pkg <- "pkgs/TotalEnrlPredictor"
if( ! dir.exists(pkg) ) devtools::create(pkg)

devtools::use_data(rf_fit, pkg = pkg, overwrite = TRUE )


library(caret)
library(data.table)
library(dplyr)
library(devtools)
library(readr)

setwd("C:/Users/Richard/Desktop/csx415-project")

#Read in the entire data set
sample_course_data <- read_csv("./data/SampleCourseData.csv")

#Filter Out Under and Over Enrolled Courses
course_set <- sample_course_data %>% filter((EnrlTotal) > 1,(TotalCapacity > 0))
course_set <- course_set %>% filter((EnrlTotal/TotalCapacity) >.75,(EnrlTotal/TotalCapacity)<1.10)
setDT(course_set)

#Save the model formula to a variable called form
form <- EnrlTotal~CourseID+MaxUnits+TotalCapacity+TotalSections

# Build Model Packages 
pkg <- "pkgs/TotalEnrlPredictor"
if( ! dir.exists(pkg) ) devtools::create(pkg)
pkg <- "pkgs/TotalEnrlPredictor"
devtools::use_data(lm_fit, pkg = pkg, overwrite = TRUE )



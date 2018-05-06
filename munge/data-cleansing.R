#Create a local data frame resulting from the course capacity query
course_capacity_local <- tbl_df(COURSE.CAPACITY.DATA)
#Filter the combined local data frame into training and test data sets
training_data_local <- course_capacity_local %>% filter(Term < 2182)
test_data_local <- course_capacity_local %>% filter(Term >= 2182)
#Minimize the columns of the training and test data sets
training_data_minimized <- training_data_local %>% select(CourseID, Course, Term, EnrlTotal, TotalSections, TotalCapacity)
test_data_minimized <- test_data_local %>% select(CourseID, Course, Term, EnrlTotal, TotalSections, TotalCapacity)
#Change the CourseID field from num to character in both minimized data frames
training_data_minimized$CourseID <- as.character(training_data_minimized$CourseID)
test_data_minimized$CourseID <- as.character(test_data_minimized$CourseID)
#Filter out courses that have the DATASCI Subject Code 
#These statements can be edited to analyze any desired Subject Area
final_training_set <- training_data_minimized %>% 
  filter(grepl('DATASCI', Course))
final_testing_set <- test_data_minimized %>% 
  filter(grepl('DATASCI', Course))

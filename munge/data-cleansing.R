#Create local data frames
course_capacity_local <- tbl_df(COURSE.CAPACITY.DATA)
total_enrl_attempts_local <- tbl_df(TOTAL.ENRL.ATTEMPTS.BY.COURSE)
#Combine local data frame
combined_data_local <- merge(course_capacity_local, 
                             total_enrl_attempts_local, 
                             by= c('CourseID','Term'))
#Filter the combined local data frame into training and test data sets
training_data_local <- combined_data_local %>% filter(Term < 2182)
test_data_local <- combined_data_local %>% filter(Term >= 2182)
#Minimize the columns of the training and test data sets
training_data_minimized <- training_data_local %>% select(EnrlTotal, TotalSections, TotalCapacity,TotalAttempts)
test_data_minimized <- test_data_local %>% select(EnrlTotal, TotalSections, TotalCapacity,TotalAttempts)
#Test of the Munge Load
QRF <- c(5,10,15,20,34,33,44,555,6,77,88,99,34,21,19)
#Multiple Linear Regression Model
#Plot some data
plot_linear <- ggplot(final_training_set,aes(TotalCapacity,EnrlTotal,color = CourseID)) + 
  geom_point()
plot_linear
#Fit the model
l_fit <- lm(EnrlTotal ~ TotalCapacity + 
              TotalSections + CourseID + Term, data = final_training_set)
summary(l_fit)
#Run the predict function on the final test dataset and analyze the results by calculating the Mean Absolute Error of the prediction.
predict_linear <- predict(l_fit, final_testing_set)
MAE_linear <- MAE(final_testing_set$EnrlTotal,predict_linear)
print(paste("The Mean Absolute Error of the Prediction is", round(MAE_linear, digits = 2)))



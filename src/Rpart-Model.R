# Create a Recursive Partition Regression Tree Model
fit_rpart <- rpart(EnrlTotal ~ TotalCapacity + 
                     TotalSections + CourseID + Term, data = final_training_set, method = "anova")
# Plot the resulting rpart tree using the rpart.plot function to display a more succint plot of the tree
plot_rpart <- rpart.plot(fit_rpart, type = 3, digits = 3, fallen.leaves = TRUE)
#Run the predict function on the final test dataset and analyze the results by calculating the Mean Absolute Error of the prediction.
predict_rpart <- predict(fit_rpart, final_testing_set)
MAE_rpart <- MAE(final_testing_set$EnrlTotal,predict_rpart)
RMSE_rpart <- RMSE(final_testing_set$EnrlTotal,predict_rpart)
print(paste("The Mean Absolute Error of the Prediction is", round(MAE_rpart, digits = 2)))
print(paste("The Root Mean Squared Error of the Prediction is", round(RMSE_rpart, digits = 2)))
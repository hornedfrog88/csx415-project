#Use the train function from the caret package to create samples and create a random forest model
c1 <- makeCluster(detectCores())
control <- trainControl(method = "boot",number = 10, allowParallel = TRUE)
rf_fit <- train(EnrlTotal~CourseID+Term+TotalSections+TotalCapacity,data = final_data_set,method = "rf",trControl = control)
stopCluster(c1)
summary(rf_fit)
predict_rf <- predict(rf_fit, final_testing_set)
MAE_rf <- MAE(final_testing_set$EnrlTotal,predict_rf)
RMSE_rf <- RMSE(final_testing_set$EnrlTotal,predict_rf)
print(paste("The Mean Absolute Error of the Prediction is", round(MAE_rf, digits = 2)))
print(paste("The Root Mean Squared Error of the Prediction is", round(RMSE_rf, digits = 2)))


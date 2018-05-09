#' @title Function that will return a random forest object
#' @description This function takes a data frame and trains the data using the random forest algorithm.
#' @export
library(caret)
library(randomForest)
library(doParallel)
c1 <- makeCluster(detectCores())
rf_fit <- function(final_data_set) {
  control <- trainControl(method = "boot",number = 10, allowParallel = TRUE)
  rf_fit <- train(EnrlTotal~CourseID+Term+TotalSections+TotalCapacity,
                  data = final_data_set,method = "rf",trControl = control)
  return(rf_fit)
  }
stopCluster(c1)

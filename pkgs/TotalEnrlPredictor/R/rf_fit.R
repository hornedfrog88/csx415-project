#' This function takes a data frame of summary course enrollments
#' and returns a Random Forest Model object for the purpose of
#' predicting total Course Enrollments for a given Subject Area
#' (e.g. Graduate Data Science courses)
#'
#' @param course_set A data frame containing the required 7 columns
#' @return random forest model object
#' @export
#' @examples
#' rf_fit(course_set)
rf_fit <- function(course_set) {
rf_fit <- randomForest::randomForest(EnrlTotal~MaxUnits+TotalCapacity+TotalSections,
                                    data=course_set,mtry=3,ntree=50)
  return(rf_fit)
}

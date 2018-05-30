#' @title Score Linear Function - Predict Total Course Enrollment using Linear Regression (4 Parameters)
#' @param CourseID 6 digit integer which is the unique UC Berkeley course identifier
#' @param MaxUnits 2 digit(max) integer
#' @param TotalCapacity 3 digit(max) integer
#' @param TotalSections 3 digit(max) integer
#'
#'
#' @examples
#'   score(125768,3,75,4)-DATASCI W266
#'   score(154233,3,63,4)-DATASCI W200
#'   score(114496,4,107,4)-MATH 1A
#'   score(114538,4,36,1)-MATH 141
#'   score(118027,4,100,1)-PHILOS 12A
#' @import jsonlite
#' @import dplyr
#' @import magrittr
#' @export

#Scoring Function
score_linear <- function(courseID,maxunits,totalcapacity,totalsections)
{
   input <- data.frame(CourseID=courseID,MaxUnits=maxunits,
                       TotalCapacity=totalcapacity,
                       TotalSections=totalsections)
#Create a data frame of the predicted value
  TotalPredEnrl <- rbind(data_prototype,input) %>%
  predict(lm_fit,.) %>%
  as.data.frame
#Round the predicted total enrolled value and pipe it to a JSON output
  round(TotalPredEnrl) %>% jsonlite::toJSON( )
}

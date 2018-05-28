#' @title Score Function - Predict Total Course Enrollment W/ 4 Inputs)
#' @param CourseID 6 digit integer which is the unique course identifier
#' @param MaxUnits 2 digit maximum integer
#' @param TotalCapacity 3 digit maximum integer
#' @param TotalSections 3 digit maximum integer
#'
#'
#' @examples
#'   score(125768,3,75,4)
#'   score(154233,3,63,4)
#' @import jsonlite
#' @import dplyr
#' @import magrittr
#' @export

#Scoring Function
score <- function(courseID,maxunits,totalcapacity,totalsections)
{
   input <- data.frame(CourseID=courseID,MaxUnits=maxunits,
                       TotalCapacity=totalcapacity,
                       TotalSections=totalsections)
# Create a data frame of the predicted value
  TotalPredEnrl <- rbind(data_prototype,input) %>%
  predict(rf_fit,.) %>%
  as.data.frame
# Round the predicted total enrolled value and pipe it to a JSON output
  round(TotalPredEnrl) %>% jsonlite::toJSON( )
}



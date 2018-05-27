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

score <- function(courseID,maxunits,totalcapacity,totalsections)
{
   input <- data.frame(CourseID=courseID,MaxUnits=maxunits,
                       TotalCapacity=totalcapacity,
                       TotalSections=totalsections)

  rbind(data_prototype, input) %>%
  ceiling((predict(rf_fit,input))) %>%
  as.data.frame %>%
  jsonlite::toJSON( )
}



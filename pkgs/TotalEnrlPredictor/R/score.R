#' @param Term 4 digit integer 2185-Summer 2018; 2188-Fall 2018; 2192-Spring; etc
#' @param CourseID 6 digit integer which is the unique course identifier
#' @param Subject Max 10 character subject code-"DATASCI"
#' @param MaxUnits 2 digit maximum integer
#' @param TotalCapacity 3 digit maximum integer
#' @param TotalSections 3 digit maximum integer
#'
#'
#' @examples
#'   score(2192,125768,"DATASCI",3,75,4)
#'   score(2192,154233,"DATASCI",3,63,4)
#' @import jsonlite
#' @import rpart
#' @import magrittr
#' @export

score <- function(Term,CourseID,Subject,MaxUnits,TotalCapacity,TotalSections) {
  if( ! type %in% levels(data_prototype$animal_type) )
    return("[Unknown Animal Type]")

  input <- data.frame(animal_type=type, age_years=age)
  rbind(data_prototype, input) %>%    # automagically convert factors
    predict(fit, ., type="prob") %>% as.data.frame %>%
    jsonlite::toJSON( )

}

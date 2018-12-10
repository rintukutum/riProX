#' @name get.projectsByYear
#' @description Get iProX pojects per day
#'
#' @export
get.projectsByYear <- function(
  year,
  type = 'year'
){
  date <- format.date(year = year,month = 6,day = 01)
  year <- strsplit(
    as.character(date),
    split='\\-')[[1]][1]
  url <- getURL(x = year,type = type)
  url.data <- check.status(url = url)
  return(url.data)
}

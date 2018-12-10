#' @name get.projectsByMonth
#' @description Get iProX pojects per day
#'
#' @export
get.projectsByMonth <- function(
  year,
  month,
  type = 'month'
){
  day <- '01'
  date <- format.date(year = year,month = month,day = 01)
  month <- paste(strsplit(
    as.character(date),
    split='\\-')[[1]][1:2],collapse = '-')
  url <- getURL(x = month,type = type)
  url.data <- check.status(url = url)
  return(url.data)
}

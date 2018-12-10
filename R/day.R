#' @name get.projectsByDay
#' @description Get iProX pojects per day
#'
#' @export
get.projectsByDay <- function(
  year,
  month,
  day,
  type = 'day'
){
  date <- format.date(year = year,month = month,day = day)
  if(!lubridate::is.Date(date)){
    stop('Please provide a valid year, month, day \nas describe in help(get.projectsByDay)!')
  }else{
    if(type == 'day'){
      url <- getURL(x = date,type = type)
    }else{
    stop('type is invalid!')
    }
    url.data <- check.status(url = url)
    # continue
    # x = 2017-06-20
    # IPX0000951000
    return(url.data)
  }
}

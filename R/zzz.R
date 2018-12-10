#' @name getURL
#' @description get data from iProX
getURL <- function(
  x,
  type = c('day','month','year')
){
  if(type == 'day'){
    url <- 'http://www.iprox.org/projectFileList/getProjectDataFileByDay.jsonp?date='
    url <- paste(
      url,
      x,
      sep=''
    )
  }
  if(type == 'month'){
    url <- 'http://www.iprox.org/projectFileList/getProjectDataFileByMonth.jsonp?date='
    # '2018-06'
    url <- paste(
      url,
      x,
      sep=''
    )
  }
  if(type == 'year'){
    url <- 'http://www.iprox.org/projectFileList/getProjectDataFileByYear.jsonp?date='
    # '2016'
    url <- paste(
      url,
      x,
      sep=''
    )
  }
  return(url)
}

#' @name check.status
#' @description Get status
check.status <- function(url){
  x.get <- httr::GET(url = url)
  x.out <- httr::content(x.get)
  if(x.out$code == 222){
    stop('There is no project released in the given date.')
  }
  if(x.out$code == 555){
    stop('System exception')
  }
  if(x.out$code == 200){
    return(x.out$data)
  }
}

#' @name format.date
#' @description format date
format.date <- function(
  year = '17',
  month = '06',
  day = '20'){
  date <- paste(year,month,day,sep='/')
  date <- as.Date(date,"%y/%m/%d")
  if(!lubridate::is.Date(date)){
    stop('Please provide a valid year, month, day \nas describe in help(get.projectsByDay)!')
  }else{
    return(date)
  }
}

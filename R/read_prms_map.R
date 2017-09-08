#' Read a PRMS Map Results output file
#' 
#' \code{read_prms_map} reads in a PRMS Map Results output file which maps selected PRMS variables to specified spatial and temporal distributions and returns it as an 3D array of dimensions \code{nrow x ncol x nstp}. Additionally, the start dates, end dates and number of days of each time step and the means of the variable averaged over the time step are returned as well.
#'
#' @param path path to the output file
#' @param nrow number of rows in the mapped spatial resolution
#' @param ncol number of columns in the mapped spatial resolution
#' @param start_date Date object specifying the start date of the output
#' 
#' @return a list with (1) a 3D array of dimensions \code{nrow x ncol x nstp} with nstp the amount of time steps, (2) vectors of start and end dates of each time step, (3) number of days in each time step and (4) means of the variable averaged over each time step
#' @export
#' @references \emph{Markstrom, S.L., Regan, R.S., Hay, L.E., Viger, R.J., Webb, R.M.T., Payn, R.A., and LaFontaine, J.H., 2015, PRMS-IV, the precipitation-runoff modeling system, version 4: U.S. Geological Survey Techniques and Methods, book 6, chap. B7, 158 p., https://dx.doi.org/10.3133/tm6B7}, \url{https://pubs.usgs.gov/tm/6b7/pdf/tm6-b7.pdf}


read_prms_map = function(path = NULL, nrow = NULL, ncol = NULL, start_date = NULL){
  
  lines = readLines(path)
  
  headers = lines[seq(1, length(lines), nrow+3)] 
  headers_split = lapply(strsplit(headers, split=' '), remove_empty_strings)
  
  # read_array
  read_array = function(array_lines){
    
    array = do.call(rbind, lapply(lapply(strsplit(array_lines, split=' '), remove_empty_strings), as.numeric))
    
    return(array)
  }
  
  if(headers_split[[1]][1] == 'Time' && headers_split[[1]][2] == 'period:'){
    
    start_dates = as.Date(headers_split[[1]][3])
    end_dates = as.Date(headers_split[[1]][4])
    nr_days = as.numeric(end_dates - start_dates)+1
    means = as.numeric(headers_split[[1]][length(headers_split[[1]])])
    
    array = read_array(lines[-1])
    
    prms_map = list(array = array, start_dates = start_dates, end_dates = end_dates, nr_days = nr_days, means = means)
    
  } else {
  start_dates = head(c(start_date, (do.call(c, lapply(lapply(headers_split, '[[', 1), as.Date))+1)), -1)
  end_dates = do.call(c, lapply(lapply(headers_split, '[[', 1), as.Date))
  nr_days = (as.numeric(end_dates) - as.numeric(start_dates))+1
  
  means = as.numeric(unlist(lapply(headers_split, '[[', 5)))
  
 
  # array
  array_index_start = c(2, seq(nrow+5, length(lines)-3, nrow+3))
  array_index_end = seq(nrow+1, length(lines), nrow+3)
  
  array_indices = mapply(FUN='seq', array_index_start, array_index_end, SIMPLIFY = F)
 
  array_lines =list()
  for (i in 1: length(array_indices)){
    
    array_lines[[i]] = lines[ array_indices[[i]] ]
  }
  
  array = lapply(array_lines, read_array)
  array = array(unlist(array), dim=c(nrow, ncol, length(array)))
  prms_map = list(array = array, start_dates = start_dates, end_dates = end_dates, nr_days = nr_days, means = means)
  }
  
  return(prms_map)
}



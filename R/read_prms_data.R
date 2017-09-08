#' Read in a PRMS data file
#' 
#' \code{read_prms_data} reads in a PRMS data file and returns it as a data frame
#' 
#' @param path path to the data file; the default searches for the data file in an "input" subfolder of the working directory
#' @param col_names optional character vector specifying the column names.
#' @param NA_flag optional flag specifying the data values that need to be converted to NA; defaults to -999
#'
#' @return a data frame 
#' @export
#' @references \emph{Markstrom, S.L., Regan, R.S., Hay, L.E., Viger, R.J., Webb, R.M.T., Payn, R.A., and LaFontaine, J.H., 2015, PRMS-IV, the precipitation-runoff modeling system, version 4: U.S. Geological Survey Techniques and Methods, book 6, chap. B7, 158 p., https://dx.doi.org/10.3133/tm6B7}, \url{https://pubs.usgs.gov/tm/6b7/pdf/tm6-b7.pdf}

read_prms_data = function(path = paste(getwd(), 'input/input.data', sep='/'), col_names=NULL, NA_flag = -999){
  
  lines = readLines(path)
  
  start = grep('#', lines)
  
  data=read.table(path, skip=start)
  if(!is.null(col_names)) colnames(data) = as.character(col_names)
  if(!is.null(NA_flag)) data[data==NA_flag] = NA
  
  return(data)
  
}

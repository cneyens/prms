#' Read a PRMS csv output file
#'
#' \code{read_prms_output} reads a PRMS output file in 'comma separated value' format (.csv) and returns it as a data frame
#'
#' @param path path to the csv file
#' @param as_date logical, indicating if the first column holding the simulation date should be of class \code{Date}
#'
#' @return a data frame
#' @export
#' @references \emph{Markstrom, S.L., Regan, R.S., Hay, L.E., Viger, R.J., Webb, R.M.T., Payn, R.A., and LaFontaine, J.H., 2015, PRMS-IV, the precipitation-runoff modeling system, version 4: U.S. Geological Survey Techniques and Methods, book 6, chap. B7, 158 p., https://dx.doi.org/10.3133/tm6B7}, \url{https://pubs.usgs.gov/tm/6b7/pdf/tm6-b7.pdf}

read_prms_output = function(path = paste0(getwd(), 'output.csv'), as_date = T){
  
  output = read.csv(path, skip=2, header=F)
  colnames(output) = strsplit(readLines(path, 1), ',')[[1]]
  if(as_date) output$Date = as.Date(output$Date, format = '%Y-%m-%d')
  
  return(output)
  
}
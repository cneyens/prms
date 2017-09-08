#' Write a PRMS parameter file
#' 
#' \code{write_prms_parms} writes a PRMS parameter file based on a PRMS Parameter Object
#' 
#' @param prms_parms a PRMS Parameter Object
#' @param path to write to
#'
#' @return NULL
#' @export
#' @seealso \code{\link{read_prms_parms}}, \code{\link{create_prms_parms}}
#' @references \emph{Markstrom, S.L., Regan, R.S., Hay, L.E., Viger, R.J., Webb, R.M.T., Payn, R.A., and LaFontaine, J.H., 2015, PRMS-IV, the precipitation-runoff modeling system, version 4: U.S. Geological Survey Techniques and Methods, book 6, chap. B7, 158 p., https://dx.doi.org/10.3133/tm6B7}, \url{https://pubs.usgs.gov/tm/6b7/pdf/tm6-b7.pdf}

write_prms_parms = function(prms_parms, path = paste(getwd(), 'input/input.parms', sep = '/')){
  
  # comments
  cat(paste0(prms_parms$comments, '\n', collapse=''), file=path, append=FALSE)
  
  # dimensions
  cat(paste0("** Dimensions **", '\n'), file=path, append=T)
  for (i in 1:length(prms_parms$dimensions$name)){
    
    cat(paste("####", prms_parms$dimensions$name[i], prms_parms$dimensions$value[i], '',  sep='\n'), file=path, append=T)  
  } 
  
  # parameters
  cat(paste0("** Parameters **", '\n'), file=path, append=T)
  for (i in 1:length(prms_parms$parameters$name)){
    
    cat(paste("####", prms_parms$parameters$name[i], prms_parms$parameters$nr_dim[i], '', sep="\n"), file=path, append=T)
    cat(paste(unlist(prms_parms$parameters$dim[[i]]), '', sep='\n', collapse='')  , file=path, append=T)
    cat(paste(prms_parms$parameters$nr_values[i], prms_parms$parameters$type[i], '', sep='\n'), file=path, append=T)
    cat(paste(prms_parms$parameters$values[[i]], '', sep='\n', collapse=''), file=path, append=T)
  } 
  
}
#' Create an PRMS Parameter Object
#' 
#' \code{create_prms_parms} creates an PRMS Parameter Object which can then be written to a PRMS parameter file
#'
#' @param comments a character vector with comments
#' @param dimensions a list with two elements where the first element is a character vector specifying the names of the dimensions and the second element a numeric vector specifying the dimension values
#' @param parameters a list with six elements where the first element if a character vector specifying the names of the parameters, the second element is a numeric vector specifying the number of dimensions, the third element is a list where each element is a character vector of length \code{nr_dim[i]} corresponding to the respective parameter which identifies the dimensions, the fourth element is a numeric vector specifying the number of values, the fifth element is a numeric vector specifying the parameter type and the sixth element is a list where each element is a numeric vector of length \code{nr_values[i]} for the respective parameter specifying the parameter values.
#'
#' @return an PRMS Parameter Object which is a list with 3 elements: comments (character vector), dimensions (list with names and values) and parameters (list with names, number of dimensions, dimensions, number of values, types and values)
#' @export
#' @seealso \code{\link{read_prms_parms}}, \code{\link{write_prms_parms}}
#' @references \emph{Markstrom, S.L., Regan, R.S., Hay, L.E., Viger, R.J., Webb, R.M.T., Payn, R.A., and LaFontaine, J.H., 2015, PRMS-IV, the precipitation-runoff modeling system, version 4: U.S. Geological Survey Techniques and Methods, book 6, chap. B7, 158 p., https://dx.doi.org/10.3133/tm6B7}, \url{https://pubs.usgs.gov/tm/6b7/pdf/tm6-b7.pdf}


create_prms_parms = function(comments, dimensions, parameters){
  
  prms_parms = list(comments=comments, dimensions=dimensions, parameters=parameters)
  
  class(prms_parms) = 'PRMS Parameter Object'
  return(prms_parms)
  
}
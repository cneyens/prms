#' Run a PRMS model
#' 
#' \code{run_prms} runs a PRMS model by opening a Windows shell and passing the control file to the PRMS executable. 
#' 
#' @param run_directory optional, the full path to the project directory where the output will be stored
#' @param exe_path path to the PRMS executable. May be relative with respect to \code{run_directory}
#' @param control_path path to the control file. May be relative with respect to \code{run_directory}
#' 
#' @return NULL
#' @export
#' @references \emph{Markstrom, S.L., Regan, R.S., Hay, L.E., Viger, R.J., Webb, R.M.T., Payn, R.A., and LaFontaine, J.H., 2015, PRMS-IV, the precipitation-runoff modeling system, version 4: U.S. Geological Survey Techniques and Methods, book 6, chap. B7, 158 p., https://dx.doi.org/10.3133/tm6B7}, \url{https://pubs.usgs.gov/tm/6b7/pdf/tm6-b7.pdf}

run_prms = function(run_directory = paste(getwd(), '&', 'cd ..'), exe_path = '../../bin/prmsIV.exe' , control_path = './control/nete.control'){
  
  if(!is.null(run_directory)){
    shell(paste('cd', run_directory, '&', exe_path, control_path), translate = T, mustWork = T)
  } else {
    shell(paste(exe_path, control_path), translate = T, mustWork = T)
    
    }
}
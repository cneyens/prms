
## Writes a PRMS parameter file from a PRMS Parameter Object.

# prms_parms : PRMS Parameter Object.
# path : character string denoting the path to the parameter file.

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
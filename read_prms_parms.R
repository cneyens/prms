
## Reads PRMS parameter file and returns a PRMS Parameter Object with comments, dimensions and parameters.

# path : character string denoting the path to the parameter file.

read_prms_parms = function(path = paste(getwd(), 'input/input.params', sep = '/')){
  
  lines = readLines(path)
  
  ### comments
  comments = lines[1 : (grep("Dimensions", lines)-1)]
  
  ### dimensions
  dimension_lines = lines[grep("Dimensions", lines) : (grep('Parameters', lines) - 1)]
  dimensions = list(name = dimension_lines[(grep("###", dimension_lines)+1)], value = as.numeric(dimension_lines[(grep("###", dimension_lines)+2)]) )
  
  ### parameters
  parameter_lines = lines[grep("Parameters", lines) : length(lines)]
  
  parameters = list()
  
  # name
  parameters$name = parameter_lines[grep("###", parameter_lines)+1]
  
  # number of dimensions
  parameters$nr_dim = as.numeric(parameter_lines[grep('###', parameter_lines)+2])
 
  # dimension names
  parameters$dim = list()
     for (i in 1:length(parameters$name)){
       if(parameters$nr_dim[i] == 1){
         parameters$dim[[i]] = as.character(parameter_lines[grep(parameters$name[i], parameter_lines)+2])
       } else {
         parameters$dim[[i]] = vector(mode='character', length = parameters$nr_dim[i])
         
         for(j in 1:parameters$nr_dim[i]){
           parameters$dim[[i]][j] = as.character(parameter_lines[grep(parameters$name[i], parameter_lines)+1+j]) 
         }
       }
    }
  
  # total number of input values for respective parameter
  parameters$nr_values = as.numeric(parameter_lines[grep('###', parameter_lines)+3+parameters$nr_dim]) 
  
  # type (integer = 1, real = 2, double = 3, string = 4)
  parameters$type = as.numeric(parameter_lines[grep('###', parameter_lines)+4+parameters$nr_dim])
  
  # input values
  parameters$values = list()
  
    for (i in 1:length(parameters$name)){
      if(parameters$type[i] == 4){
        parameters$values[[i]] = as.character(parameter_lines[(grep(parameters$name[i], parameter_lines)+4+parameters$nr_dim[i]) : (grep(parameters$name[i], parameter_lines)+4+parameters$nr_dim[i] + parameters$nr_values[i] -1)])
      } else {
        parameters$values[[i]] = as.numeric(parameter_lines[(grep(parameters$name[i], parameter_lines)+4+parameters$nr_dim[i]) : (grep(parameters$name[i], parameter_lines)+4+parameters$nr_dim[i] + parameters$nr_values[i] -1)])
      }
    }
  
  prms_parms = list(comments = comments, dimensions = dimensions, parameters = parameters)
  class(prms_parms) = 'PRMS Parameter Object'
  return(prms_parms)
  
  }

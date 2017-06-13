
#{} Reads PRMS output in the csv format. 

# path : character string denoting the path to the output (csv) file.

read_prms_output = function(path = paste0(getwd(), 'output.csv')){
  
 output = read.csv(path, skip=2, header=F)
 colnames(output) = strsplit(readLines(path, 1), ',')[[1]]
 output$Date = as.Date(output$Date, format = '%Y-%m-%d')
 
 return(output)
 
}
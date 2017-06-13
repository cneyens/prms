
## Creates an PRMS Parameter Object.

# comments : character vector with comments.
# dimensions : list of length 2 where the first element is a character vector (name) and the second element is a numeric vector (value).
# parameters : list of length 6 where the first element is a character vector (name), the second element is a numeric vector (nr_dim), the third element is a list where each element is a character vector of length nr_dim[i] (dim), the fourth element is a numeric vector (nr_values), the fifth element is a numeric vector (type) and the sixth element is a list where each element is a numeric vector of length nr_values[i].


create_prms_parms = function(comments, dimensions, parameters){
  
  prms_parms = list(comments=comments, dimensions=dimensions, parameters=parameters)
 
  class(prms_parms) = 'PRMS Parameter Object'
  return(prms_parms)
  
}
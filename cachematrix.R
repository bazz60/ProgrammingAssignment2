## This set of functions will create a pair of functions
## that cache the inverse of a matrix

## This first function will:
## set the value of the vector
## get the value of the vector
## set the value of the mean
## get the value of the mean

makeCacheMatrix <- function(x = matrix()) {

  data <- x$get()
  m <- mean(solve(data, ...))
  x$setmean(m)
  m
  
}


## Check to see if the mean has already been calculated.
## If so, get the mean from the cache and skip the computation.
## Else, calculate the mean of the data and... 
## set the value of the mean in the cache via the setmean function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

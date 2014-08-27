## This set of functions will create a pair of functions
## that cache the inverse of a matrix

## This first function will:
## set the value of the matrix
## get the value of the matrix
## set the value of the inverse
## get the value of the inverse

makeCacheMatrix <- function(x = matrix()) { # input x will be a matrix
  
  m <- NULL                  #  m will be our 'inverse' and it is reset to NULL every 
  #  time makeCacheMatrix is called
  set <- function(y) {       #  takes an input matrix
    x <<- y                  #  assigns the input matrix 
    m <<- NULL               #  resets the inverse to NULL
  }
  get <- function() x        # it returns the value of the original matrix
  
  setsolve <- function(solve) m <<- solve  # this is called by cacheSolve(), it stores the inverse  
  
  getsolve <- function() m    # this will return the cached value to cacheSolve()
  # on subsequent accesses
  
  list(set = set, get = get,  # This list is returned with the newly created object 
       setsolve = setsolve,   # It lists all the functions that are part of the object
       getsolve = getsolve)   # If a function is not on this list then it cannot be accessed externally
  
}


## Check to see if the inverse has already been calculated.
## If so, get the inverse from the cache and skip the computation.
## Else, calculate the inverse of the data and... 
## set the value of the inverse in the cache via the setsolve function.


cacheSolve <- function(x, ...) {   # the input is an object created by makeCacheMatrix        
  
  m <- x$getsolve()                 # accesses the object 'x' and gets the cached value
  
  if(!is.null(m)) {                 # if inverse was already cached (not NULL)
    message("getting cached data")  # send this message to the console
    return(m)                       # return the cached inverse
  }
  data <- x$get()             # if x$getsolve() returned NULL, then obtain the matrix
  m <- solve(data, ...)       # calculates the inverse
  x$setsolve(m)               # stores the computed inverse in setsolve
  m                           # return the inverse of the matrix  
  
}
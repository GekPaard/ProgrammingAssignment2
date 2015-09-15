##############################################################################
## Function containing functions to calculate the inversion of a squared matrix
##############################################################################
makeCacheMatrix <- function(x = matrix())
{
  m <- NULL
## get the matrix
  set <- function(y) 
  { x<<- y
    m <<- NULL
  }   
## return the matrix
  get <- function()
  { x
  }  
## create the inversion of the matrix
  setsolve <- function(solve)
  { m <<- solve(x)
  }
## return the inversion of the matrix
  getsolve <- function()
  { m
  }
## store the above functions
  list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)  
}
###########################################################################
## Function to retrieve an already calculated inversion of a squared matrix
## if the inversion doesn't match with given matrix
## it calculates a new inversion
###########################################################################
cacheSolve <- function(x, ...)
{ m <- x$getsolve()
## check if inversion already created
  if(!is.null(m)) 
  { message("getting cached data")
  }
## if not yet created, calculate a new one from the new data
  else
  { data <- x$get()
    m <- solve(data, ...)
    message("calculated new data")
    x$setsolve(m)
    
  }
  return(m)
}

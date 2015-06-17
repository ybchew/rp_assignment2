# Assignment: Caching the Inverse of a Matrix
#
## This function create a special matrix object that can cache its inverse

    makeCacheMatrix <- function(x = matrix()) {
        s <- NULL
 
## set the value of matrix
        
        set <- function(y) {
          x <<- y
          s <<- NULL
        }
        
## get the value of matrix
        
        get <- function() x
        
## set the value of the inverse by solve
        
        setsolve <- function(solve) s <<- solve
        
## get the value of the inverse 
        
        getsolve <- function() s
      
        list(set = set, get = get,
            setsolve = setsolve,
            getsolve = getsolve)
    }

# This function calculate the inverse of the special matrix returned by 
# makeCacheMatrix function

    cacheSolve <- function(x, ...) {
        s <- x$getsolve()

## check if inverse had been computed
## gets the inverse from cache if is not null
        
        if(!is.null(s)) {
            message("getting cached data")
            return(s)
        }
        
## calculate the inverse of the data          
        data <- x$get()
        s <- solve(data, ...)
        
## set the calculated values in the cache       
        x$setsolve(s)
        
        s
    }



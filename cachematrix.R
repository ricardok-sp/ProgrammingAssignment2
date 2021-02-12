## Creates a cache for a square matrix, storing the solve

## Creates a special "matrix" which is realy a list containing
## functions to set/get the values / solve of a square invertible
## matrix

makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    set <- function(y) {
      x <<- y
      s <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) s <<- solve
    getsolve <- function() s
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## Checks if the solve is already cached and, if it is, 
## returns it. Otherwise, calculates the solve, stores it
## on cache and returns it

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}

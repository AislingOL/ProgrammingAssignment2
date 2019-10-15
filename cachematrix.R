## The fllowing functions create an object that can cache the inverse of a matrix, and then retreive the inverse from the cache.

## This function creates a"matrix" object capable of caching its inverse.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
        x <<- y
        m <<- NULL
  }
  get <- function() x
  set_inverse_matrix <- function(inverse) m <<- inverse
  get_inverse_matrix <- function() m
  list(set = set, get = get,
      set_inverse_matrix = set_inverse_matrix,
      get_inverse_matrix = get_inverse_matrix)
  }


##  This function computes the inverse of the "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$get_inverse_matrix()
  if(!is.null(m)) {
         message("getting cached data")
         return(m)
  }
     data <- x$get()
     m <- solve(data, ...)
     x$set_inverse_matrix(m)
     m
   }

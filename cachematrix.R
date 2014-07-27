## Put comments here that give an overall description of what your
## functions do

## This mimics the makeVector() function in the example.
## It provides a simple bundle of data and get/set operations,
## but nothing really interesting yet.

makeCacheMatrix <- function(x = matrix()) {
  m_inverse <- NULL # the cached inverse
  set <- function(y) {
    x <<- y
    m_inverse <<- NULL
  }
  get <- function() x
  setinverse <- function(a_inverse) m_inverse <<- a_inverse
  getinverse <- function() m_inverse
  list(
    set = set,
    get = get,
    setinverse = setinverse,
    getinverse = getinverse
    )
}


## Mysteriously external operation that returns the inverse or its cached value.

cacheSolve <- function(x, ...) {
  inverse <- x$getinverse()
  if(!is.null(inverse)) {
    message("getting cached inverse")
    return(inverse)
  }
  data <- x$get()
  inverse <- solve(data)
  x$setinverse(inverse)
  inverse
}

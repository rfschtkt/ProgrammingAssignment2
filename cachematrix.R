## This is a bit more like an object.

makeCacheMatrix <- function(x = matrix()) {
  m_inverse <- NULL # the cached inverse
  list(
    set = function(y) {
      x <<- y
      m_inverse <<- NULL
    },
    get = function() x,
    getinverse = function() {
      if(!is.null(m_inverse)) {
        message("getting cached inverse")
        return(m_inverse)
      }
      m_inverse <<- solve(x)
      m_inverse
    }
    )
}

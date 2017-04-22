## This script containg two functions, makeCacheMatrix and cacheSolve. 
## 

## v creates a list that stores and caches a matrix and its invert.

makeCacheMatrix <- function(x = matrix()) { 
	i<- NULL
      set <- function (y) {
		x<<-y
            i<<-NULL
	}
	get <- function()x 
	setinverse <- function(solve) i<<-solve
	getinverse <- function() i
	list(set = set, get = get, 
	     setinverse = setinverse, 
           getinverse = getinverse)	
}


## cacheSolve() retrieves the inverted matrix from the value cached by makeCacheMatrix()

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	i<-x$getinverse()
	if(!is.null(i)){
		message("getting cached data")
		return(i)
	}
	matrix<-x$get()
	i<-solve(matrix)
	x$setinverse(i)
	i	
}

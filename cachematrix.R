################################################################################
## This file contains functions which can be used to create a matrix object that
## can cache its inverse matrix.
##
## It has the following two functions:
##
## 1. makeCacheMatrix:
## This function creates a special "matrix" object that can cache its inverse.
##
## 2. cacheSolve:
## This function computes the inverse of the special "matrix" returned by the
## 'makeCacheMatrix' function and stores it in cache. If the inverse matrix is
## available in cache, then this cached matrix is retrieved and returned.
################################################################################


################################################################################
## Function: makeCacheMatrix
## Purpose: To create a special "matrix" object which can cache its inverse
## Arguments: A Matrix which is invertible
## Returns: A List of functions to work with the special "matrix" object
################################################################################
makeCacheMatrix <- function(x = matrix()) {
    # set the inverse matrix variable to NULL
    im <- NULL
    
    # set the value of the matrix
    set <- function(y) {
        x <<- y
        im <<- NULL
    }
    
    # get the value of the matrix
    get <- function() x
    
    # set the value of the inverse matrix
    setinverse <- function(m) im <<- m
    
    # get the value of the inverse matrix
    getinverse <- function() im
    
    # return a list of functions
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


################################################################################
## Function: cacheSolve
## Purpose: To compute the inverse of a special "matrix" object returned by the
## 'makeCacheMatrix' function.
## Arguments: Matrix object and the List of arguments to be passed to solve()
## Returns: The inverse matrix of the special "matrix" object supplied
################################################################################
cacheSolve <- function(x, ...) {
    # retrieve the inverse matrix in cache
    i <- x$getinverse()
    
    # check if the inverse matrix is NULL
    if (!is.null(i)) {
        # return the cached inverse matrix
        message("getting inverse matrix from cache.")
        return(i)
    }
    
    # compute the inverse matrix
    mx <- x$get()
    i <- solve(mx, ...)
    
    # set the inverse matrix (i.e. cache it)
    x$setinverse(i)
    
    # return inverse matrix
    i
}


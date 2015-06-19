################################################################################
## This file contains functions that allow to cache the inverse of a matrix.
## It has the following two functions:
## 1. makeCacheMatrix:
## This function creates a special "matrix" object that can cache its inverse.
## 2. cacheSolve:
## This function computes the inverse of the special "matrix" returned by the
## 'makeCacheMatrix' function.
################################################################################


################################################################################
##  Write a short comment describing this function
################################################################################
makeCacheMatrix <- function(x = matrix()) {
    im <- mxNULL
    
    set <- function(y) {
        x <<- y
        im <<- NULL
    }
    get <- function() x
    
    setinverse <- function(m) im <<- m
    getinverse <- function() im
    
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


################################################################################
## Write a short comment describing this function
################################################################################
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
}

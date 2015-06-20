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
## Write a short comment describing this function
################################################################################
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
}

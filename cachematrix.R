## Title: cachematrix
## Author: medranom
## Description: The two functions contained in this file fulfill the 
## requirements for Programming Assignment 2 of the Johns Hopkins 
## R Programing Coursera course.

## This function creates something of a wrapper around a matrix object.
## It returns a list of functions that that reach into the scope of the 
## object to manipulate objects contained within. This is possible 
## because R uses lexical scoping. One of the objects within the scope
## represents a cache of some data. It could be improved by renaming so
## that the caching mechanism is not limited to matricies 

makeCacheMatrix <- function(x = matrix()) {
  
  # This statement creates the cache object within the
  # scope of the makeCacheMatrix function
  cache <- NULL
  
  # If a new matrix is assigned, clear the cache
  # This is reminisant of lazy loading
  set <- function(value) {
    x <<- value
    cache <<- NULL
  }
  
  get <- function (){
    x
  }
  
  # Make note of the <<- operator. In this function
  # cache refers to the object in the makeCacheMatrix 
  # function rather than the setCache function.
  setCache <- function(value){
    cache <<- value
  }
  
  getCache <- function() {
    cache
  }
  
  # Return the newly created functions for later use
  list(get=get, set=set, getCache=getCache, setCache=setCache)
}


## This function builds upon the makeCacheMatrix function by defining
## that the cache value as the inverse of the matrix with which originally
## given as an argument to makeCacheMatrix. If the value has already been
## computed the returned value reflects it, saving computational time.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  
  # Attempt to get the current cache value
  inv <- x$getCache()
  
  # If cache hit, return the cache data
  if(!is.null(inv)){
    message("Getting cached data")
    return(inv)
  }
  
  # If cache miss, compute the inverse of the 
  # initial matrix and save to cache
  inv <- solve(x$get())
  x$setCache(inv)
  
  # Return computed value
  return(inv)
}

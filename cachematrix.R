## Put comments here that give an overall description of what your
## functions do

## There are two functions here which help calculate the inveser 
##of a square matrix and whose det is not 0. The second function  cacheSolve
##takes in the instance of first functon makeCacheMatrix and eiter calculates 
##mean and stores it as part or reads the part that was already stored 


## Write a short comment describing this function


## This is a class defination  
## x and m and public methods 
makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }

## public methods  get, set, setmean and getmean 
  
  get<-function() x
  setmatrix<-function(solve) m<<- solve
  getmatrix<-function() m
  list(set=set, get=get,
       setmatrix=setmatrix,
       getmatrix=getmatrix)
}


## Write a short comment describing this function

cacheSolve <- function(x=matrix(), ...) {
  m<-x$getmatrix()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  matrix<-x$get()
  m<-solve(matrix, ...)
  x$setmatrix(m)
  m
}       

## Return a matrix that is the inverse of 'x'


## this code works as I have tested with d<-makeCacheMatrix()
##d$set(rbind(c(1,0,4), c(1,3,4), c(4,1,0))) 
##cacheSolve(d)
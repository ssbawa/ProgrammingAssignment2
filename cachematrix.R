## Put comments here that give an overall description of what your
## Functions do

##Sunil == Here are two functions which help calculate the inverse 
##of a square matrix and whose determinant is not 0. The second function  
##cacheSolve takes in the instance of first function makeCacheMatrix 
##and either calculates inverse of matrix and stores it as part or reads the part 
##that was already stored. 


## Write a short comment describing this function

##Sunil == 
## This is a class definition 
## Name of function makeCacheMatrix. This is a special matrix and has list of functions to
## set value of the matrix, get value of matrix, set the inverse and get value of matrix
## inverse
## m is x's private property within this function. x will exist in list environment.    

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
## public method set is a function set.  
  set<-function(y){
##x<<- will change value of x in parent environment or above levels to y     
    x<<-y
##m<<- will change value of m in parent environment or above levels to null         
    m<<-NULL
  }
## Public methods get, setmatrix,  getmatrix 
## create function get and when called returns value of x
  get<-function() x
## Sunil == setmatrix caches the inverse of the matrix by storing in x's 
## Private property m. 
##Solve is a parameter passes to function setmatrix. <<- makes sure that a 
##new m is not created and that R changes the value of m that exist.
  setmatrix<-function(solve) m<<- solve
## create function getmatrix and when called returns value of m
  getmatrix<-function() m
## list of the functions set, get,setmatrix,getmatrix 
  list(set=set, get=get,
       setmatrix=setmatrix,
       getmatrix=getmatrix)
}

## Write a short comment describing this function

##Sunil == the first time you run the cacheSolve on a matrix it calculates the 
##inverse at that time and stores it. The next time you call cacheSolve on the same
## Matrix it is able to find the inverse stored in makeCacheMatrix function and simply
## retrieves already calculated output 

##Name of function cacheSolve
cacheSolve <- function(x=matrix(), ...) {
  m<-x$getmatrix()
  if(!is.null(m)){
    message("getting cached data")
## returns the inverse value     
    return(m)
  }
  matrix<-x$get()
##Sunil == this is to pass further parameter to the function solve that is used inside 
##body of cacheSolve   
  m<-solve(matrix, ...)
  x$setmatrix(m)
  m
}       

## Return a matrix that is the inverse of 'x'

## Sunil == this code works as I have tested with d<-makeCacheMatrix()
##d$set(rbind(c(1,0,4), c(1,3,4), c(4,1,0))) 
##cacheSolve(d)
## matrix a<- rbind(c(1,0,4), c(1,3,4), c(4,1,0)) and solve(a), same result


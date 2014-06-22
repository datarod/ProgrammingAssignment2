## workspace for cache
# setup stuff

## This is completed by datarod on 20140623
## have an easy matrix ready to use for testing
x <- matrix( rnorm(16), ncol=4, byrow=TRUE )

## This function adds an object if the inverse has already been solved.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL  # Null the initial matrix
        set <- function(y) { 
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve  # uses solve as the ojbect
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}


## This function caclulates the inverse
## It first checks to see if the inverse has already been calculated
## If the inverse has not been calculated it solves it, then saves it

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        ## First check to see if you have solved it before
        
        m <- x$getsolve()
        if(!is.null(m)) {  
                message("getting cached data")
                return(m)  # if yes, return the answer
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m 
}


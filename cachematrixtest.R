
input <- matrix(rnorm(1000000), 1000)
specialMatrix <- makeCacheMatrix(input)

start <- proc.time()
output <- cacheSolve(specialMatrix)
end <- proc.time()

print("First Runtime")
end - start



start <- proc.time()
output <- cacheSolve(specialMatrix)
end <- proc.time()

print("Second Runtime")
end - start


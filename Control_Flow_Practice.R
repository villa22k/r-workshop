library(microbenchmark)

##################
# Set 1

microbenchmark({
  total_population_1 <- c()
  for (i in 1:nrow(state.x77)) {
    total_population_1 <- c(total_population_1, state.x77[i, 1])
  }
}) # neval = 100, median = 55.403

microbenchmark({
  total_population_2 <- c()
  for (i in 1:nrow(state.x77)) {
    append(total_population_2, state.x77[i, 1])
  }
}) # neval = 100, median = 83.3735


microbenchmark({
  total_population_3 <- rep(NA, nrow(state.x77))
  for (i in 1:nrow(state.x77)) {
    total_population_3[i] <- state.x77[i, 1]
  }
}) # neval = 100, median = 92.1


microbenchmark({
  lapply(state.x77, function(s) s[1])
}) # neval = 100, median = 216.9105


##################
# Set 2

set.seed(32)
x <- runif(1e6, -1, 1)

# Method 0
o <- rep(NA, 1e6)
microbenchmark({
  for (i in 1:length(x)) {
    if (x[i] < 0) {
      o[i] <- 'Negative'
    } else {
      o[i] <- 'Positive'
    }
  }
}) # Median = 976.0524 millisecs

# Method 1
# Median = 

# Methad 2
o3 <- rep(NA, 1e6)
microbenchmark({
  o3[x < 0] <- 'Negative'
  o3[x >= 0] <- 'Positive'
}) # Median  = 17.63954 millisecs


#################
# Set 3

x <- 0
while(x < 7) {
  x <- x + 1
  if (x %% 2 == 0) next
  print(x)
}


################
# Set 4

set.seed(157)
m <- matrix(c(rnorm(30, 0), rnorm(30, 2), rnorm(30, 5),
              nrow = 30, ncol = 3))
  
# Method 1
microbenchmark({
  apply(m, 2, mean)
}) # mean = 20.50995

# Method 2
microbenchmark({
  colMeans(m)
}) # mean = 3.95014

# Method 3
microbenchmark({
  o <- rep(NA, 3)
  for (i in 1:3) {
    o[i] <- mean(m[i,])
  }
}) # mean = 15.36912

# Method 4
microbenchmark({
  o2 <- rep(NA, 3)
  for (i in 1:dim(m)[1]) {
    r <- rep(NA, dim(m)[2])
    for (j in 1:dim(m)[2]) {
      r[j] <- m[i,j]
    }
  o2[i] <- mean(r)
  }
}) # mean = 561.3342

# Method 5
microbenchmark({
  o2 <- rep(NA, 3)
  for (i in 1:nrow(m)) {
    r <- rep(NA, ncol(m))
    for (j in 1:ncol(m)) {
      r[j] <- m[i,j]
    }
    o2[i] <- mean(r)
  }
}) # mean = 610.2942



######################
# Functions

g1 <- function(x) {
  return(x + 1)
}
g1(5)


g2 <- function(x, y)  (x ** 2) + (y ** 2)
g2(3, 4)

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
o2 <- rep(NA, 1e6)
microbenchmark({
  for (i in 1:length(x)) {
    ifelse(x[i] < 0,
           o2[i] <- 'Negative',
           o2[i] <- 'Positive')
  }
}) # Median = 

# Methad 2
o3 <- rep(NA, 1e6)
microbenchmark({
  o3[x < 0] <- 'Negative'
  o3[x >= 0] <- 'Positive'
}) # Median  = 17.63954 millisecs
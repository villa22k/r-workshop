
total_population <- c()
for (i in 1:nrow(state.x77)){
  total_population <- c(total_population, state.x77[i, 1])
}

library(microbenchmark)
microbenchmark(
  total_population_1 <- c(),
  for (i in 1:nrow(state.x77)){
    total_population_1 <- c(total_population, state.x77[i, 1])
  }
)

microbenchmark(
  total_population_2 <- c(),
  for (i in 1:nrow(state.x77)){
    total_population_2<-append(total_population_2, state.x77[i, 1])
  }
)

microbenchmark(
  total_population_3 <- rep(NA, times=50),
  for (i in 1:nrow(state.x77)){
  total_population_3[i]<-state.x77[i, 1]
  }
)
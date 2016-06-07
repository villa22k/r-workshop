
set.seed(32)
x <- runif (1e6, -1, 1)
posneg<- rep (NA, 1e6)

library(microbenchmark)

microbenchmark ({
  for (i in 1:length(x)) {
    posneg <- ifelse (x[i] > 0, "positive", "negative")
    }
  }
)
# Mean: 1.776472 (ms)

microbenchmark ({
  for (i in 1:length(x)) {
    if (x[i] >= 0) {
        posneg <- "positive"
     } else {
        posneg <- "negative"
    }
  }
}
)
# Mean 389.5635 (ms)

microbenchmark({
   posneg <- ifelse (x >= 0, "positive", "negative")
  }
)
# Mean 259.8563 (ms)

microbenchmark({
  posneg[x >= 0] <- "positive"
  posneg[x < 0] <- "negative"
  }
)
# Mean 23.1111 (ms)
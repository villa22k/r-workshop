
set.seed(157)
m <- matrix(c(rnorm(30,0), rnorm(30,2),
              rnorm(30,5)), nrow=30, ncol=3)

microbenchmark(
  {
    apply(m, 2, mean)
  }
)

microbenchmark(
  {
    colMeans(m)
  }
)

 microbenchmark(
   {
     mean <- c()
     for (k in 1:ncol(m))
     {
       for (i in 1:nrow(m)){
         mean<- mean + m[i,k]
       }
       mean<-mean / nrow(m[,k]) 
     }
   }
 )
 # Make a vector from each col and calculate mean()
 # Print even numbers and skip others when x is btw 0-7
x <- 0
 
 while (x < 7){
    x <- x + 1
    if ( x %% 2 == 0) {
      next
    }
    print(x)
 }
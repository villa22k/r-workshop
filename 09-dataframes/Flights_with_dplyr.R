library(devtools)
install_github("ismayc/pnwflights14")

library(dplyr)
library(pnwflights14)

filter(flights, day == 17 & month == 3)

filter(flights, dest == 'ORD')

filter(flights, dest == 'ORD' && carrier == 'UA')

filter(flights, distance > 2000 | air_time / 60 > 5)

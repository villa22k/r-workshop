library(devtools)
install_github("ismayc/pnwflights14")

library(dplyr)
library(pnwflights14)

filter(flights, day == 17 & month == 3)

filter(flights, dest == 'ORD')

filter(flights, dest == 'ORD' && carrier == 'UA')

filter(flights, distance > 2000 | air_time / 60 > 5)


###########


foo <- data.frame(x = c(1, 2, 3),
                  y = c(6, 5, 4))
bar <- data.frame(x = c(4, 5, 6),
                  y = c(3, 2, 1))

foobar <- c(foo, bar)                   # NO
foobar2 <- merge(foo, bar, all = TRUE)  # YES


###########


speed <- select(mutate(flights, avg_speed = distance / (air_time / 60)),
                avg_speed,
                tailnum)

by_tailnum <- group_by(speed, tailnum)
avg_speed <- summarize(by_tailnum, 
                       count = n(), 
                       avg_speed = mean(avg_speed, na.rm = TRUE))
arrange(avg_speed, desc(avg_speed))

speed %>%
  group_by(tailnum) %>%
  summarize(count = n(), avg_speed = mean(speed, na.rm = TRUE)) %>%
  arrange(desc(avg_speed))


###########


flights %>%
  select(carrier, dep_delay) %>%
  group_by(carrier) %>%
  summarize(count = n(), avg_delay = mean(dep_delay, na.rm = TRUE)) %>%
  arrange(avg_delay)

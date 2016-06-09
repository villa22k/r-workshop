library(ggplot2)

p <- ggplot(CO2, aes(x = conc, y = uptake, colour = Plant)) +
  geom_point(aes(shape = Type), size = 3) +
  geom_line() +
  theme_bw()
p

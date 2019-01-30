# Tidy Jeopardy:

library(tidyverse)

# atmospheric flux
read_csv('~/localRepos/meet_R/practice_data/CR1000_soil_01_feb272012_jul172013.dat') %>% 
  head(n = 10)

# iris
head(iris)

# mtcars
head(mtcars)

# tb
read_csv('~/localRepos/meet_R/practice_data/tb.csv') %>% 
  head(n = 20)
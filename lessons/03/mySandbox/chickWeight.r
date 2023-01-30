# date: 31 Jan 2023

rm(list = ls()) # clear out the variables from memory to make a clean execution of the code.

# If you want to remove all previous plots and clear the console, run the following two lines.
graphics.off() # clear out all plots from previous work.

cat("\014") # clear the console


library(tidyverse) # call the library to make plots

data() # find data sets to play with your code

names(ChickWeight) # I choose ChickWeight now check out the headers of the set

ggplot(data = ChickWeight) +
  geom_point(
    mapping = aes(
      x = weight, 
      y = Chick, 
      color = Time
      )
    )


ggplot(data = ChickWeight) +
  geom_point(
    mapping = aes(
      x = Chick, 
      y = weight, 
      color = Time
    )
  )

ggplot(data = ChickWeight) +
  geom_point(
    mapping = aes(
      x = Chick, 
      y = weight, 
      color = Time,
      size = Diet
    )
  )

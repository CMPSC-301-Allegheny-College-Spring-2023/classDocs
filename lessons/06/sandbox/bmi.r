# date: 23 Feb 2023
# demo code of quantiles for simple data set

rm(list = ls()) # clear out the variables from memory to make a clean execution of the code.

# If you want to remove all previous plots and clear the console, run the following two lines.
graphics.off() # clear out all plots from previous work.

cat("\014") # clear the console

library(tidyverse)
library(tibble)
library(dplyr) # and load tidyverse too!
data_people <- tibble::tribble(
  ~EyeColour, ~Height, ~Weight, ~Age,
  "Blue",        1.8, 110L, 18L,
  "Brown",       1.9, 150L, 34L,
  "Blue",        1.7, 207L, 28L, 
  "Brown",       1.9, 170L, 21L,
  "Blue",        1.9, 164L, 29L,
  "Brown",       1.9, 183L, 31L,
  "Brown",       1.9, 175L, 20L,
  "Blue",        1.9, 202L, 27L
)
# Find the average BMI of people with blue eyes using piping
# Note: BMI = (height / (weight * weight))
data_people %>% select(EyeColour, Height, Weight) %>% filter(EyeColour=="Blue") %>% mutate(BMI = Weight / Height^2) %>% summary(averageBMI == mean(BMI))

ggplot(data = data_people) + 
  geom_point(mapping = aes(y = Height, x = Weight, color = Age )) + geom_smooth(mapping = aes(y = Height, x = Weight))
# Try playing with the settings!!

ggplot(data = data_people) + geom_point(mapping = aes(y = Height, x = Weight, color = Age )) + geom_smooth(mapping = aes(y = Height, x = Weight )) + facet_wrap(~EyeColour)


rm(list = ls()) # clear out the variables from memory to make a clean execution of the code.

# If you want to remove all previous plots and clear the console, run the following two lines.
graphics.off() # clear out all plots from previous work.

cat("\014") # clear the console

library(tidyverse)

# open the wages.csv dataset from the data.
w <- file.choose() # load the filename: wages.csv

wages <- read.csv(w) # load and read the data.

View(wages)
wages %>% ggplot(aes(x = height, y = earn)) + geom_point(alpha = I(1/4)) + geom_smooth() # add a line
wages %>% ggplot(aes(x = height, y = earn)) + geom_point(alpha = I(1/4)) + geom_smooth(method = lm) # linear model line
# Try switching the x’s and y’s for another view.

# Find correlations using the "pearson" method
cor(wages$earn, wages$height, method = "pearson")

hmod <- lm(earn ~ height, data = wages)
summary(hmod)

rmod <- lm(earn ~ race, data = wages)
coef(rmod) # get the model’s y-intercepts and slopes


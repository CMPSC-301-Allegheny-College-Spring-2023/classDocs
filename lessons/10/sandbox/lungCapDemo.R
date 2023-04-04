
rm(list = ls()) # clear out the variables from memory to make a clean execution of the code.

# If you want to remove all previous plots and clear the console, run the following two lines.
graphics.off() # clear out all plots from previous work.

cat("\014") # clear the console


library(tidyverse)

# install.packages("psych")
library(psych)
#open lung capacity data

lc <-file.choose()

dataLungCap <- read.csv(lc, sep = ",", header = T)
View(dataLungCap)

# model creation
mod <- lm(data = dataLungCap, LungCap ~ Age + Height)
# get a report of the model
summary(mod)

dataLungCap %>% ggplot(aes(x = Age, y = predict(mod))) + geom_point(alpha = I(1/4))

dataLungCap %>% ggplot(aes(x = Age, y = predict(mod))) + geom_point(alpha = I(1/4)) + geom_smooth()

dataLungCap %>% ggplot(aes(x = Age, y = predict(mod))) + geom_point(alpha = I(1/4)) + geom_smooth(method = lm)


cor(dataLungCap$Age, dataLungCap$Height)

dev.off()
corPlot(dataLungCap[1:3])

dev.off()
pairs.panels(dataLungCap)

dev.off()
pairs.panels(dataLungCap[1:3])



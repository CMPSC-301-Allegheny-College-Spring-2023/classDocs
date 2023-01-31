# date: 26 Jan 2023

rm(list = ls()) # clear out the variables from memory to make a clean execution of the code.

# If you want to remove all previous plots and clear the console, run the following two lines.
graphics.off() # clear out all plots from previous work.

cat("\014") # clear the console



##### Sunspot data #####
# if necessary to install library
# note: this only needs to be run once!
# install.packages("tidyverse") 



# after your library has been installed, then you load it using
library(tidyverse)
# library(ggplot2) 

# load the data
sunData <- read.table(file.choose(), header = TRUE, sep = ",")

# See what the data looks like
View(sunData)

# Load a data file directly from a path:
#sunData <- read.table("path/sunSpots.csv", header = TRUE, sep = ",")
names(sunData)

ggplot(data = sunData) +  geom_point(mapping = aes(x = fracOfYear, y = sunspotNum))

# Add a smooth line to see general trends
ggplot(data = sunData) +  geom_point(mapping = aes(x = fracOfYear, y = sunspotNum)) + geom_smooth(mapping = aes(x = fracOfYear, y = sunspotNum))

# Color by year
ggplot(data = sunData) +  geom_point(mapping = aes(x = fracOfYear, y = sunspotNum, color = fracOfYear)) + geom_smooth(mapping = aes(x = fracOfYear, y = sunspotNum))

# Color by month
ggplot(data = sunData) +  geom_point(mapping = aes(x = fracOfYear, y = sunspotNum, color = month)) + geom_smooth(mapping = aes(x = fracOfYear, y = sunspotNum))

####
# Save the file
# what is the difference between the two graphs below?

ggplot(data = sunData) +  geom_point(mapping = aes(x = fracOfYear, y = sunspotNum, color = fracOfYear)) + geom_smooth(mapping = aes(x = fracOfYear, y = sunspotNum))

# Save to your Mac or Linux Desktop
# ggsave("~/Desktop/pngSave_sunSpots_yearVersusSunspots_1.png")


ggplot(data = sunData) +  geom_point(mapping = aes(x = fracOfYear, y = sunspotNum, color = month)) + geom_smooth(mapping = aes(x = fracOfYear, y = sunspotNum))

# Save to your current working directory
# ggsave("ggsave_sunSpots_yearVersusSunspots_1.png")


ggplot(data = sunData) +  geom_point(mapping = aes(x = fracOfYear, y = sunspotNum, color = fracOfYear)) + geom_smooth(mapping = aes(x = fracOfYear, y = sunspotNum))

# Save to your current working directory
# ggsave("ggsave_sunSpots_yearVersusSunspots_2.png")


ggplot(data = sunData) +  geom_point(mapping = aes(x = fracOfYear, y = numObs, color = fracOfYear)) + geom_smooth(mapping = aes(x = fracOfYear, y = numObs))


ggplot(data = sunData) +  geom_point(mapping = aes(x = fracOfYear, y = numObs, color = fracOfYear)) + geom_smooth(mapping = aes(x = fracOfYear, y = sunspotNum))


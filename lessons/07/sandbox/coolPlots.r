# heatmap plotting

rm(list = ls()) # clear out the variables from memory to make a clean execution of the code.

# If you want to remove all previous plots and clear the console, run the following two lines.
graphics.off() # clear out all plots from previous work.

cat("\014") # clear the console


library(plotly)
library(tidyverse)

# Date: 27 Feb 2023
# Reference: https://plot.ly/ggplot2/geom_tile/
# Check out other types of plots to make:
# https://plotly.com/ggplot2/geom_tile/#basic-geomtile-graph
# gallery: https://plotly.com/python/creating-and-updating-figures/


# get the data online
spinrates <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/spinrates.csv", stringsAsFactors = FALSE)

# Heatmap: oranges and purples

p <- ggplot(spinrates, aes(x=velocity, y=spinrate)) +
  geom_tile(aes(fill = swing_miss)) +
  scale_fill_viridis_c(option = "B", direction = -1) +
  labs(title = "Likelihood of swinging and missing on a fastball",
       y = "spin rate (rpm)") +
  theme_light()
ggplotly(p) # draw/show the interactive plot
p # show the plot; non-interactive

# _______________________________________

# Heatmap: blues and greens

p <- ggplot(spinrates, aes(x=velocity, y=spinrate)) +
  geom_tile(aes(fill = swing_miss)) +
  scale_fill_distiller(palette = "YlGnBu", direction = 1) +
  theme_light() +
  labs(title = "Likelihood of swinging and missing on a fastball",
       y = "spin rate (rpm)")
ggplotly(p) # draw/show the interactive plot
p # show the plot; non-interactive

# _______________________________________

######## diamonds #####

# View(diamonds)

# Define data variables

mycut <- diamonds$cut
mycarat <- diamonds$carat
myPrice <- diamonds$price
myZ <- diamonds$z

# Build plotly plot
p <- ggplot(diamonds, aes(y=mycut, x=mycarat)) +
  geom_tile(aes(fill = myPrice)) +
  scale_fill_distiller(palette = "YlGnBu", direction = 1) +
  theme_light() +
  labs(title = "Diamonds and prices",
       x = "mycarat")
ggplotly(p)

# Build plotly plot
p <- ggplot(diamonds, aes(x=mycut, y=mycarat)) +
  geom_tile(aes(fill = myPrice)) +
  scale_fill_distiller(palette = "YlGnBu", direction = 1) +
  theme_light() +
  labs(title = "Diamonds and prices",
       y = "mycarat")
ggplotly(p)



#________________________________________

# Another cool interative scatter plot!

library(plotly)
set.seed(123)

x <- rnorm(1000)
y1 <- 2*x + rnorm(1000)
y2 <- x^2 + rnorm(1000)

ds <- data.frame(data = x, 
                 Linear = y1, 
                 Quadratic = y2)


cols1 <- c("#ff8080", "#66b3ff")
cols2 <- c("#ff4d4d", "#3399ff")

p <- ggplot(ds, aes(x = data)) + 
  geom_point(aes(y = Linear, color = "Linear"), size = 2, alpha = 0.5) + 
  geom_point(aes(y = Quadratic, color = "Non Linear"), size = 2, alpha = 0.5) + 
  stat_smooth(aes(x = data, y = Linear, linetype = "Linear Fit"), method = "lm", formula = y ~ x, se = F, size = 0.25, color = cols2[1]) + 
  stat_smooth(aes(x = data, y = Quadratic, linetype = "Quadratic Fit"), method = "lm", formula = y ~ poly(x,2), se = F, size = 0.25, color = cols2[2]) + 
  scale_color_manual(name = "Relationship", values = c(cols1[1], cols1[2])) + 
  scale_linetype_manual(name = "Fit Type", values = c(2, 2)) + 
  ggtitle("Manual Legend for Stat Smooth")

p <- ggplotly(p)
p

# more reading: https://plotly.com/python/creating-and-updating-figures/

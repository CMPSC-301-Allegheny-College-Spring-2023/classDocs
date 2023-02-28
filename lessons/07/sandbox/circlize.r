# Plotting with the Circlize library
# ref: https://jokergoo.github.io/circlize_book/book/introduction.html

#### Circlize demo plot ######## 

rm(list = ls()) # clear out the variables from memory to make a clean execution of the code.

# If you want to remove all previous plots and clear the console, run the following two lines.
graphics.off() # clear out all plots from previous work.

cat("\014") # clear the console

# install.packages("circlize")
library(tidyverse)
library(circlize)

set.seed(999)
n = 1000
df = data.frame(sectors = sample(letters[1:8], n, replace = TRUE),
                x = rnorm(n), y = runif(n))

circos.par("track.height" = 0.1)
circos.initialize(df$sectors, x = df$x)

circos.track(df$sectors, y = df$y,
             panel.fun = function(x, y) {
               circos.text(CELL_META$xcenter, 
                           CELL_META$cell.ylim[2] + mm_y(5), 
                           CELL_META$sector.index)
               circos.axis(labels.cex = 0.6)
             })
col = rep(c("#FF0000", "#00FF00"), 4)
circos.trackPoints(df$sectors, df$x, df$y, col = col, pch = 16, cex = 0.5)
circos.text(-1, 0.5, "text", sector.index = "a", track.index = 1)

bgcol = rep(c("#EFEFEF", "#CCCCCC"), 4)
circos.trackHist(df$sectors, df$x, bin.size = 0.2, bg.col = bgcol, col = NA)

circos.track(df$sectors, x = df$x, y = df$y,
             panel.fun = function(x, y) {
               ind = sample(length(x), 10)
               x2 = x[ind]
               y2 = y[ind]
               od = order(x2)
               circos.lines(x2[od], y2[od])
             })

circos.update(sector.index = "d", track.index = 2, 
              bg.col = "#FF8080", bg.border = "black")
circos.points(x = -2:2, y = rep(0.5, 5), col = "white")
circos.text(CELL_META$xcenter, CELL_META$ycenter, "updated", col = "white")

#### end of Circlize demo plot ####


#### diamonds ######## 

rm(list = ls()) # clear out the variables from memory to make a clean execution of the code.

# If you want to remove all previous plots and clear the console, run the following two lines.
graphics.off() # clear out all plots from previous work.

cat("\014") # clear the console

#View(diamonds)

# categorical data
#myCata <- diamonds$color
myCata <- diamonds$clarity

myX <- diamonds$x
length(myX)
myY <- diamonds$y
length(myY)

circos.par("track.height" = 0.1) # measurement of how far towards the centre we go. If we add 0.5, then we are halfway to the centre. If we use, 1, then we are extending all the way to the centre. 

circos.initialize(myCata, x = myX ) # set the dataframe with the plot. 

circos.track(myCata, y = myY,
             panel.fun = function(x, y) {
               circos.text(CELL_META$xcenter, 
                           CELL_META$cell.ylim[0] + mm_y(1), 
                           CELL_META$sector.index)
               circos.axis(labels.cex = 0.6)
             })

col = rep(c("#FF0000", "#00FF00"), 4)
circos.trackPoints(myCata, myX, myY, col = col, pch = 16, cex = 0.5)
circos.text(-1, 0.5, "SI2", sector.index = "SI2", track.index = 1)

bgcol = rep(c("#EFEFEF", "#CCCCCC"), 4)
circos.trackHist(myCata, myX, bin.size = 0.2, bg.col = bgcol, col = NA)

circos.track(myCata, x = myX, y = myY,
             panel.fun = function(x, y) {
               ind = sample(length(x), 10)
               x2 = x[ind]
               y2 = y[ind]
               od = order(x2)
               circos.lines(x2[od], y2[od])
             })

circos.update(sector.index = "SI2", track.index = 2, 
              bg.col = "#FF8080", bg.border = "black")
circos.points(x = -2:2, y = rep(0.5, 5), col = "white")
circos.text(CELL_META$xcenter, CELL_META$ycenter, "updated", col = "white")

#### end of diamonds plot ####


#### dartboard ########

rm(list = ls()) # clear out the variables from memory to make a clean execution of the code.

# If you want to remove all previous plots and clear the console, run the following two lines.
graphics.off() # clear out all plots from previous work.

cat("\014") # clear the console


sectors = 1:20  # just indicate there are 20 sectors
circos.par(gap.degree = 0, cell.padding = c(0, 0, 0, 0),
           start.degree = 360/20/2, track.margin = c(0, 0), clock.wise = FALSE)
circos.initialize(sectors, xlim = c(0, 1))

circos.track(ylim = c(0, 1), sectors = sectors, bg.col = "black", track.height = 0.15)
circos.trackText(x = rep(0.5, 20), y = rep(0.5, 20),
                 labels = c(13, 4, 18, 1, 20, 5, 12, 9, 14, 11, 8, 16, 7, 19, 3, 17, 2, 15, 10, 6),
                 cex = 0.8, sectors = sectors, col = "#EEEEEE", font = 2, facing = "downward")
circos.track(ylim = c(0, 1), sectors = sectors,
             bg.col = rep(c("#E41A1C", "#4DAF4A"), 10), bg.border = "#EEEEEE", track.height = 0.05)
circos.track(ylim = c(0, 1), sectors = sectors,
             bg.col = rep(c("black", "white"), 10), bg.border = "#EEEEEE", track.height = 0.275)
circos.track(ylim = c(0, 1), sectors = sectors,
             bg.col = rep(c("#E41A1C", "#4DAF4A"), 10), bg.border = "#EEEEEE", track.height = 0.05)
circos.track(ylim = c(0, 1), sectors = sectors, 
             bg.col = rep(c("black", "white"), 10), bg.border = "#EEEEEE", track.height = 0.375)

draw.sector(center = c(0, 0), start.degree = 0, end.degree = 360,
            rou1 = 0.1, col = "#4DAF4A", border = "#EEEEEE")
draw.sector(center = c(0, 0), start.degree = 0, end.degree = 360,
            rou1 = 0.05, col = "#E41A1C", border = "#EEEEEE")

#### end of dartboard ####


# Case Study with Student Data
# Rick Scavetta
# 09.06.2023

# Load packages
library(tidyverse)
source("functions.R")

# Import data ----
jelena <- read.csv("GOI_expression.csv")
jelena_rep <- read.csv("GOI_expression_rep.csv")

# Expore data ----
str(jelena)
summary(jelena)

str(jelena_rep)
summary(jelena_rep)


# Data munging ----
jelena <- data_munging(jelena)
jelena_rep <- data_munging(jelena_rep)

# Plotting ----
## Plot type 0 (heat map)
# x = condition
# y = gene
# color = mean_count
# geom: tile, raster


ggplot(jelena, aes(condition, gene, fill = mean_count)) +
    geom_tile()

## Plot type 1 ----
jelena |>  
    # filter( ..... ) |> 
    ggplot(aes(time, mean_count, color = gene)) + 
    geom_line() + 
    geom_point() + 
    facet_wrap(~ treatment)

jelena |>  
    ggplot(aes(time, mean_count, color = gene)) + 
    geom_line() + 
    geom_point() + 
    facet_grid(class ~ treatment)

jelena |> 
    group_split(class)

## Plot type 2
# Using paired color set
RColorBrewer::display.brewer.pal(4, "Paired")
as.factor(jelena$treatment)
# Hue for differentiation
# Diff = Blue
# No Diff = Green

# Lightness for treatment
# Trt = Dark color
# No Trt = light color

myColors <- RColorBrewer::brewer.pal(4, "Paired")[c(2,1,4,3)]

munsell::plot_hex(myColors)

names(myColors) <- c("Dd", "Dx", "xd", "xx")


ggplot(jelena, aes(time, mean_count, color = treatment)) +
    geom_line() +
    geom_point() + 
    scale_color_manual(values = myColors) +
    facet_grid(. ~ gene)


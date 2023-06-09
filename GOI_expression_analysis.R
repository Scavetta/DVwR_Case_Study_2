# Case Study with Student Data
# Rick Scavetta
# 09.06.2023

# Load packages
library(tidyverse)

# Import data:
jelena <- read.csv("GOI_expression.csv")

# Expore data:
str(jelena)
summary(jelena)

# Data munging:
# break up treatement column into two new variables:
jelena$diff <- jelena$treatment %in% c("Dd", "Dx")
jelena$trt <- jelena$treatment %in% c("Dd", "xd")

# For genes:
unique(jelena$Gene)
# jelena$class <- str_extract(jelena$Gene, ".{1}")
# str_extract(jelena$Gene, "^.{1}")
jelena$class <- str_extract(jelena$Gene, "\\D")

# For time: This should be numeric
unique(jelena$time)
# str_remove(jelena$time, ".{1}$")
jelena$time <- as.numeric(str_remove(jelena$time, "\\D")) # REmove any non-digit characters (i.e. "h")

# Change name of column
names(jelena)[2] <- "gene"

# Plotting:


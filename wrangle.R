rm(list = ls())
library(stringr)
library(plyr)
datafolder <- "TheCountedData"

# fl <- file.list(datafolder)

badcol = c("lawenforcementagency", "day", "streetaddress", "name")


fp = file.path(datafolder, "the-counted-2015.csv", fsep=.Platform$file.sep)
shoot1 <- read.csv(fp)
fp <- str_replace(fp, "5", "6")
shoot2 <- read.csv(fp)

shoots <- rbind(shoot1, shoot2)
shoots <- shoots[ , -which(names(shoots) %in% badcol)]
shoots <- shoots[-which(shoots$raceethnicity %in% c("Other", "Unknown")) ,]

summ <- summary(shoots)
print(summ)
# This is some terrible wrangling
# totshoots <- length(shoots$raceethnicity)
# rcs = unique(shoots$raceethnicity)
# rcs <- as.array(levels(rcs))
# prop <- data.frame("Race"=c("Proportion"))
# for (r in rcs)
# {
#   b = sum(shoots$raceethnicity == r)
#   pro <- b/totshoots
#   print(r) 
#   print(pro) 
#   prop <- c(prop, r=c(pro))
# }
# print(prop)

fp = file.path(datafolder, "USDemographics.csv", fsep=.Platform$file.sep)
print(fp)
pop <- read.csv(fp) 
  

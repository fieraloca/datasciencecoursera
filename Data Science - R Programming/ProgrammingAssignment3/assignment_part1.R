## assignment part1


rm(list = ls())
source("best.R")
#best("BB","heart attack")
#best("NY","hert attack")

best("TX", "heart attack")
best("TX", "heart failure")
best("TX", "heart attack")
best("MD", "heart attack")
best("MD", "pneumonia")


outcomedata <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
outcomechoices <- c("heart attack", "heart failure", "pneumonia")



## Check that state is valid
states <- unique(outcomedata[,7])
if (!(state %in% states)) stop("invalid state")

## Check that outcome is valid
if (!(outcome %in% outcomechoices)) stop("invalid outcome")


L <- outcomedata$State == "TX"

goodresults = outcomedata[L,]

result = switch(outcome,
                "heart attack"  = goodresults[,11],
                "heart failure" = goodresults[,17],
                "pneumonia"     = goodresults[,23])

## Return hospital name in that state with lowest 30-day death
## rate



result <- as.numeric(goodresults[,11])

selected <- which.min(result)

outcomedata[selected,2]


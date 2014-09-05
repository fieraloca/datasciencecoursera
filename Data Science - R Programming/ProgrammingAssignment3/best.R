best <- function(state, outcome) {
  ## Read outcome data
  #  "heart attack", "heart failure", or "pneumonia".
  
  outcomedata <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  outcomechoices <- c("heart attack", "heart failure", "pneumonia")
  
  
  
  ## Check that state is valid
  states <- unique(outcomedata[,7])
  if (!(state %in% states)) stop("invalid state")
  
  ## Check that outcome is valid
  if (!(outcome %in% outcomechoices)) stop("invalid outcome")
  
  L <- outcomedata$State == state
  
  goodresults = outcomedata[L,]
  
  result = switch(outcome,
                  "heart attack"  =  as.numeric(goodresults[,11]),
                  "heart failure" =  as.numeric(goodresults[,17]),
                  "pneumonia"     =  as.numeric(goodresults[,23]))
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  selected <- which.min(result)
  
  goodresults[selected,2]
}

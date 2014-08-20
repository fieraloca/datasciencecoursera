complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
         
        tname <- paste(formatC(id, width = 3, flag = 0),".csv", sep = "")
        
        fname <- paste(directory,"/",tname, sep = "")
        
        fulldata <- vector(mode = "numeric", length = length(id))
        
        for ( i in seq_along(id)){
                
#                 print(fname[i])
                sensor <- read.csv(fname[[i]])
                ok <- complete.cases(sensor)
                thesum <- sum(ok)
                fulldata[i] <- thesum
#                 print(c(id[i],thesum))
        }

        data.frame(id, nobs = fulldata)
}
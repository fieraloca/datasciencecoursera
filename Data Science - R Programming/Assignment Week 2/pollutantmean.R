
pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
        ## setting the working directory to the directory with the data files 

        tname <- paste(formatC(id, width = 3, flag = 0),".csv", sep = "")
        
        fname <- paste(directory,"/",tname, sep = "")

        fulldata <- vector("numeric")
        
        for ( i in seq_along(id)){
                
                #print(fname[i])
                sensor <- read.csv(fname[[i]])
                y <- sensor[pollutant]
                z <- y[!is.na(y)]
                fulldata <- c(fulldata,z)
                #print(c(i, length(z),mean(z), length(fulldata)))
                
        }
        round(mean(fulldata), digits = 3)
}

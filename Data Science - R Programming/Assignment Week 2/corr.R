corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        
        # getting the list of all the files in the folder
        filelist <- list.files(directory)
        
        # calling complete.R to get the number of files  with completed observation
        datos <- complete(directory, id = 1:length(filelist))
        
        # finding the files with completed observations bigger than the threshold
        cleandatos <- datos[datos["nobs"] > threshold,]
        
        theid <- as.numeric(cleandatos$id)
        
        tname <- paste(formatC(theid, width = 3, flag = 0),".csv", sep = "")
        fname <- paste(directory,"/",tname, sep = "")
        
        results <- vector(mode = "numeric", length = length(theid))
        
        #we need to process the files in the cleandatos data frame and to the correlation
        for ( i in seq_along(theid)){
                
#                 print(fname[i])
                sensor <- read.csv(fname[[i]])
                sensorfiltered = sensor[complete.cases(sensor),]
                x <- sensorfiltered["nitrate"]
                y <- sensorfiltered["sulfate"]
                results[i] <-  round(cor(x,y), digits = 4)
                

#                 results[i] <-  round(cor(sensor$sulfate,sensor$nitrate), digits = 5)
        }
        results
}
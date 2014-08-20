# test_pollutantmean

# clearing the environment
rm(list = ls())
source("pollutantmean.R")

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)

# source("pollutantmean.R")
# pollutantmean("specdata", "sulfate", 1:10)
# 
# ## [1] 4.064
# 
# pollutantmean("specdata", "nitrate", 70:72).
# ## [1] 1.706
# 
# pollutantmean("specdata", "nitrate", 23)
# ## [1] 1.281



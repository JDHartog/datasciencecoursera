## This function opens datafiles in directory "directory" and calculates the mean value of a pollutant "pollutant" 
pollutantmean <- function(directory, pollutant, id = 1:332) {
      
      ##This function opens the desired csv files and saves the data to a data frame called data
      currentwd <- getwd()
      setwd(directory)
      files <- list.files(getwd())
      data <- read.csv(files[[id[[1]]]])
      id <- tail(id, -1)
            for (i in id){
                  data <- rbind(data, read.csv(files[[i]]))
            }
      setwd(currentwd)
      ##This function selects the data related to the pollutant of interest
      filtereddata <- data[c(pollutant)]       
      ##This function  strips NA and calculates the mean
      lapply(filtereddata, mean, na.rm = TRUE)
      
      
}
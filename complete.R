
complete <- function(directory, id = 1:332) {
      ##This function opens the desired csv files and saves the data to a data frame called data
      currentwd <- getwd()
      setwd(directory)
      files <- list.files(getwd())
      nobs <- rep(NA, length(id))
            for (i in 1:length(id)){
                  data <- read.csv(files[[id[i]]])
                  counts <- na.omit(data) 
                  nobs[[i]] <- dim.data.frame(counts)[1]
            }
      setwd(currentwd)
      
      #Create dataframe with results 
      nobs <- na.omit(nobs)
      results <- data.frame(id, nobs)
      results
      }
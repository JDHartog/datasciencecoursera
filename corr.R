##Function for corelation
corr <- function(directory, threshold = 0) {
      # threshold is a numeric vector of length 1 indicating the number of completely observed observations required
      # to compute the correlation
      # function returns a numeric vector of correlations
      
      ##This function opens the desired csv files and saves the data to a data frame
      currentwd <- getwd()
      n <-1
      setwd(directory)
      files <- list.files(getwd())
      nobs <- rep(NA, 332)
      corvec <- rep(NA, 332)
      for (i in 1:332){
            data <- read.csv(files[[i]])
            counts <- na.omit(data) 
            nobs[[i]] <- dim.data.frame(counts)[1]
            if (nobs[[i]] > threshold) {
                  sulfate <- counts[,"sulfate"]
                  nitrate <- counts[, "nitrate"]
                  corvec[n] <- cor(sulfate, nitrate)
                  n <- n+1
            }
      }
      setwd(currentwd)
      corvec <- na.omit(corvec)
}
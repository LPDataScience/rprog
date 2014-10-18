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
    
    # initialize the data frame
    data <- NULL
    # process all IDs given
    for (monid in id) {
        # read in data from file
        fname = sprintf("%s/%03d.csv", directory, monid)
        mondata <- read.csv (fname)
        # add this frame to the data collected so far
        data <- rbind(data, mondata)
    }
    
    # calculate and return the mean
    round(colMeans (data[pollutant], na.rm = TRUE), 3)
}

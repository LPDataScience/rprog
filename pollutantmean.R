pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    if (length(directory) != 1) {
        FALSE
        return
    }
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    if (length(pollutant) != 1) {
        FALSE
        return
    }
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    
    # read in the data
    data = NULL;
    for (monid in id) {
        # read in data from file
        fname = sprintf("%s/%03d.csv", directory, monid)
        mondata <- read.csv (fname)
        data <- rbind(data, mondata)
    }
    
    # calculate the mean
    round(colMeans (data[pollutant], na.rm = TRUE), 3)
}

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
    
    # initialize the data frame
    data <- NULL
    # process all IDs given
    for (monid in id) {
        # read in data from file
        fname = sprintf("%s/%03d.csv", directory, monid)
        mondata <- read.csv (fname)
        # find just the complete rows
        complete.data <- complete.cases(mondata)
        # add this to the data collected so far 
        data <- rbind(data, data.frame(id = monid, nobs = nrow(mondata[complete.data,])))
    }
    # return the data set collected
    data
}

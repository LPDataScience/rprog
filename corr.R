corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    
    # initialize the data frame
    pollution.data <- NULL
    # process all files in the given directory
    num.files <- length(list.files(directory))
    for (id in 1:num.files) {
    #for (id in 1:10) {
        # if # complete rows is below the threshold, skip this file
        num.complete = complete(directory, id:id)[1,"nobs"]
        if (num.complete < threshold || num.complete == 0) next
        # read in data from file
        fname = sprintf("%s/%03d.csv", directory, id)
        mondata <- read.csv (fname)
        # add the correlation to the data collected so far 
        pollution.data <- c(pollution.data, 
                                cor(mondata[,"sulfate"], mondata[,"nitrate"], "complete.obs"))
    }
    # return the correlations
    pollution.data
}

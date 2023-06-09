# Data Munging for Jelena

data_munging <- function(x) {
    ## For treatment ----
    # break up treatement column into two new variables:
    x[,"diff"] <- x[,"treatment"] %in% c("Dd", "Dx")
    x[,"trt"] <- x[,"treatment"] %in% c("Dd", "xd")
    
    ## For genes ----
    x[,"class"] <- str_extract(x[,"Gene"], "\\D") # EXTRACT any non-digit characters (i.e. "X", "Y", "Z")
    # str_extract(jelena$Gene, ".{1}")
    # str_extract(jelena$Gene, "^.{1}")
    
    # Change name of column (for consistency)
    names(x) <- tolower(names(x))
    
    ## For time ----
    # This should be numeric
    x[,"time"] <- as.numeric(str_remove(x[,"time"], "\\D")) # REMOVE any non-digit characters (i.e. "h")
    # str_remove(jelena$time, ".{1}$")
    
    return(x)
}
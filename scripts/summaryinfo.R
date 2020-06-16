# Summary Information Script
# Natalie Roy
# Date: 5/20/20

# the summary information function. takes in a dataset and
# returns a list of values about the dataset.

get_summary_info <- function(dataset) {
  info_list <- list()
  # returns the number of rows in the dataset
  info_list$num_rows <- nrow(dataset)
  # returns the number of columns in the dataset
  info_list$num_cols <- ncol(dataset)
  # returns the number of unique location values in the dataset
  info_list$num_location <- length(unique(dataset$Entity))
  # returns the earliest year in the dataset
  info_list$year_min <- min(dataset$Year, na.rm = TRUE)
  # returns the most recent year in the dataset
  info_list$year_max <- max(dataset$Year, na.rm = TRUE)
  return(info_list)
}

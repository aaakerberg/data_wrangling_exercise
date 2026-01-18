# ===========================================================================
# data_analysis.R
# ===========================================================================
# Project: Data Wrangling Exercise
#
# File Description:
#   This file contains the functions which conduct analyses on the processed
#   data frame.


# 1. Retrieve ID of entry with highest percentage value ---------------------
#
# Action: 
#   Retrieves the identification value of the entry with the highest
#   percentage of positively tested animals.
#
# Arguments:
#   df: data frame to be analysed
#   id_col: name of identifier column (defined in 'config.R')
#   percentage_col: name of percentage column (defined in 'config.R')

highest_percentage <- function(df, id_col, percentage_col){
  df %>%
    filter(.data[[percentage_col]] == max(.data[[percentage_col]], na.rm = TRUE)) %>%
    pull(.data[[id_col]])
}


# 2. Calculate sum of numbers tested column --------------------------------
#
# Action: 
#   Calculates the total sum of the number of animals tested.
#
# Arguments:
#   df: data frame to be analysed
#   numbers_tested_col: name of numbers tested column (defined in 'config.R')

sum_numbers_tested <- function(df, numbers_tested_col){
  df %>%
    summarise(total_sum = sum(.data[[numbers_tested_col]], na.rm = TRUE)) %>%
    pull(total_sum)
}

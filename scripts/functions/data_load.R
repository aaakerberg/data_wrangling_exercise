# ============================================================================
# data_load.R
# ============================================================================
# Project: Data Wrangling Exercise
#
# File description:
#   This file contains the function which outputs the processed data frame 
#   as an Excel file to the target output file path.
#

# 1. Generate Excel output ------------------------------------------------
#
# Action:
#   Writes excel file containing df data to file path specified in 'config.R'.
#
# Arguments:
#   df: data frame to be written as Excel file.
#   output_file_path: file path where output file will be written to.

generate_output <- function(df, output_file_path){
  # Checks that df input is a data frame.
  if (!is.data.frame(df)) abort("df is not a data frame.")
  
  # Checks that df contains data.
  if(nrow(df) == 0) abort("Error: df is empty.")
  
  # Writes data frame to excel file at specified file path.
  write_xlsx(df, path = output_file_path)
}
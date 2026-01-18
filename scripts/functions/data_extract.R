# ============================================================================
# data_extract.R
# ============================================================================
# Project: Data Wrangling Exercise
#
# File description:
#   This file contains the function which extracts the raw data from an 
#   Excel file at the specified file path. 
#


# 1. Extract data from excel file --------------------------------------------
#
# Action:
#   Extracts the data from the excel file at the file path specified in
#   'config.R'
#
# Arguments:
#   file_path: the path of the input data file.
#

extract_data <- function(input_file_path, col_types = NULL){
  # Checks that file exists in specified path.
  if(!file.exists(input_file_path)) abort("Error: File does not exist in specified file path.")
  
  # Tries to read Excel file and store as data frame.
  df <- tryCatch({
    read_excel(path = input_file_path, col_types = col_types)
    
    # Stops execution in event of failure (i.e. file exists but cannot be read as excel).
  }, error = function(e){
    abort(paste0("Error: Could not read Excel file. ", e$message))
  })
  
  # Checks that file contains data.
  if(nrow(df) == 0) abort("Error: Excel file is empty.")
  
  # Generates warning if NA values were found in data.
  if(any(is.na(df))){
    warning("Warning: NA values detected.")
  }
  
  # Returns extracted data as data frame.
  return(df)
}

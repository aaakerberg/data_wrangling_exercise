## Extract ---------------------------------------------------------------------

# Extract data from excel file.
#
# Arguments:
#   file_path: the path of the input data file.
#
extract_data <- function(file_path){
  # Stops execution if file does not exist in specified file path.
  if(!file.exists(file_path)) abort("Error: File does not exist in specified file path.")
  # Tries to read Excel file and store as data frame.
  df <- tryCatch({
    read_excel(file_path)
    # Stops execution in event of failure (i.e. file exists but cannot be read as excel); displays relevant error message.
  }, error = function(e){
    abort(paste0("Error: Could not read Excel file. ", e$message))
  })
  
  # Stops execution if file contains no data.
  if(nrow(df) == 0) abort("Error: Excel file is empty.")
  
  # Generates warning if NA values were found in data.
  if(any(is.na(df))){
    warning("Warning: NA values detected.")
  }
  
  # Returns extracted data as data frame.
  return(df)
}


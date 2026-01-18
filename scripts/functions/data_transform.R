# ============================================================================
# data_transform.R
# ============================================================================
# Project: Data Wrangling Exercise
#
# File description:
#   This file contains a collection of functions which clean and restructure 
#   the data.


# 1. Clean disease text entries ----------------------------------------------
#    
# Action: 
#   Replaces text entries in the specified column with the pre-defined 
#   text replacement.
#
# Arguments:
#   df: The data frame to be used.
#   col_name: Name of the column in which the text entries will be replaced.
#   text_replacements: Vector of text entries to be replaced.
#

clean_text <- function(df, col_name, text_replacements){
  # Checks that 'df' input is a data frame.
  if (!is.data.frame(df)) abort("df is not a data frame")
  
  # Checks that the column input exists in data frame.
  if (!col_name %in% names(df)) abort("col is not detected in data frame.")
  
  # Checks that text replacement input is an atomic vector and not empty.
  if (!is.atomic(text_replacements) || is.null(text_replacements)) abort ("text_replacements must be stored in an atomic vector.")
  df %>%
    # Unpacks text replacement input and recodes the relevant data.
    mutate(!!col_name := recode(.data[[col_name]], !!!text_replacements))
}


# 2. Filter entries by publication year --------------------------------------
# 
# Action:
#   Filters the data frame to keep entries with a publication year later than 
#   or equal to the specified year.
#
# Arguments:
#   df: The data frame to be filtered.
#   col_name: Name of the publication year column
#   publication_year: The year the publication year column is filtered by.
# 

filter_publication_year <- function(df, col_name, pub_year){
  # Checks that 'df' input is a data frame.
  if (!is.data.frame(df)) abort("df is not a data frame")
  
  # Checks that the column input exists in data frame.
  if (!col_name %in% names(df)) abort("col_name not detected in data frame.")
  
  # Checks that input column data is numeric.
  if (!is.numeric(df[[col_name]])) abort("col_name must be numeric.")
  
  # Checks that pre-defined publication year value is numeric.
  if (!is.numeric(pub_year)) abort("publication_year must be a numeric value.")
  df %>%
    # filters column data for values larger than or equal to specified value
    filter(.data[[col_name]] >= pub_year)
}


# 3. Remove columns --------------------------------------------------------
#
# Action:
#   Removes the specified columns from the data frame.
#
# Arguments:
#   df: data frames with columns to be removed.
#   col_name: names of columns to be removed (stored in an atomic vector).
#

remove_columns <- function(df, col_name){
  # Checks that 'df' input is a data frame.
  if (!is.data.frame(df)) abort("df is not a data frame")
  
  # Checks that column name input is an atomic vector.
  if (!is.atomic(col_name)) abort("col_name must be stored in an atomic vector.")
  
  # Checks that the column input exists in data frame.
  if (!all(col_name %in% names(df))) abort("col_name not detected in data frame.")
  df %>%
    # using any_of() avoids error if column does not exist
    select(-any_of(col_name))
}


# 4. Move columns to the end -------------------------------------------------
#
# Action:
#   Reorders specified columns so they are the last columns in the data frame.
#
# Arguments:
#   df: data frame with column(s) to be reordered.
#   col_name: name(s) of column(s) to be reordered (stored in an atomic vector).
#

reorder_columns <- function(df, col_name){
  # Checks that 'df' input is a data frame.
  if (!is.data.frame(df)) abort("df is not a data frame")
  
  # Checks that column name input is an atomic vector.
  if (!is.atomic(col_name)) abort("col_name must be stored in an atomic vector.")
  
  # Checks that the column input exists in data frame.
  if (!all(col_name %in% names(df))) abort("col_name not detected in data frame.")
  df %>%
    # Selects all columns but specified columns, then selects specified columns.
    select(-any_of(col_name), any_of(col_name))
}


# 5. Extract author information ----------------------------------------------
#
# Action:
#   Extracts the author names for each entry and places them in new column.
# 
# Arguments: 
#   df: data frame
#   source_col_name: name of column with author text to be extracted.
#   new_col_name: name of new column to be created.
#

extract_author <- function(df, source_col_name, new_col_name){
  # Checks that 'df' input is a data frame.
  if (!is.data.frame(df)) abort("df is not a data frame")
  
  # Checks that the source column name input exists in data frame.
  if (!source_col_name %in% names(df)) abort("source_col_name not detected in data frame.")
  
  # Checks that values in source column is text.
  if (!is.character(df[[source_col_name]])) abort("source_col_name must contain text values.")
  
  # Checks that the new column name does not exist in the data frame.
  if (new_col_name %in% names(df)) abort("new_col_name already exists in data frame.")
  df %>%
    # Create new column with extracted string value adhering to regex condition.
    mutate(!!new_col_name := str_remove(.data[[source_col_name]], ",\\s*\\d{4}[a-z]?$")) %>%
    
    # Moves new column next to source column.
    relocate(all_of(new_col_name), .after = all_of(source_col_name))
}

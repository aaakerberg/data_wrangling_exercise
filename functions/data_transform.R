library(readxl)
library(dplyr)
library(stringr)
library(rlang)


# Clean -----------------------------------------------------------------------

# Replace text entries in specified column. 
# 
# Arguments:
#   df: The data frame to be used.
#   col_name: Name of the column in which the text entries will be replaced.
#   text_replacements: Vector of text entries to be replaced.
#
# Returns:
#   New data frame where text entries in specific column are replaced.
#
clean_text <- function(df, col_name, text_replacements){
  if (!is.data.frame(df)) abort("df is not a data frame")
  if (!col_name %in% names(df)) abort("col_name is not detected in data frame.")
  if (!is.atomic(text_replacements) || is.null(text_replacements)) abort ("text_replacements must be stored in an atomic vector.")
  df %>%
    # Access column name from variable
    mutate(!!col_name := 
        # Access column data and unpack text replacement expressions
        recode(.data[[col_name]], !!!text_replacements))
}


# Filter data frame for entries with publication year later than or equal to specified year.
#
# Arguments:
#   df: The data frame to be filtered.
#   col_name: Name of the publication year column
#   publication_year: The year the publication year column is filtered by.
# 
# Returns:
#   Data frame with entries filtered by specified publication year.
#
filter_publication_year <- function(df, col_name, publication_year){
  if (!is.data.frame(df)){
    stop("`df` is not a data frame")
  }
  if (!col_name %in% names(df)){
    stop("`col_name` not detected in data frame.")
  }
  if (!is.numeric(df[[col_name]])) {
    stop("`col_name` must be numeric.")
  }
  if (!is.numeric(publication_year)){
    stop("`publication_year` must be a numeric value.")
  }
  df %>%
    # .data[[col_name]] references values in named column.
    filter(.data[[col_name]] >= publication_year)
}


# Remove specified column(s) in data frame .
#
# Arguments:
#   df: data frames with columns to be removed.
#   col_name: name(s) of column(s) to be removed (stored in an atomic vector).
#
# Returns:
#   Data frame with specified removed columns.
#
remove_columns <- function(df, col_name){
  if (!is.data.frame(df)){
    stop("`df` is not a data frame")
  }
  if (!is.atomic(col_name)){
    stop("`col_name` must be stored in an atomic vector.")
  }
  if (!col_name %in% names(df)){
    stop("`col_name` not detected in data frame.")
  }
  df %>%
    # using any_of() avoids error if column does not exist
    select(-any_of(col_name))
}


# Move specified column(s) to the last column(s) in data frame.
#
# Arguments:
#   df: data frame with column(s) to be reordered.
#   col_name: name(s) of column(s) to be reordered (stored in an atomic vector).
#
# Returns: data frame with reordered columns.
#
reorder_columns <- function(df, col_name){
  if (!is.data.frame(df)){
    stop("`df` is not a data frame")
  }
  if (!is.atomic(col_name)){
    stop("`col_name` must be stored in an atomic vector.")
  }
  if (!col_name %in% names(df)){
    stop("`col_name` not detected in data frame.")
  }
  df %>%
    select(-any_of(col_name), any_of(col_name))
}


# Extract author name from specified column and place in new column.
# 
# Arguments: 
#   df: data frame
#   source_col_name: name of column with author text to be extracted.
#   new_col_name: name of new column to be created.
#
# Returns:
#   data frame with new column containing authors text.
#
extract_author <- function(df, source_col_name, new_col_name){
  if (!is.data.frame(df)){
    stop("`df` is not a data frame")
  }
  if (!source_col_name %in% names(df)){
    stop("`source_col_name` not detected in data frame.")
  }
  if (!is.character(df[[source_col_name]])){
    stop("`source_col_name` must contain text values.")
  }
  if (new_col_name %in% names(df)){
    stop("`new_col_name` already exists in data frame.")
  }
  if (!is.character(new_col_name) || length(new_col_name) != 1 || new_col_name == "") {
    stop("`new_col_name` must be a single, non-empty string.", call. = FALSE)
  }  df %>%
    mutate(!!new_col_name := str_remove(.data[[source_col_name]], ",\\s*\\d{4}$"))
}






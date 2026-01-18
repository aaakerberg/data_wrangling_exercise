# ============================================================================
# data_validation.R
# ============================================================================
# Project: Data Wrangling Exercise
#
# File description:
#   This configuration file contains the function and rules for data validation.
#

# 1. Data validation ----------------------------------------------------
#
# Action: 
#   Validates the data in the data frame based on the specified rules. If any
#   violation is detected, execution is aborted.
#
# Arguments:
#   df: data frame containing data to be validated
#   

validate_data <- function(df){
  # Defines rules for data to be validated against.
  rules <- validator(
    nchar(as.character(IDENTIFIER)) > 0,
    !is.na(IDENTIFIER),
    YEAR_PUBLICATION >= 1920,
    YEAR_PUBLICATION <= 2026,
    !is.na(DISEASE),
    nchar(as.character(DISEASE)) > 0,
    NUMBER_POSITIVE <= NUMBER_TESTED,
    NUMBER_TESTED > 0,
    PERCENTAGE >= 0,
    PERCENTAGE <= 100)
  
  # Validates data against rules and stores report as object. 
  validation_report <- confront(df, rules)
  
  # Stores rule violations to object.
  rule_violations <- violating(df, validation_report)
  
  # Checks if there are any rule violations and aborts execution.
  if (nrow(rule_violations) > 0){
    abort("Error: Some entries do not meet the validation rules.") 
  }
  # Returns the dataframe.
  return(df)
}







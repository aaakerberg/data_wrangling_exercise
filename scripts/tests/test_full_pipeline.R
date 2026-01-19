# ============================================================================
# test_full_pipeline.R
# ============================================================================
# Project: Data Wrangling Exercise
#
# File description:
#   This file contains tests to test the whole data wrangling pipeline
#   end-to-end.
#

library(testthat)
library(readxl)
library(dplyr)
library(validate)
library(stringr)
library(rlang)
library(writexl)
library(here)

# Source all function and config scripts
source(here("scripts", "tests", "test_mock_data", "test_mock_data.R"))
source(here("scripts", "functions", "data_validation.R"))
source(here("scripts", "functions", "data_extract.R"))
source(here("scripts", "functions", "data_transform.R"))
source(here("scripts", "functions", "data_load.R"))


# Create end-to-end pipeline tests using mock data
test_that("full pipeline works end-to-end", {
  
  temp_input <- tempfile(fileext = ".xlsx")
  write_xlsx(valid_df, temp_input)
  
  df <- extract_data(temp_input) %>%
    clean_text("DISEASE", c("Peste des petits ruminants" = "PDPR")) %>%
    filter_publication_year("YEAR_PUBLICATION", 2000) %>%
    remove_columns(c("START_DATA_DATE")) %>%
    reorder_columns(c("DISEASE")) %>%
    extract_author("IDENTIFIER", "AUTHOR")
  
  expect_error(validate_data(df), NA)  # should NOT throw error
  
  temp_output <- tempfile(fileext = ".xlsx")
  generate_output(df, temp_output, "sheet")
  
  output_df <- read_excel(temp_output)
  
  # Tests that there is a newly created author column in df
  expect_true("AUTHOR" %in% names(output_df))
  
  # Tests that filtering entries for publication year works correctly
  expect_equal(nrow(output_df), 2)  # after filtering year >= 2000
  
  # Tests that removed column is not in data frame.
  expect_false("START_DATA_DATE" %in% names(output_df))
})


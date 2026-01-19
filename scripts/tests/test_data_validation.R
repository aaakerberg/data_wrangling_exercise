# ============================================================================
# test_data_validation.R
# ============================================================================
# Project: Data Wrangling Exercise
#
# File description:
#   This file contains tests to test the data validation function.
#

library(testthat)
library(validate)
library(dplyr)
library(rlang)
library(here)


# Source all function and config scripts
source(here("scripts", "tests", "test_mock_data", "test_mock_data.R"))
source(here("scripts", "functions", "data_validation.R"))

# create tests for validation rules.
test_that("validate_data returns data when all rules are met", {
  expect_equal(validate_data(valid_df), valid_df)
})

test_that("validate_data errors when IDENTIFIER is empty", {
  expect_error(validate_data(invalid_df_identifier), "Some entries do not meet the validation rules")
})

test_that("validate_data errors when YEAR_PUBLICATION is out of range", {
  expect_error(validate_data(invalid_df_year), "Some entries do not meet the validation rules")
})

test_that("validate_data errors when NUMBER_POSITIVE > NUMBER_TESTED", {
  expect_error(validate_data(invalid_df_positive), "Some entries do not meet the validation rules")
})

test_that("validate_data errors when PERCENTAGE > 100", {
  expect_error(validate_data(invalid_df_percentage), "Some entries do not meet the validation rules")
})
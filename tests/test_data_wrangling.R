library(testthat)
library(openxlsx)


source("scripts/data_extract.R")


# Test extract_data function ---------------------------------------------

test_that("extract_data function handles missing file", {
  # Check 'file does not exist'.
  expect_error(extract_data("non_existent_file.xls"), "File does not exist.")
})
test_that("extract_data handles invalid Excel files", {
  # Create a temporary text file (not Excel)
  tmp <- tempfile(fileext = ".txt")
  writeLines("not excel content", tmp)
  
  expect_error(extract_data(tmp), "Could not read Excel file")
  
  file.remove(tmp)
})

test_that("extract_data handles empty Excel files", {
  tmp <- tempfile(fileext = ".xlsx")
  write.xlsx(data.frame(), tmp)
  
  expect_error(extract_data(tmp), "Excel file is empty")
  
  file.remove(tmp)
})

test_that("extract_data warns on NA values", {
  tmp <- tempfile(fileext = ".xlsx")
  df <- data.frame(a = c(1, NA), b = 2:3)
  write.xlsx(df, tmp)
  
  expect_warning(result <- extract_data(tmp), "NA values detected")
  expect_equal(result, df)  # still returns the data frame
  
  file.remove(tmp)
})

test_that("extract_data successfully reads valid Excel files", {
  tmp <- tempfile(fileext = ".xlsx")
  df <- data.frame(a = 1:3, b = 4:6)
  write.xlsx(df, tmp)
  
  result <- extract_data(tmp)
  expect_equal(result, df)
  
  file.remove(tmp)
})

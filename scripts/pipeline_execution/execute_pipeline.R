# ===========================================================================
# execute_pipeline.R
# ===========================================================================
# Project: Data Wrangling Exercise
#
# File Description:
#   This file runs the pipeline by sourcing the function R scripts and
#   executing each function with the parameters defined in the configuration
#   file.
#

# 1. Load required packages ------------------------------------------------

library(readxl)
library(dplyr)
library(validate)
library(stringr)
library(rlang)
library(writexl)
library(here)

# 2. Source required scripts -----------------------------------------------

source(here("scripts", "config", "config.R"))
source(here("scripts", "functions", "data_validation.R"))
source(here("scripts", "functions", "data_extract.R"))
source(here("scripts", "functions", "data_transform.R"))
source(here("scripts", "functions", "data_load.R"))
source(here("scripts", "functions", "data_analysis.R"))



# 3. Execute data wrangling pipeline ----------------------------------------

df <- extract_data(INPUT_FILE_PATH, COL_TYPES) %>%
      validate_data() %>%
      clean_text(DISEASE_COL, DISEASE_REPLACEMENTS) %>%
      filter_publication_year(PUB_YEAR_COL, PUB_YEAR_MIN) %>%
      remove_columns(REMOVE_COLS) %>%
      reorder_columns(REORDER_COLS) %>%
      extract_author(ID_COL, AUTHOR_COL)
      
generate_output(df, OUTPUT_FILE_PATH)

message("Data wrangling pipeline successfully completed, starting analysis...")


# 4. Execute data analysis --------------------------------------------------

id_highest_percentage <- highest_percentage(df, ID_COL, PERCENTAGE_COL)
cat("Identifier of the entry with highest percentage of positive tests is", id_highest_percentage)

total_sum_numbers_tested <- sum_numbers_tested(df, NUMBER_TESTED_COL)
cat("The total sum of all the animals tested is", total_sum_numbers_tested)

message("Data wrangling pipeline and analysis completed!")

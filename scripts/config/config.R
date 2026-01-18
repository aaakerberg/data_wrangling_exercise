# ============================================================================
# config.R
# ============================================================================
# Project: Data Wrangling Exercise
#
# File description:
#   This configuration file defines all the parameters and file paths for
#   each data wrangling function in the pipeline.
#

# 1. File paths ---------------------------------------------------------------

INPUT_FILE_PATH <- "data/input_data/Data_Scientist_Exercise_File.xlsx"
OUTPUT_FILE_PATH <- "data/output_data/Data_Scientist_Exercise_File.xlsx"

# 2. Column types -------------------------------------------------------------

COL_TYPES <- c(IDENTIFIER = "text",
               YEAR_PUBLICATION = "numeric",
               START_DATE_DATA = "numeric",
               END_DATE_DATA = "numeric",
               STATE = "text",
               DISEASE = "text",
               NUMBER_POSITIVE = "numeric",
               NUMBER_TESTED = "numeric",
               PERCENTAGE = "numeric"
               )


# 3. Column names -------------------------------------------------------------

ID_COL <- "IDENTIFIER"
PUB_YEAR_COL <- "YEAR_PUBLICATION"
START_DATE_COL <- "START_DATE_DATA"
END_DATE_COL <- "END_DATE_DATA"
STATE_COL <- "STATE"
DISEASE_COL <- "DISEASE"
NUMBER_POSITIVE_COL <- "NUMBER_POSITIVE"
NUMBER_TESTED_COL <- "NUMBER_TESTED"
PERCENTAGE_COL <- "PERCENTAGE"
AUTHOR_COL <- "AUTHOR"

REMOVE_COLS <- c(START_DATE_COL, END_DATE_COL)
REORDER_COLS <- c(STATE_COL, DISEASE_COL)


# 4. Wrangling function parameters -------------------------------------------

DISEASE_REPLACEMENTS <- c(
  "TRYPs" = "Trypanosomosis",
  "PPR"   = "Peste des petits ruminants"
)
PUB_YEAR_MIN <- 2010






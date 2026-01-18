# ============================================================================
# test_mock_data.R
# ============================================================================
# Project: Data Wrangling Exercise
#
# File description:
#   This file contains mock data for testing.
#

valid_df <- data.frame(
  IDENTIFIER = c("Faris et al, 2012", "Ayele et al, 2012"),
  YEAR_PUBLICATION = c(2001, 2015),
  DISEASE = c("Trypanosomosis", "Peste des petits ruminants"),
  NUMBER_POSITIVE = c(10, 5),
  NUMBER_TESTED = c(20, 10),
  PERCENTAGE = c(50, 50),
  START_DATA_DATE = c(2020, 2023)
)

invalid_df_identifier <- valid_df %>% 
  mutate(IDENTIFIER = replace(IDENTIFIER, 1, ""))
invalid_df_year <- valid_df %>% 
  mutate(YEAR_PUBLICATION = replace(YEAR_PUBLICATION, 1, 1800))
invalid_df_positive <- valid_df %>% 
  mutate(NUMBER_POSITIVE = replace(NUMBER_POSITIVE, 2, 15))
invalid_df_percentage <- valid_df %>% 
  mutate(PERCENTAGE = replace(PERCENTAGE, 1, 120))


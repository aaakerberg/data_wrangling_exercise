
# DATA EXTRACT

file_path <- "data/Data_Scientist_Exercise_File.xlsx"


# DATA CLEANING

disease_text_replacements <- c(
  "TRYPs" = "Trypanosomosis",
  "PPR"   = "Peste des petits ruminants"
)

disease_col_name <- "DISEASE"



publication_year_col_name <- "YEAR_PUBLICATION"
publication_year <- 2010


cols_to_remove <- c("START_DATE_DATA", "END_DATE_DATA")



cols_to_reorder <- c("STATE", "DISEASE")
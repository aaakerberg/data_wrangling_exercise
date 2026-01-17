

df <- extract_data(file_path)


clean_text_df <- clean_text(df, disease_col_name, disease_text_replacements)


filtered_pub_year_df <- filter_pub_year(clean_text_df, year_pub_col_name, year_defined_value)


removed_columns_df <- remove_columns(filtered_pub_year_df, cols_to_remove)


reordered_columns_df <- reorder_cols(removed_columns_df, cols_to_shift)

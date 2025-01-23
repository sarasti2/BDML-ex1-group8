# Include here your code for your first chosen imputation method


# calculating the most commun value of y_salary_m. 
mode_edu <- as.numeric(names(sort(table(db$y_salary_m), decreasing = TRUE)[1]))

# Imputing the missing value. 
db <- db  %>%
  mutate(maxEducLevel = ifelse(is.na(y_salary_m) == TRUE, mode_edu , maxEducLevel))

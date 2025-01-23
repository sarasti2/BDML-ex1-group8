# Include here your code for your first chosen imputation method


# calculating the most commun value of maxEducLevel. 
mode_edu <- as.numeric(names(sort(table(db$maxEducLevel), decreasing = TRUE)[1]))

# Imputing the missing value. 
db <- db  %>%
  mutate(maxEducLevel = ifelse(is.na(maxEducLevel) == TRUE, mode_edu , maxEducLevel))

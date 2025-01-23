# Include your code here for you second imputation method

# transform categorical to factor
db$maxEducLevel<- factor(db$maxEducLevel)
dummy_maxEducLevel <- as.data.frame(model.matrix(~ maxEducLevel - 1, data = db)) 
db <- cbind(db, dummy_maxEducLevel)

# Linear regression
linear_imput_model <- lm(y_salary_m ~ ingtot + sex   + maxEducLevel3 + maxEducLevel4 + maxEducLevel5 + maxEducLevel6 + maxEducLevel7 , data = db)

# Prediction using the linear regression
db$predicted_y <- predict(linear_imput_model, newdata = db)

# Input linear regression predictions in NA values
db<-  db %>%  mutate(y_salary_m = ifelse(is.na(y_salary_m) == TRUE, predicted_y , y_salary_m))

# Look some rows to understand the input
db %>% select(y_salary_m, predicted_y, y_salary_m  ) %>% head()

# Remove transitional variables
db<-  db %>% select(- maxEducLevel1, - maxEducLevel2, - maxEducLevel3, - maxEducLevel4, - maxEducLevel5, - maxEducLevel6, - maxEducLevel7,-predicted_y )

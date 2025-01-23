# Imputing the missing values with the median
db <- db  %>%
  mutate(ingtot = ifelse(is.na(ingtot) == TRUE, median(db$ingtot, na.rm = TRUE) , ingtot))
# replace values:
db %>% select(directorio,y_total_m) %>% tail()
#Replace the missing values with mean 
db = db %>% 
     group_by(directorio) %>% 
     mutate(mean_y_total_m = mean(y_total_m,na.rm=T))
db %>% select(directorio,y_total_m,mean_y_total_m) %>% tail()

db = db %>%
     mutate(y_total_m = ifelse(test = is.na(y_total_m)==T,
                               yes = mean_y_total_m,
                               no = y_total_m))

db %>% select(directorio,y_total_m,mean_y_total_m) %>% tail()

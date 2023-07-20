#Import clean data
library(readr)
anti_trans_bills_clean <- read_csv("anti-trans-bills-clean.csv")
View(anti_trans_bills_clean)

#filter by year
anti_trans_bills_by_year <- anti_trans_bills_clean %>% group_by(year) %>% summarise(n = n())

# a little bit of cleaning
anti_trans_bills_by_year <- na.omit(anti_trans_bills_by_year)
anti_trans_bills_by_year <- anti_trans_bills_by_year %>% filter(year != 1905) #Need to omit this observation
anti_trans_bills_by_year <- anti_trans_bills_by_year %>% filter(year != 2017) #There is only one bill here, and it is causing distortion in the graphs

#line graph
total_bills_by_year <- anti_trans_bills_by_year %>% ggplot(aes(x = year, y = n)) + geom_line()

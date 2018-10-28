library(tidyverse)
library(lubridate)
library(skimr)

energyData <- read_csv("input/PUB_PriceHOEPPredispOR.csv")


colnames(energyData) <- colnames(energyData) %>% str_replace(pattern = " ", replacement = "_")


energyData %>% tail()

energyData %>% 
  mutate(Date=mdy(Date), Month=months(Date), Total_Cost=HOEP*Ontario_Demand, MonthIndex=match(Month, month.name)) %>%
  group_by(Month, MonthIndex) %>%
  summarise(Monthly_Total_Cost=sum(Total_Cost)) %>%
  arrange(MonthIndex) %>% 
  select(-MonthIndex) %>% 
  kable()

trips_df <- read_csv('input/retail promo data.csv')


trips_df

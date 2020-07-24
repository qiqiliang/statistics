# This is the tidying of the opioid and suicide data

library(tidyverse)

# original website
# https://www.cdc.gov/drugoverdose/maps/rxrate-maps.html

opioid_p_rate <- read.csv('https://raw.githubusercontent.com/qiqiliang/statistics/master/US_County_Prescribing_Rates_Opioids.csv')

# original website
# https://wisqars.cdc.gov:8443/cdcMapFramework/mapModuleInterface.jsp

suicides <- read.csv('https://wisqars.cdc.gov:8443/cdcMapFramework/ExcelServlet?excelFile=m4687721_csv')

# original website
# https://data.hrsa.gov/

poverty_rate <- read.csv('https://raw.githubusercontent.com/qiqiliang/statistics/master/poverty_level.csv')

suicides <- suicides %>%
  slice(22:3159) %>%
  select(- X_) %>%
  select(-StateFIPS, -CountyFIPS) %>%
  rename(avg_suicide_rate = U_C_Rate) %>%
  rename(State = ST) 

opioid_avg_rate <- opioid_p_rate %>%
  group_by(County, State) %>%
  summarise(avg_prescr_rate = mean(Prescribing.Rate)) 

opioid_and_suicide_rate <- left_join(suicides, opioid_avg_rate) 
  
opioid_poverty_suicide_rate <- left_join(opioid_and_suicide_rate, poverty_rate) 


# write.csv(opioid_and_suicide_rate, "US_Suicide_and_Opioid_Prescription_Rates")

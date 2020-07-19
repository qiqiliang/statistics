# This is the tidying of the opioid and suicide data

library(tidyverse)

# original website
# https://www.cdc.gov/drugoverdose/maps/rxrate-maps.html

opioid_p_rate <- read.csv('https://raw.githubusercontent.com/qiqiliang/statistics/master/US_County_Prescribing_Rates_Opioids.csv')

# original website
# https://wisqars.cdc.gov:8443/cdcMapFramework/mapModuleInterface.jsp

suicides <- read.csv('https://wisqars.cdc.gov:8443/cdcMapFramework/ExcelServlet?excelFile=m4687721_csv')

suicides <- suicides %>%
  slice(22:3159) %>%
  select(- X_) 

opioid_avg_rate <- opioid_p_rate %>%
  group_by(County, State) %>%
  summarise(avg_prescr_rate = mean(Prescribing.Rate)) %>%
  rename(ST = State) 

opioid_and_suicide_rate <- left_join(suicides, opioid_avg_rate) %>%
  select(-StateFIPS, -CountyFIPS) %>%
  rename(avg_suicide_rate = U_C_Rate)

write.csv(opioid_and_suicide_rate, "US_Suicide_and_Opioid_Prescription_Rates")

# This is the tidying of the opioid and suicide data

library(tidyverse)

# original website
# https://www.cdc.gov/drugoverdose/maps/rxrate-maps.html

opioid_p_rate <- read.csv('https://raw.githubusercontent.com/qiqiliang/statistics/master/US_County_Prescribing_Rates_Opioids.csv')

# original website
# https://wisqars.cdc.gov:8443/cdcMapFramework/mapModuleInterface.jsp

suicides <- read.csv('https://wisqars.cdc.gov:8443/cdcMapFramework/ExcelServlet?excelFile=m4687721_csv')%>%
  slice(22:3159)%>%
  select(- X_, -Deaths, -Population, -StateFIPS, -CountyFIPS) %>%
  rename(Avg_Suicide_Rate = U_C_Rate) %>%
  rename(State = ST)


# original website
# https://data.hrsa.gov/

poverty_rate <- read.csv('https://raw.githubusercontent.com/qiqiliang/statistics/master/perc_poverty_dataset.csv')

suicides <- suicides  %>%
  mutate_at('Avg_Suicide_Rate',as.numeric)

opioid_avg_rate <- opioid_p_rate %>%
  group_by(County, State) %>%
  summarise(Avg_Prescr_Rate = mean(Prescribing.Rate)) 

opioid_and_suicide_rate <- left_join(suicides, opioid_avg_rate) 
  
opioid_poverty_suicide_rate <- left_join(opioid_and_suicide_rate, poverty_rate) %>%
  filter(Avg_Suicide_Rate != "") %>%
  na.omit()

write.csv(opioid_poverty_suicide_rate, "US_Suicide_Poverty_Opioid_Prescription_Rates")


####################################################

# https://www.ers.usda.gov/data-products/atlas-of-rural-and-small-town-america/download-the-data/






























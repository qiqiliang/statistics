# This is the tidying of the opioid and suicide data

library(tidyverse)

opioid_p_rate <- read.csv('https://raw.githubusercontent.com/qiqiliang/statistics/master/US_County_Prescribing_Rates_Opioids.csv')

suicides <- read.csv('https://wisqars.cdc.gov:8443/cdcMapFramework/ExcelServlet?excelFile=m4687721_csv')

suicides <- suicides %>%
  slice(22:3159) %>%
  select(- X_)

opioid_avg_rate <- opioid_p_rate %>%
  group_by(County, State) %>%
  summarise(
            avg_prescr_rate = mean(Prescribing.Rate))

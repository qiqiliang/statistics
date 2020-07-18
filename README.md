# statistics

This is Kaitlyn figuring out git from my local computer

 This is a second line from my local computer
 
adding a line

This line from RStudio - K


```{r}
# Get the Data

#Data is about passwords in general

passwords <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-14/passwords.csv')

# Or read in with tidytuesdayR package (https://github.com/thebioengineer/tidytuesdayR)
# PLEASE NOTE TO USE 2020 DATA YOU NEED TO UPDATE tidytuesdayR from GitHub

# Either ISO-8601 date or year/week works!

# Install via devtools::install_github("thebioengineer/tidytuesdayR")

tuesdata <- tidytuesdayR::tt_load('2020-01-14') 
tuesdata <- tidytuesdayR::tt_load(2020, week = 3)]

#Potential Research Questions
#Does category of password affect the time it takes to crack password (online or offline)
#Most popular letters used in passwords


```

```{r}

#Data gives us percentages of fatal collisions of drivers doing some illegal activity (drinking, etc.)

bad_drivers <- readr::read_csv('https://raw.githubusercontent.com/fivethirtyeight/data/master/bad-drivers/bad-drivers.csv')

#Potential Research Questions: 
#States with the most bad drives...this was actually a question in 538 but we can do our own statistics/graphs about it..not sure though seems like an interesting question.
#Common causes of fatal colllisions in each state

```


```{r}
#Think this one is my favorite dataset with potential for good/applicable research questions 
hate_crimes <- readr::read_csv('https://raw.githubusercontent.com/fivethirtyeight/data/master/hate-crimes/hate_crimes.csv')

#Potential Research Questions
#Association between household income and percentage of hate crimes
#What can the GINI Index tell us about hate crimes in an area?
#Does having a high school degree affect average median household income?


```

########### T1.1 
# I downloaded the dataset form the moodle using the link provided

########### T2.1
# Inspected the csv file with a text editor and removed the caption 
#“Data on the daily number of new reported COVID-19 cases and deaths by EU/EEA country”
# and saved the file for further analysis.

########### T2.2
?read.delim


installed.packages("pacman")

require(pacman)
pacman::p_load(pacman,dplyr,GGally,ggplot2,ggthemes,ggvis,httr,
               lubridate,plotly,rio,rmarkdown,shiny,stringr,tidyr)
library(datasets)
rio_csv <- import("C:/Vamsi/Github/R-Basics/Mock/mock_project_data.csv")
head(rio_csv)

data <- read.delim(file = "C:/Vamsi/Github/R-Basics/Mock/mock_project_data.csv",
                   header=TRUE,sep = ',',dec='.')

head(data)
print(data)

########## T3.1
# The data is not tidy it has missing values,numeric variable name &
# duplicate columns with same information

#dropping and renaming the  columns properly using dplyr
library(dplyr)
library(datasets)
install.packages("tidyr")
library(tidyr)


wide_data <- data %>%
  pivot_wider(names_from = type, 
              values_from = counts)

# Print reshaped data back to wide format
print("Wide Format Data:")
print(wide_data)

library(dplyr)

# Drop the "Age" and "Score" columns
data_drop <- wide_data %>% 
  select(-day, -month, -year,-countryterritoryCode,-continentExp, -geoId) %>%
  rename(Country = countriesAndTerritories, Date = dateRep,
         Population = popData2020, Cases = cases, Deaths = deaths)

head(data_drop)
summary(data_drop)

############# T3.2


data_drop$Date <- as.Date(data_drop$Date, format = "%d/%m/%Y")


############ T3.3
# Check structure with glimpse
glimpse(data_drop)


########### T3.4

nrow(data) #57458
nrow(wide_data) #57458
nrow(data_drop) #28729

########## T3.5

#check for missing values
sum(is.na(data_drop))
anyNA(data_drop)
summary(data_drop)

# to show missing pattern
library(mice)
md.pattern(data_drop)

# to plot the missing values with %
install.packages('naniar')
library(naniar)
vis_miss(data_drop)

########## T3.6

# removing rows with any missing values as their size is insignificant 
data_clean <- na.omit(data_drop)
data_clean

#check for missing values in clean data
sum(is.na(data_clean))
anyNA(data_clean)
summary(data_clean)
vis_miss(data_clean)

########## T3.7

# Check the column names in the dataframe
colnames(data_clean)

is.numeric(data_clean$Cases)
is.numeric(data_clean$Deaths)
# Identify rows with negative values in 'Cases' or 'Deaths'
data_clean[apply(data_clean[c("Population","Cases","Deaths")] < 0, 1, any), ]

# Remove rows with negative values in 'Cases' or 'Deaths'
?filter
#cleaned_data <- data_clean[data_clean]

cleaned_data <- data_clean %>% filter(data_clean$Cases>=0 & data_clean$Deaths>=0)

head(cleaned_data)

cleaned_data[apply(cleaned_data[c("Cases","Deaths")] < 0, 1, any), ]

library(ggplot2)
# Basic plot with one layer: line plot of Cases over Date
ggplot(cleaned_data, aes(x = Date, y = Cases)) +
  geom_line(color = "blue") +
  labs(title = "COVID-19 Cases Over Time", x = "Date", y = "Number of Cases")

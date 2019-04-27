library(readxl)
library(tidyr)

file.name <-  "State_and_Territory_Forecast_Tables_2017.xlsm"

# This function reads in data and stores it in a dataframe.
read.data <- function(filename) {
  # Parameters: 
  # filename : filename of the file to be read.
  # Return : returns the datafile.
  
  data <- read_xlsx(filename, sheet = "Total states summary", skip=5) #%>%
    #pull("28") %>%
    #ts(start = c(1982,4), frequency = 12)
  data
}

tourism_data <- read.data(file.name)

# Clean the data.
temp <- na.omit(tourism_data) # not working.
tourism_data %>% drop_na()

# Let's remove manually 
temp <- tourism_data[-c(1:5), ]
tourism_data <- tourism_data[-c(1:5), ] 
#rm(temp)

# Let's select rows only important.
colnames(tourism_data)
temp <- tourism_data[, c("X__1") ]
temp <- tourism_data[, c("X__1", "Holiday", "VFR a", "Business",
                         "Other c", "Vic", "Total b") ]
tourism_data <- tourism_data[, c("X__1", "Holiday", "VFR a", "Business",
                                 "Other c", "Vic", "Total b") ]
tourism_data <- tourism_data[c(1:22), ]

# Let's rename the columns.
colnames(tourism_data) <- c("year","holiday", "visiting.friends.relatives", "business",
                            "others","victoria","total")

# Change column datatypes.
colnames(tourism_data)

tourism_data$holiday = as.numeric(as.character(tourism_data$holiday))
tourism_data$visiting.friends.relatives = as.numeric(as.character(
  tourism_data$visiting.friends.relatives))
tourism_data$business = as.numeric(as.character(tourism_data$business))
tourism_data$others = as.numeric(as.character(tourism_data$others))
tourism_data$victoria = as.numeric(as.character(tourism_data$victoria))
tourism_data$total = as.numeric(as.character(tourism_data$total))

# Let's build a basic time series model.









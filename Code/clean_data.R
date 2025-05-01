# Load packages
library(readr)
library(here)
library(dplyr)

# Load the dataset
here::i_am("Code/clean_data.R")
data_hd <- read_csv(here::here("Data","heart_disease.csv"))

# Clean the dataset
data_hd_cleaned <- na.omit(data_hd)

write.csv(
  data_hd_cleaned,
  here::here("Data","data_hd_cleaned.csv"),
  row.names = FALSE
)


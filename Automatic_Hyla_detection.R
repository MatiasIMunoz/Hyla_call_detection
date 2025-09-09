## R project for the automatic detection of Hyla sp. calls in R.
## Script will be used to analyze the data from the field season 2025.

# Install packages if necessary. ----
install.packages("seewave")
install.packages("tuneR")
install.packages("scales")
install.packages("shiny")
install.packages("knitr")

# Load libraries. ----
library("seewave")
library("tuneR")
library("scales")

# Colorblind friendly colors. ----
blue_col <- "#004488"
red_col <- "#BB5566"
yellow_col <- "#DDAA33"

# Folder with .wav files. ----
wav_folder <- "/audio_files/"

# Check .wav files in folder. ----
list.files(path = paste0(getwd(), wav_folder), pattern = "\\.wav$") #Check the presence of  WAVs in the working directory.

# Load the "Hyla_test.wav" file. ----
wav <- readWave(paste0(getwd(), wav_folder)) #requires package 'tuneR'.
wav


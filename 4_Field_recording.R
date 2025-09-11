

#
# Script for analyzing field recording "1G2G3BR4BR-B1-20190621.wav" ----
#

## 0) Load libraries ----
library(seewave) # For audio analyses.
library(tuneR) # For loading audios.
library(scales) # For the alpha() function to make colors transparent.
library(shiny) # For interactive documents.
library(knitr) # For nice looking tables.


## 1) Load the "1G2G3BR4BR-B1-20190621.WAV" file. ----
wav_folder <- "/audio_files/"
wav_field <- readWave(paste0(getwd(), wav_folder, "1G2G3BR4BR-B1-20190621.wav"))
wav_field

## 2) Create an oscillogram ----
oscillo(wav_field, fastdisp = TRUE)

## 3) Filter out unwanted frequency bands ----
f <- 44100
filter <- squarefilter(f = f, from = 2000, to = 4000) 

# You can plot the the filter
plot(filter, type = "l")

# Filter wav and save it as "wav_field_sqfilt"
wav_field_sqfilt <- fir(wav_field,
                        f = f,
                        wl = 1024,
                        custom = filter,
                        output = "Wave")

#Compare filtered and un-filtered wavs
par(mfrow = c(1,2))
oscillo(wav_field, fastdisp = TRUE, title = "Un-filtered wav")
oscillo(wav_field_sqfilt, fastdisp = TRUE, title = "Filtered wav")


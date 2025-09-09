## R project for the automatic detection of Hyla sp. calls in R.
## Script will be used to analyze the data from the field season 2025.

# Install packages if necessary. ----
#install.packages("seewave")
#install.packages("tuneR")
#install.packages("scales")
#install.packages("shiny")
#install.packages("knitr")

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
wav <- readWave(paste0(getwd(), wav_folder, "Hyla_test.wav")) #requires package 'tuneR'.
wav

# Oscillogram of audio file ----
oscillo(wav)


# Compute envelope of oscillogram ----
par(mfrow = c(1, 2), mar = c(4.1, 4.1, 1, 1))

# Zoomed-out
oscillo(wav, 
        colwave = alpha("black", 0.3))
par(new = TRUE)
env(wav, 
    envt = "abs",
    colwave = red_col)

#Zoomed-in
oscillo(wav, 
        colwave = alpha("black", 0.3),
        from = 0.61, 
        to = 0.66) # zoom in the oscillogram to [0.61, 0.66] seconds

par(new = TRUE)
env(wav, 
    envt = "abs",
    colwave = red_col,
    from = 0.61,
    to = 0.66)

# Change the parameters (wl and ovlp) used to compute the envelope. ----
wl <- 256  # windows length, in samples
ovlp <- 99 # overlap between windows, in percent

par(mfrow = c(1, 2), mar = c(4.1, 4.1, 1, 1))
oscillo(wav,
        colwave = alpha("black", 0.3))

par(new = TRUE)
env(wav, 
    envt = "abs", 
    colwave = red_col,
    msmooth = c(wl, ovlp))

#Zoom in
oscillo(wav,
        colwave = alpha("black", 0.3),
        from = 0.61,
        to = 0.66)
par(new = TRUE)
env(wav,
    envt = "abs",
    colwave = red_col,
    msmooth = c(wl, ovlp),
    from = 0.61, 
    to = 0.66) # 256 samples window length


# Compare 43, 256, 512 samples for window's lenght (wl) ----
dev.off()
oscillo(wav,
        colwave = alpha("black", 0.3),
        from = 0.61,
        to = 0.66)
legend("bottomright", legend = c("43 samples", "256 samples","512 samples"),
       col = c(blue_col, red_col, yellow_col), lty = 1, cex = 0.8, lwd = 2)

par(new = TRUE)
env(wav,
    envt = "abs",
    colwave = red_col, 
    msmooth = c(wl, ovlp),
    from = 0.61,
    to = 0.66) # 256 samples window length

par(new = TRUE)
env(wav,
    envt = "abs",
    colwave = blue_col, 
    msmooth = c(wl/6, ovlp),
    from = 0.61, 
    to = 0.66) # 43 samples window length

par(new = TRUE)
env(wav, 
    envt = "abs",
    colwave = yellow_col,
    msmooth = c(wl*2, ovlp),
    from = 0.61,
    to = 0.66) # 512 samples window 


# Compare 43 vs 728 samples (wl) ----
oscillo(wav, 
        colwave = alpha("black", 0.3))
legend("bottomright", legend = c("43 samples", "728 samples"),
       col = c(blue_col, "darkorange"), lty = 1, cex = 0.8, lwd = 2)

par(new = TRUE)
env(wav, 
    envt = "abs", 
    colwave = blue_col,
    msmooth = c(wl/6, ovlp)) # 43 samples window length

par(new = TRUE)
env(wav,
    envt = "abs", 
    colwave = "darkorange",
    msmooth = c(wl*3, ovlp)) # 768 samples window length



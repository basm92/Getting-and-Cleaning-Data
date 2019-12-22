## Course Project

This is a readme file for my course project for 'Getting and Cleaning Data' on Coursera. This repository contains all unzipped files in the appropriate folders, and the scripts necessary to do the analysis and extract the tidy data file. 

### Downloading the data and executing the script

First, we will download the necessary data on your local pc. 

Run the following chunk of code:

```{r}
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "data.zip")
``` 

And unzip the appropriate file. Then, set your working directory to:

```{r}
setwd("./UCI HAR Dataset")
```

Download the `run_analysis.R` file and paste it into the working directory folder. 
Load and execute the script by the following chunk of code: 

```{r}
source("run_analysis.R")
``` 


### Downloading the tidy data set

Use data <- read.table("data_set_with_the_averages.txt") to read the data. It is 180x68 because there are 30 subjects and 6 activities, thus "for each activity and each subject" means 30 * 6 = 180 rows. Note that the provided R script has no assumptions on numbers of records, only on locations of files.

### Codebook
For a detailed description and explanation of the code, see the file CodeBook.md.

Thank you for reading my project

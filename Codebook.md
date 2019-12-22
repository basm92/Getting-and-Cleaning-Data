# Codebook

Welcome to this CodeBook for the Project for the Course 'Getting and Cleaning Data' on Coursera. 

The original data for this project can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

and the original description here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

I wrote the script to combine the train and test data regarding human activity recognition. I combine a data sheet starting with `x` containing the observations, `s` containing the subjects, and `y` containing the activities. I merge all training and testing parts of the dataset.


```{r}
source("run_analysis.R")
```

## Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
Attribute Information

For each record in the dataset it is provided:

    Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
    Triaxial Angular velocity from the gyroscope.
    A 561-feature vector with time and frequency domain variables.
    Its activity label.
    An identifier of the subject who carried out the experiment.

## Section 1

In section 1, I merge the training and test sets to create one data set, namely `xtrain` and `xtest`, which contain the raw data. `strain` and `stest` contain data about the subject numbers, and `ytrain` and `ytest` about the activities they are performing. The activities are labeled as numbers, but contains no specific information about the names. Those will be extracted in section 3. 

## Section 2

In section 2, I filter and select the required variables from the dataset. The variable names (labels) pertaining to `xtrain` and `xtest` are stored in a separate file, `features.txt`. I extract only the variable names with "mean" and "std", as those are the ones that are required, and rewrite the dataset containing only those data. 

## Section 3

In section 3, I extract the names for the activities and replace the numbers by the actual names of the activities, convert them into lower-case characters. 

## Section 4

In section 4, I appropriately label all the variables as well, and merge the dataset into one set named `alltogether`. 


## Section 5

In section 5, the script creates a tidy dataset with the average of each measurement for each activity and each subject, by executing a double for loop: for each activity-subject combination, I filter the dataset to the corresponding observations, and then extract the column means in a new matrix, to which I also added the no. of the subject and name of the activity. Finally, I labeled the columns appropriately. 




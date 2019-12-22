# Codebook

Welcome to this CodeBook for the Project for the Course 'Getting and Cleaning Data' on Coursera. 

The original data for this project can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

and the original description here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

I wrote the script to combine the train and test data regarding human activity recognition. I combine a data sheet starting with `x` containing the observations, `s` containing the subjects, and `y` containing the activities. I merge all training and testing parts of the dataset.


```{r}
source("run_analysis.R")
```
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




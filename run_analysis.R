#Hello
#For those of you who have not read the Readme.md file, a quick setup: 
#I ran the following 5 chunks only once

#Download the file
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "data.zip")
#Unzip the file in the default directory
#setwd("./UCI HAR Dataset")

#1. Merges the training and the test sets to create one data set.

xtrain <- read.table("train/X_train.txt")
xtest <- read.table("test/X_test.txt")
xall <- rbind(xtrain, xtest)

strain <- read.table("train/subject_train.txt")
stest <- read.table("test/subject_test.txt")
sall <- rbind(strain, stest)

ytrain <- read.table("train/y_train.txt")
ytest <- read.table("test/y_test.txt")
yall <- rbind(ytrain,ytest)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")
mean_std <- grep("-mean\\(\\)|-std\\(\\)", features[, 2]) #Extract only the variables that contain mean and std
xall <- xall[, mean_std] #Use only the relevant variables

#3. Uses descriptive activity names to name the activities in the data set.
activities <- read.table("activity_labels.txt")

activities[,2] <- as.character(activities[,2])
activities[,2] = gsub("_","", tolower(activities[, 2])) #Remove underscore, convert to lower case

yall[,1] <- activities[yall[,1], 2] #replacing the characters in y all with the words from the activities set

# 4. Appropriately labels the data set with descriptive activity names.
names(xall) <- features[mean_std, 2] #Take the appropriate rows and columns from the dataset
names(xall) <- gsub("\\(|\\)","", names(xall)) #Remove all the parentheses
names(xall) <- tolower(names(xall)) #Put everything in lower case characters
names(yall) <- "activity"
names(sall) <- "subject" 

alltogether <- cbind(sall, yall, xall)

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

#Create empty matrix
b = as.data.frame(matrix(nrow = (30*6)))

#Set the parameters
subjects1 = 1:30 # 30
hmcol = dim(alltogether)[2]
b = as.data.frame(matrix(nrow = (30*6)))


#loop to isolate
line <- 1
for (s in 1:30) {
  for (a in 1:6) {
    b[line, 1] = subjects1[s]
    b[line, 2] = activities[a, 2]
    datafilter <- alltogether[alltogether$subject==s & alltogether$activity==activities[a, 2], ]
    b[line, 3:hmcol] <- colMeans(datafilter[, 3:hmcol])
    line = line+1
  }
}

#Column names and write
colnames(b) <- c(colnames(alltogether[c(1:68)]))
write.table(b, "data_set_averages.txt", row.name=FALSE)

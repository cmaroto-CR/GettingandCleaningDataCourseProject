##

# Load libraries to be used
library(plyr)

## 1. Merges the training and the test sets to create one data set.

# Set folder to data location
setwd("C:/Dev/training/Coursera/GettingandCleaningDataCourseProject/data")

# Create folder for tidy data, if it doesn't exist
if (!file.exists("tidy")) {
    dir.create("tidy")
}

# Load list of all features
features <- read.table(file = "UCI HAR Dataset/features.txt", stringsAsFactors = TRUE)[, 2]

# Load table of all activity labels
activity_labels <- read.table(file = "UCI HAR Dataset/activity_labels.txt", stringsAsFactors = TRUE)
# Set variable names for the activities in the dataframe
colnames(activity_labels) <- c("id", "activity")

# Create a list of all train files
filelist <- dir(recursive = TRUE)
filelist <- dir(recursive = TRUE, pattern = "*train*")
trainfiles <- filelist[grep("train", filelist, ignore.case = TRUE)]
#trainfiles <- dir(path = "./UCI HAR Dataset", recursive = TRUE)

# For each train file, locate its corresponding test file and merge them
for (fname in trainfiles) {
    # Get test file name from train
    testfile <- gsub("train", "test", fname)
    
    if (file.exists(testfile)) {
        # Read test file
        traindata <- read.table(file = testfile, colClasses = rep("numeric", 561), stringsAsFactors = FALSE)
        
        # Set the names of the variables in the dataframe
        colnames(traindata) <- features
    }
}



st <- read.table(file = "UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = TRUE)
colnames(st) <- "subject"

yt <- read.table(file = "UCI HAR Dataset/train/y_train.txt", stringsAsFactors = TRUE)
colnames(yt) <- "activity_id"

xt <- read.table(file = "UCI HAR Dataset/train/x_train.txt", colClasses = rep("numeric", 561), stringsAsFactors = FALSE)
colnames(xt) <- read.table(file = "UCI HAR Dataset/features.txt", stringsAsFactors = TRUE)[, 2]

train <- cbind(st, yt, xt)
train$activity_id <- mapvalues(train$activity_id, activity_labels$id, as.character(activity_labels$activity))
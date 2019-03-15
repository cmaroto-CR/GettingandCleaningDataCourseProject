## Carlos Maroto
## Purpose:  To demonstrate your ability to collect, work with, and clean a data set.
## March 2019

# Load libraries to be used
library(plyr)
library(readr)

# Create folder for data, if it doesn't exist
if (!file.exists("data")) {
    dir.create("data")
}

# Set working directory to data folder
setwd("./data")
working_dir <- getwd()
tidy_dir <- paste(working_dir, "/tidydata", sep = "")

# Create folder for tidydata, if it doesn't exist
if (!file.exists(tidy_dir)) {
    dir.create(tidy_dir)
}

# Check if source data has been downloaded, else get it
# For some unknown reason to me, !file.exists didn't work with the file as it did for folders
# so comparing output to TRUE instead
if (file.exists("UCI_HAR_Dataset.zip") == TRUE) {
    # Get data and unzip it
    message("Source data file not found, begining download...")
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "UCI_HAR_Dataset.zip")
    message("Source data file downloaded, begining unzip...")
    unzip("UCI_HAR_Dataset.zip")
    message("Source data file unzipped.")
}

# Load list of all features
features <- read.table(file = "UCI HAR Dataset/features.txt", stringsAsFactors = TRUE)[, 2]

# Load table of all activity labels
activity_labels <- read.table(file = "UCI HAR Dataset/activity_labels.txt", stringsAsFactors = TRUE)
# Set variable names for the activities in the dataframe
colnames(activity_labels) <- c("id", "activity")

# Loads all subject train data
subject_train <- read.table(file = "UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = TRUE)
colnames(subject_train) <- "subject" # Give a meaningful name to the variable

# Loads all activity train data
y_train <- read.table(file = "UCI HAR Dataset/train/y_train.txt", stringsAsFactors = TRUE)
colnames(y_train) <- "activity_id" # Give a meaningful name to the variable

# Loads all train measurements data
x_train <- read.table(file = "UCI HAR Dataset/train/X_train.txt", colClasses = rep("numeric", 561), stringsAsFactors = FALSE)
# Give meaningful names to the variables from the features file
colnames(x_train) <- features

# Merges subject, with activity and measurement observations but only those that correspond to "mean()" or "std()" (standard deviation)
train <- cbind(subject_train, y_train, x_train[, grepl("mean\\(\\)", names(x_train)) | grepl("std\\(\\)", names(x_train))])

# Set meaningful labels to each activity value
train$activity_id <- mapvalues(train$activity_id, activity_labels$id, as.character(activity_labels$activity))

# Loads all subject test data
subject_test <- read.table(file = "UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = TRUE)
colnames(subject_test) <- "subject" # Give a meaningful name to the variable

# Loads all activity test data
y_test <- read.table(file = "UCI HAR Dataset/test/y_test.txt", stringsAsFactors = TRUE)
colnames(y_test) <- "activity_id" # Give a meaningful name to the variable

# Loads all test measurements data
x_test <- read.table(file = "UCI HAR Dataset/test/X_test.txt", colClasses = rep("numeric", 561), stringsAsFactors = FALSE)
# Give meaningful names to the variables from the features file
colnames(x_test) <- read.table(file = "UCI HAR Dataset/features.txt", stringsAsFactors = TRUE)[, 2]

# Merges subject, with activity and measurement observations but only those that correspond to "mean()" or "std()" (standard deviation)
test <- cbind(subject_test, y_test, x_test[, grepl("mean\\(\\)", names(x_test)) | grepl("std\\(\\)", names(x_test))])

# Set meaningful labels to each activity value
test$activity_id <- mapvalues(test$activity_id, activity_labels$id, as.character(activity_labels$activity))

# Merges the training and the test sets to create one data set.
merged_data <- rbind(train, test)
# Write to tidydata folder
write_csv(merged_data, paste(tidy_dir, "/merged_data.csv", sep = ""))

# Groups data by subject and activity, calculating the average (mean) of each mean() or std() column
avg_merged_data <- merged_data %>% group_by(subject, activity_id) %>% summarise_at(vars(contains("mean"), contains("std")), mean, na.rm=TRUE)
# Write to tidydata folder
write_csv(avg_merged_data, paste(tidy_dir, "/avg_merged_data.csv", sep = ""))
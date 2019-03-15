CodeBook
================

Source Data
----------------

The source data is downloaded as a compressed file, then stored as ./data/UCI_HAR_Dataset.zip

Once uncompressed, a folder structure with the input data is available at ./data/UCI HAR Dataset/

Output Data
--------------

Two files are produced by the script:

* ./data/tidydata/merged_data.csv: Contains all observations for for every subject and activity combination

* ./data/tidydata/avg_merged_data.csv: Summarizes all observations by calculating the average for each variable grouped by subject and activity (6 activities per each of the 30 subjects)

Each of the files contains the following variables (columns):

* "subject": Numeric id of each subject in the test, value in the 1-30 range

* "activity_id": Label for the activity (not its numeric id). One of: LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS

* "tBodyAcc-mean()-X"

* "tBodyAcc-mean()-Y"

* "tBodyAcc-mean()-Z"

* "tBodyAcc-std()-X"

* "tBodyAcc-std()-Y"

* "tBodyAcc-std()-Z"

* "tGravityAcc-mean()-X"

* "tGravityAcc-mean()-Y"

* "tGravityAcc-mean()-Z"

* "tGravityAcc-std()-X"

* "tGravityAcc-std()-Y"

* "tGravityAcc-std()-Z"

* "tBodyAccJerk-mean()-X"

* "tBodyAccJerk-mean()-Y"

* "tBodyAccJerk-mean()-Z"

* "tBodyAccJerk-std()-X"

* "tBodyAccJerk-std()-Y"

* "tBodyAccJerk-std()-Z"

* "tBodyGyro-mean()-X"

* "tBodyGyro-mean()-Y"

* "tBodyGyro-mean()-Z"

* "tBodyGyro-std()-X"

* "tBodyGyro-std()-Y"

* "tBodyGyro-std()-Z"

* "tBodyGyroJerk-mean()-X"

* "tBodyGyroJerk-mean()-Y"

* "tBodyGyroJerk-mean()-Z"

* "tBodyGyroJerk-std()-X"

* "tBodyGyroJerk-std()-Y"

* "tBodyGyroJerk-std()-Z"

* "tBodyAccMag-mean()"

* "tBodyAccMag-std()"

* "tGravityAccMag-mean()"

* "tGravityAccMag-std()"

* "tBodyAccJerkMag-mean()"

* "tBodyAccJerkMag-std()"

* "tBodyGyroMag-mean()"

* "tBodyGyroMag-std()"

* "tBodyGyroJerkMag-mean()"

* "tBodyGyroJerkMag-std()"

* "fBodyAcc-mean()-X"

* "fBodyAcc-mean()-Y"

* "fBodyAcc-mean()-Z"

* "fBodyAcc-std()-X"

* "fBodyAcc-std()-Y"

* "fBodyAcc-std()-Z"

* "fBodyAccJerk-mean()-X"

* "fBodyAccJerk-mean()-Y"

* "fBodyAccJerk-mean()-Z"

* "fBodyAccJerk-std()-X"

* "fBodyAccJerk-std()-Y"

* "fBodyAccJerk-std()-Z"

* "fBodyGyro-mean()-X"

* "fBodyGyro-mean()-Y"

* "fBodyGyro-mean()-Z"

* "fBodyGyro-std()-X"

* "fBodyGyro-std()-Y"

* "fBodyGyro-std()-Z"

* "fBodyAccMag-mean()"

* "fBodyAccMag-std()"

* "fBodyBodyAccJerkMag-mean()"

* "fBodyBodyAccJerkMag-std()"

* "fBodyBodyGyroMag-mean()"

* "fBodyBodyGyroMag-std()"

* "fBodyBodyGyroJerkMag-mean()"

* "fBodyBodyGyroJerkMag-std()"
# Code Book

This code book summarizes the resulting data fields in `tidy_data.txt`. 

## Variables
* 'DataSet_1' is the required dataset in step 1
* 'DataSet_2' is the required dataset in step 2
* 'DataSet_3' is the required dataset in step 3
* 'DataSet_4' is the required dataset in step 4. Data was already with descriptive columnNames. No change was made
* 'DataSet_5' is the required dataset in step 5


## Identifiers

* 'subjectId' - The id of the 30 test subjects
* 'activityType'  - The type of activity performed when the corresponding measurements were taken

## Measurements

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation

## Activity Labels

* `WALKING` (value `1`): subject was walking during the test
* `WALKING_UPSTAIRS` (value `2`): subject was walking up a staircase during the test
* `WALKING_DOWNSTAIRS` (value `3`): subject was walking down a staircase during the test
* `SITTING` (value `4`): subject was sitting during the test
* `STANDING` (value `5`): subject was standing during the test
* `LAYING` (value `6`): subject was laying down during the test

# DATA DICTIONARY - tidy_data.txt
Steve Rust  
September 27, 2015  

activity

* 8-20 characters
* Activity being performed while data was collected
* Valid values:
    + "LAYING"
    + "SITTING"
    + "STANDING"
    + "WALKING"
    + "WALKING_DOWNSTAIRS"
    + "WALKING_UPSTAIRS"

subject

* 1-2 characters
* Number assigned to subject performing the activity
* Valid Values: 1, 2, . , 29, 30

#FEATURE TYPES

* fBodyAcc
* fBodyAccJerk
* fBodyGyro
* fBodyGyroJerk
* tBodyAcc
* tBodyAccJerk
* tBodyGyro
* tBodyGyroJerk
* tGravityAcc

#FEATURES FOR EACH FEATURE TYPE

FeatureType.mean...X

* 15 significant digits
* Mean of the X-component of the "Feature Type" normalized to [-1,1]
* Valid values: [-1,1]

FeatureType.std...X

* 15 significant digits
* Standard deviation of the X-component of the "Feature Type" normalized to [-1,1]
* Valid values: [-1,1]

FeatureType.mean...Y

* 15 significant digits
* Mean of the Y-component of the "Feature Type" normalized to [-1,1]
* Valid values: [-1,1]

FeatureType.std...Y

* 15 significant digits
* Standard deviation of the Y-component of the "Feature Type" normalized to [-1,1]
* Valid values: [-1,1]

FeatureType.mean...Z

* 15 significant digits
* Mean of the Z-component of the "Feature Type" normalized to [-1,1]
* Valid values: [-1,1]

FeatureType.std...Z

* 15 significant digits
* Standard deviation of the Z-component of the "Feature Type" normalized to [-1,1]
* Valid values: [-1,1]

FeatureTypeMag.mean..

* 15 significant digits
* Mean of the magnitude of the "Feature Type" normalized to [-1,1]
* Valid values: [-1,1]

FeatureTypeMag.std.. 

* 15 significant digits
* Standard deviation of the magnitude of the "Feature Type" normalized to [-1,1]
* Valid values: [-1,1]

#LIST OF ALL FEATURES

fBodyAcc

* fBodyAcc-mean()-X
* fBodyAcc-std()-X
* fBodyAcc-mean()-Y
* fBodyAcc-std()-Y
* fBodyAcc-mean()-Z
* fBodyAcc-std()-Z
* fBodyAccMag-mean()
* fBodyAccMag-std()

fBodyAccJerk

* fBodyAccJerk-mean()-X
* fBodyAccJerk-std()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-std()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-Z
* fBodyAccJerkMag-mean()
* fBodyAccJerkMag-std()

fBodyGyro

* fBodyGyro-mean()-X 
* fBodyGyro-std()-X 
* fBodyGyro-mean()-Y 
* fBodyGyro-std()-Y 
* fBodyGyro-mean()-Z 
* fBodyGyro-std()-Z 
* fBodyGyroMag-mean() 
* fBodyGyroMag-std()

fBodyGyroJerkMag

* fBodyGyroJerkMag-mean() 
* fBodyGyroJerkMag-std()

tBodyAcc

* tBodyAcc-mean()-X 
* tBodyAcc-std()-X 
* tBodyAcc-mean()-Y 
* tBodyAcc-std()-Y 
* tBodyAcc-mean()-Z 
* tBodyAcc-std()-Z 
* tBodyAccMag-mean() 
* tBodyAccMag-std()

tBodyAccJerk

* tBodyAccJerk-mean()-X 
* tBodyAccJerk-std()-X 
* tBodyAccJerk-mean()-Y 
* tBodyAccJerk-std()-Y 
* tBodyAccJerk-mean()-Z 
* tBodyAccJerk-std()-Z 
* tBodyAccJerkMag-mean() 
* tBodyAccJerkMag-std()

tBodyGyro

* tBodyGyro-mean()-X 
* tBodyGyro-std()-X 
* tBodyGyro-mean()-Y 
* tBodyGyro-std()-Y 
* tBodyGyro-mean()-Z 
* tBodyGyro-std()-Z 
* tBodyGyroMag-mean() 
* tBodyGyroMag-std()

tBodyGyroJerk

* tBodyGyroJerk-mean()-X 
* tBodyGyroJerk-std()-X 
* tBodyGyroJerk-mean()-Y 
* tBodyGyroJerk-std()-Y 
* tBodyGyroJerk-mean()-Z 
* tBodyGyroJerk-std()-Z 
* tBodyGyroJerkMag-mean() 
* tBodyGyroJerkMag-std()

tGravityAcc

* tGravityAcc-mean()-X 
* tGravityAcc-std()-X 
* tGravityAcc-mean()-Y 
* tGravityAcc-std()-Y 
* tGravityAcc-mean()-Z 
* tGravityAcc-std()-Z 
* tGravityAccMag-mean() 
* tGravityAccMag-std()

#DATA PROCESSING

The following data processing steps were performed on the original data in order to produce tidy_data.txt

1. Read in and process the feature data
    + Read in feature names & replace illegal characters with "."
    + Create a vector naming the 66 features to keep
    + Read in and process the data for the time and frequency features keeping only the 66 features of interest
    + Rename mis-named features containing "BodyBody"

2. Read in and process the activity data maintaining the original
   sort order
    + Read in the activity label lookup table
    + Read in the activity data sets and add row numbers
    + Merge the activity labels into the activity dataframe, sort to the original order, and keep only the activity labels

3. Read in the subject data

4. Merge and concatenate
    + Merge the training dataframes into a single dataframe
    + Merge the testing dataframes into a single dataframe
    + Concatenate the training and testing dataframes

5. Make tidy data
    + Create a tidy dataframe containing mean values of each of the 66 features for each combination of activity and subject
    + Export the tidy.data dataframe to the tidy_data.txt file

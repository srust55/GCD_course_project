# README
Steve Rust  
September 27, 2015  

#ORIGINAL DATA

The original data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip on September 26, 2015.  For more information on the original data, see Antigua et al [1].  Some of the text in this file is copied and pasted from the features_info.txt file provided with the original data.

#DATA COLLECTION

Experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

#BASIC FEATURES

In the original dataset, there are nine time and frequency domain feature types and, with one exception, each feature type has four basic features.  The basic features are X, Y and Z components and an overall Magnitude (Mag) value.  The "fBodyGyroJerk" feature type has only the Mag basic feature.  Thus there are 33 basic features that are named as follows:

* fBodyAcc-(X,Y,Z,Mag)
* fBodyAccJerk-(X,Y,Z,Mag)
* fBodyGyro-(X,Y,Z,Mag)
* fBodyGyroJerk-Mag
* tBodyAcc-(X,Y,Z,Mag)
* tBodyAccJerk-(X,Y,Z,Mag)
* tBodyGyro-(X,Y,Z,Mag)
* tBodyGyroJerk-(X,Y,Z,Mag)
* tGravityAcc-(X,Y,Z,Mag) 

The feature types come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

#BASIC FEATURE UNITS

The units for the basic features are as follows: 

Feature Type  | Feature Units
------------- | --------------------------
fBodyAcc      | standard gravity units (g)
fBodyAccJerk  | standard gravity units (g)
fBodyGyro     | radians/sec
fBodyGyroJerk | radians/sec
tBodyAcc      | standard gravity units (g)
tBodyAccJerk  | standard gravity units (g)
tBodyGyro     | radians/sec
tBodyGyroJerk | radians/sec
tGravityAcc   | standard gravity units (g)


#PRE-PROCESSING OF THE BASIC FEATURES

Each of the 33 basic features was pre-processed using fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).  For each window, the mean and the standard deviation of the basic features values was calculated.  This process resulted in 66 aggregate features that are named as follows:

* FeatureType-mean()-X 
* FeatureType-std()-X 
* FeatureType-mean()-Y 
* FeatureType-std()-Y 
* FeatureType-mean()-Z 
* FeatureType-std()-Z 
* FeatureTypeMag-mean() 
* FeatureTypeMag-std()

As a final pre-processing step, all aggregate features have been normalized to be bounded within the interval [-1,1].

#AVERAGING THE AGGREGATE FEATURES TO PRODUCE A TIDY DATASET

For the aggregate features, a mean value was calculated for each unique combination of "activity" and "subject" and these average aggregate values are included in the tidy_data.txt file.  The tidy_data.txt file contains a columns for each of the 66 average aggregate features and two additional columns identifying the "activity" and "subject" for a total of 68 columns.  Since each of 30 subjects performed each of 6 activities, there are 180 rows of data in tidy_data.txt. 

The average aggregate features were given the same names as the corresponding aggregate features from which they were calculated.  However, because hyphens and parentheses are illegal characters for variable names in some software packages, the variables were renamed replacing all of the hyphens and parentheses with periods.  Thus the average aggregate feature names in tidy_data.txt are as follows: 

* FeatureType.mean...X 
* FeatureType.std...X 
* FeatureType.mean...Y 
* FeatureType.std...Y 
* FeatureType.mean...Z 
* FeatureType.std...Z 
* FeatureTypeMag.mean.. 
* FeatureTypeMag.std..

#DATA DICTIONARY FOR TIDY DATASET

See the file CodeBook.md for detailed descriptions of the variables in tidy_data.txt.

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


#REFERENCE

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

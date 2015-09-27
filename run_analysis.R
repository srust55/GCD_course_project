#Set working directory
library(Kmisc)
library(plyr)
setwd("C:/Users/Steve/Documents/My Folders/Coursera/Data Science/Getting Cleaning Data/CP")

#Read in and process the feature data

    #Read in feature names and replace illegal characters with "."
    feature.names <- as.character(read.table("UCI HAR Dataset/features.txt",
                                             col.names=c("feature.num","feature.name"))$feature.name)
    feature.names <- gsub("-",".",feature.names)
    feature.names <- gsub("\\(",".",feature.names)
    feature.names <- gsub("\\)",".",feature.names)
    
    #Create a vector naming the 66 features to keep
    features.mean <- fgrep("mean..", feature.names, value=TRUE)
    features.std  <- fgrep( "std..", feature.names, value=TRUE)
    features.keep <- as.vector(rbind(features.mean,features.std))
    
    #Read in and process the data for the time and frequency features
    # keeping only the 66 features of interest
    features.train <- subset(read.table("UCI HAR Dataset/train/X_train.txt",col.names=feature.names),
                             select=features.keep)
    features.test  <- subset(read.table(  "UCI HAR Dataset/test/X_test.txt",col.names=feature.names),
                             select=features.keep)
    
    #Rename mis-named features
    features.train <-rename(features.train, 
                            c("fBodyBodyAccJerkMag.mean.." ="fBodyAccJerkMag.mean..",
                              "fBodyBodyGyroMag.mean.."    ="fBodyGyroMag.mean..",
                              "fBodyBodyGyroJerkMag.mean.."="fBodyGyroJerkMag.mean..",
                              "fBodyBodyAccJerkMag.std.." ="fBodyAccJerkMag.std..",
                              "fBodyBodyGyroMag.std.."    ="fBodyGyroMag.std..",
                              "fBodyBodyGyroJerkMag.std.."="fBodyGyroJerkMag.std.."))
    features.test  <-rename(features.test, 
                            c("fBodyBodyAccJerkMag.mean.." ="fBodyAccJerkMag.mean..",
                              "fBodyBodyGyroMag.mean.."    ="fBodyGyroMag.mean..",
                              "fBodyBodyGyroJerkMag.mean.."="fBodyGyroJerkMag.mean..",
                              "fBodyBodyAccJerkMag.std.." ="fBodyAccJerkMag.std..",
                              "fBodyBodyGyroMag.std.."    ="fBodyGyroMag.std..",
                              "fBodyBodyGyroJerkMag.std.."="fBodyGyroJerkMag.std.."))
    

#Read in and process the activity data maintaining the original sort order

    #Read in the activity label lookup table
    activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt",col.names=c("act.num","activity"))
    
    #Read in the activity data sets and add row numbers
    
        y.train <- read.table("UCI HAR Dataset/train/y_train.txt",col.names=c("act.num"))
        row.num <- 1:7352
        y.train.plus <- cbind(row.num, y.train)
        
        y.test  <- read.table(  "UCI HAR Dataset/test/y_test.txt",col.names=c("act.num"))
        row.num <- 1:2947
        y.test.plus <- cbind(row.num, y.test)
    
    #Merge the activity labels into the activity dataframe, sort to the original
    # order, and keep only the activity labels
        
        activity.train <- subset(merge(x=y.train.plus, y=activity.labels, by="act.num"), 
                                 select=c("row.num","activity"))
        activity.train <- activity.train[order(activity.train$row.num),]
        activity.train <- subset(activity.train, select="activity")
        
        activity.test <- subset(merge(x=y.test.plus , y=activity.labels, by="act.num"), 
                                 select=c("row.num","activity"))
        activity.test <- activity.test[order(activity.test$row.num),]
        activity.test <- subset(activity.test, select="activity")

#Read in the subject data      
subject.train <- read.table("UCI HAR Dataset/train/subject_train.txt",col.names="subject.num")
subject.test  <- read.table(  "UCI HAR Dataset/test/subject_test.txt",col.names="subject.num")

#Merge and concatenate

    #Merge the training dataframes into a single dataframe
    # adding a logical training indicator variable 
    trainind <- rep(TRUE,7352)
    train <- cbind(trainind, activity.train, subject.train, features.train)
    
    #Merge the testing dataframes into a single dataframe
    # adding a logical training indicator variable  
    trainind <- rep(FALSE,2947)
    test <- cbind(trainind, activity.test, subject.test, features.test)
    
    #Concatenate the training and testing dataframes
    all.data <- rbind(train,test)

#Make tidy data

    #Create a tidy dataframe containing mean values of each of the 66 features
    # for each combination of activity and subject
    tidy.data <- aggregate(all.data[,-(1:3)], by=list(all.data$activity,all.data$subject.num), 
                           FUN="mean")
    tidy.data <-rename(tidy.data, c("Group.1"="activity","Group.2"="subject"))
    
    #Export the tidy.data to a text file
    write.table(tidy.data, "tidy_data.txt", row.name=FALSE)

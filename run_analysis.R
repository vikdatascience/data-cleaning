library(dplyr)

## Generic function to read the test and training files
readXY <- function (fType) {

  xFile <- paste("./UCI HAR Dataset/", fType, "/X_", fType, ".txt", sep="")
  yFile <- paste("./UCI HAR Dataset/", fType, "/Y_", fType, ".txt", sep="")
  sFile <- paste("./UCI HAR Dataset/", fType, "/subject_", fType, ".txt", sep="")
  
  xDF <- read.table(xFile)
  yDF <- read.table(yFile)
  sDF <- read.table(sFile)
  
  names(sDF) <- c("subject")
  names(yDF) <- c("y")
  
  df <- cbind(sDF, yDF, xDF) 

}

## Download the data file and unzip
##download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "sgs.zip")
##unzip("sgs.zip")

##########################################################################
## Read X_test and Y_test and combine to one test dataset (by column)
print("Reading test data...")
testDF <- readXY("test")
testDF$type <- "test"

## Read X_train and Y_train and combine to one train dataset (by column)
print("Reading train data...")
trainDF <- readXY("train")
trainDF$type <- "train"

print("Combining and tidying data...")
## Combine test and train to one dataset by rows
uci_har_df <- rbind(testDF, trainDF)
## (1) uci_har_df is the answer to the requirement
##     "Merges the training and the test sets to create one data set."
##########################################################################


## Read features.txt and change names of the dataset variables
features <- read.table("./UCI HAR Dataset/features.txt")
features$V2 <- sub("\\(\\)", "", features$V2)
features$V2 <- sub("\\)$", "", features$V2)
features$V2 <- gsub("[\\(]|[\\)]|[,]", "_", features$V2)
features$V2 <- gsub("-", "_", features$V2)
names(uci_har_df)[3:563] <- make.unique(features$V2)
uci_har_df$activity_label <- ""
## (4) uci_har_df now has the answer to the requirement - 
##     "Appropriately labels the data set with descriptive variable names."
##########################################################################

## Extract out all variables that is of the type mean() and std()
mean_std_df <- select(uci_har_df, 1, 2, 564, 565, grep("_mean_|_std|mean$|std$", names(uci_har_df)))

## (2) mean_std_df is the answer to the requirement -
##    "Extracts only the measurements on the mean and 
##     standard deviation for each measurement."
##########################################################################


## Change column read from Y_test/train to the corresponding descriptive names from activity labels
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
for(i in 1:6) { 
  mean_std_df[mean_std_df$y==i,]$activity_label <- as.character(activity[i,2]) 
}
mean_std_df$y <- NULL

mean_std_df$subject <- factor(mean_std_df$subject)
mean_std_df$type <- factor(mean_std_df$type)
mean_std_df$activity_label <- factor(mean_std_df$activity_label)
  
## (3)  mean_std_df now has a column activity_label that has the descriptive name of the activities.
##    this answers the requirement -
##    "Uses descriptive activity names to name the activities in the data set"
##########################################################################


## create a tidy dataset as in requirement 5


by_activity_subject <- group_by(mean_std_df, activity_label, subject)
ave_by_activity_subject <- summarize_each(by_activity_subject, funs(mean), -type)
names(ave_by_activity_subject)[3:68] <- paste("ave", names(ave_by_activity_subject)[3:68], sep="_")

write.table(ave_by_activity_subject, "ave_by_activity_subject.txt", row.names = FALSE)

## (5)  ave_by_activity_subject answers the requirement -
##    "From the data set in step 4, creates a second, independent tidy data set 
##     with the average of each variable for each activity and each subject."
##########################################################################

print("Done! The tidy data is in the file ave_by_activity_subject.txt ")



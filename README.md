# Vikram's data-cleaning project submission

## Script Instructions
**__run_analysis.R__** is the script that does the following

1. Downloads the Samsung data (this part of the code is commented just to save time. Once it is downloaded, unzipped, there is no need to do it again. Please uncomment these two lines if you like to download the file again)
2. The script uses dplyr package. If you don't have that installed, you could install by running 
``` 
  install.package("dplyr")
```
3. The script assumes that the Samsung data is in the working directory. It first reads the test data and combines x, y and subject files. Once that is done, it reads the train data and combines corresponding files.

4. Combines test and train data to form the dataframe ` uci_har_df `.
5. Reads features.txt and forms the appropriate variable names and updates the dataframe `uci_har_df`
6. Extracts out all variables that is of the type mean() and std() and stores the result in the dataframe ` mean_std_df `
7. Updates the datframe with the apropriate activity labels
8. Finally creates the tidy dataset with the average of each variable for each activity and each subject. The resultant tidy dataset is stored in a text file `ave_by_activity_subject.txt `

### To run the script execute the following R command

```
  source("run_analysis.R")
  
```

##Code Book

**"activity_label":** The activity Label.  WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

**"subject" :** The subject id who was in test or train 

**Following are the averages of each of the mesurements per activity, per subject**

* "ave_tBodyAcc_mean_X" 
* "ave_tBodyAcc_mean_Y" 
* "ave_tBodyAcc_mean_Z" 
* "ave_tBodyAcc_std_X" 
* "ave_tBodyAcc_std_Y" 
* "ave_tBodyAcc_std_Z" 
* "ave_tGravityAcc_mean_X" 
* "ave_tGravityAcc_mean_Y" 
* "ave_tGravityAcc_mean_Z" 
* "ave_tGravityAcc_std_X" 
* "ave_tGravityAcc_std_Y" 
* "ave_tGravityAcc_std_Z" 
* "ave_tBodyAccJerk_mean_X"
* "ave_tBodyAccJerk_mean_Y"
* "ave_tBodyAccJerk_mean_Z" 
* "ave_tBodyAccJerk_std_X" 
* "ave_tBodyAccJerk_std_Y" 
* "ave_tBodyAccJerk_std_Z" 
* "ave_tBodyGyro_mean_X" 
* "ave_tBodyGyro_mean_Y" 
* "ave_tBodyGyro_mean_Z" 
* "ave_tBodyGyro_std_X" 
* "ave_tBodyGyro_std_Y" 
* "ave_tBodyGyro_std_Z" 
* "ave_tBodyGyroJerk_mean_X" 
* "ave_tBodyGyroJerk_mean_Y" 
* "ave_tBodyGyroJerk_mean_Z" 
* "ave_tBodyGyroJerk_std_X" 
* "ave_tBodyGyroJerk_std_Y" 
* "ave_tBodyGyroJerk_std_Z" 
* "ave_tBodyAccMag_mean" 
* "ave_tBodyAccMag_std" 
* "ave_tGravityAccMag_mean"
* "ave_tGravityAccMag_std" 
* "ave_tBodyAccJerkMag_mean" 
* "ave_tBodyAccJerkMag_std" 
* "ave_tBodyGyroMag_mean" 
* "ave_tBodyGyroMag_std" 
* "ave_tBodyGyroJerkMag_mean"
* "ave_tBodyGyroJerkMag_std" 
* "ave_fBodyAcc_mean_X" 
* "ave_fBodyAcc_mean_Y" 
* "ave_fBodyAcc_mean_Z" 
* "ave_fBodyAcc_std_X" 
* "ave_fBodyAcc_std_Y"
* "ave_fBodyAcc_std_Z"
* "ave_fBodyAccJerk_mean_X"
* "ave_fBodyAccJerk_mean_Y" 
* "ave_fBodyAccJerk_mean_Z" 
* "ave_fBodyAccJerk_std_X" 
* "ave_fBodyAccJerk_std_Y" 
* "ave_fBodyAccJerk_std_Z" 
* "ave_fBodyGyro_mean_X" 
* "ave_fBodyGyro_mean_Y" 
* "ave_fBodyGyro_mean_Z" 
* "ave_fBodyGyro_std_X" 
* "ave_fBodyGyro_std_Y" 
* "ave_fBodyGyro_std_Z" 
* "ave_fBodyAccMag_mean" 
* "ave_fBodyAccMag_std" 
* "ave_fBodyBodyAccJerkMag_mean" 
* "ave_fBodyBodyAccJerkMag_std" 
* "ave_fBodyBodyGyroMag_mean" 
* "ave_fBodyBodyGyroMag_std"






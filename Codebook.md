
Code book for Getting and Cleaning Data Course Project
======================================================

### Sections of this code book:  

1. Data Dictionary for Source Data (UCI HAR Dataset)  
2. Data Dictionary for tidy Data (tidy_data.txt)  
3. Variables used in `run_analysis.R` script


#### Structure of Source Data

Data was downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

```
UCI HAR Dataset/  
        activity_labels.txt  
        features_info.txt  
        features.txt  
        README.txt  
        test/  
            subject_test.txt  
            X_test.txt  
            y_test.txt  
            Inertial Signals/  
        train/  
            subject_train.txt  
            X_train.txt  
            y_train.txt  
            Inertial Signals/  
```

The 'Inertial Signals' subdirectories of test/ and train/ are not used for this project.

The files that are used are the following:

`activity_labels.txt`: Links the class labels with their activity name.  
`features.txt`: List of all features.  
`train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.  
`train/X_train.txt`: Training set.  
`train/y_train.txt`: Training labels.  
`test/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.  
`test/X_test.txt`: Test set.  
`test/y_test.txt`: Test labels.  

The structures of the training and testing data is the same.

### Data Dictionary for Tidy Data

The tidy data is a comma-separated file with a header row. 

For each row, columns 1 and 2 contain the subject and activity.

The remaining columns contain the means of all the observed measurements for each variable for that subject & activity.The list of obsevered measurements is shown below.

`tBodyAcc_mean_X`  
`tBodyAcc_mean_Y`   
`tBodyAcc_mean_Z`             
`tBodyAcc_std_X`  
`tBodyAcc_std_Y`            
`tBodyAcc_std_Z`            
`tGravityAcc_mean_X`   
`tGravityAcc_mean_Y`  
`tGravityAcc_mean_Z`   
`tGravityAcc_std_X`  
`tGravityAcc_std_Y`   
`tGravityAcc_std_Z`  
`tBodyAccJerk_mean_X`  
`tBodyAccJerk_mean_Y`  
`tBodyAccJerk_mean_Z`  
`tBodyAccJerk_std_X`    
`tBodyAccJerk_std_Y`    
`tBodyAccJerk_std_Z`   
`tBodyGyro_mean_X`  
`tBodyGyro_mean_Y`     
`tBodyGyro_mean_Z`  
`tBodyGyro_std_X`  
`tBodyGyro_std_Y`  
`tBodyGyro_std_Z`  
`tBodyGyroJerk_mean_X`  
`tBodyGyroJerk_mean_Y`  
`tBodyGyroJerk_mean_Z`  
`tBodyGyroJerk_std_X`  
`tBodyGyroJerk_std_Y`         
`tBodyGyroJerk_std_Z`  
`tBodyAccMag_mean`          
`tBodyAccMag_std`          
`tGravityAccMag_mean`       
`tGravityAccMag_std`       
`tBodyAccJerkMag_mean`     
`tBodyAccJerkMag_std`      
`tBodyGyroMag_mean`        
`tBodyGyroMag_std`         
`tBodyGyroJerkMag_mean`     
`tBodyGyroJerkMag_std`     
`fBodyAcc_mean_X`         
`fBodyAcc_mean_Y`          
`fBodyAcc_mean_Z`          
`fBodyAcc_std_X`           
`fBodyAcc_std_Y`            
`fBodyAcc_std_Z`           
`fBodyAccJerk_mean_X`      
`fBodyAccJerk_mean_Y`       
`fBodyAccJerk_mean_Z`      
`fBodyAccJerk_std_X`        
`fBodyAccJerk_std_Y`        
`fBodyAccJerk_std_Z`       
`fBodyGyro_mean_X`          
`fBodyGyro_mean_Y`          
`fBodyGyro_mean_Z`         
`fBodyGyro_std_X`          
`fBodyGyro_std_Y`          
`fBodyGyro_std_Z`          
`fBodyAccMag_mean`         
`fBodyAccMag_std`           
`fBodyBodyAccJerkMag_mean`  
`fBodyBodyAccJerkMag_std`   
`fBodyBodyGyroMag_mean`      
`fBodyBodyGyroMag_std`     
`fBodyBodyGyroJerkMag_mean`  
`fBodyBodyGyroJerkMag_std` 


### Variables used in the `run_analysis.R` script

This section describes some of the important variables used in the script.

`data_folder` - name of subdirectory in which UCI HAR Dataset files are stored  
`activity_labels` - activity labels, table read from `activity_labels.txt` file  
`feature_labels` - feature names, table read from `features.txt` file  
`train_subject` - subject IDs, training data set, table read from `train/subject_train.txt` file  
`train_y` - activity, training data set, table read from `train/y_train.txt` file  
`train` - assembled training data set  
`train_x` - measurement data, training data set, table read from `train/X_train.txt` file  
`test_subject` - subject IDs, testing data set, table read from `test/subject_test.txt` file  
`test_y` - activity, testing data set, table read from `test/y_test.txt` file  
`test_x` - measurement data, testing data set, table read from `test/X_test.txt` file  
`test` - assembled testing data set  
`combined` - combined training & testing data set  
`filter` - logical filter selecting columns with "mean" or "std" in their header  
`combined_tidy` - downselected training & testing data set, filtered using `filter` (see above)  
`reshaped` - recast dataframe, by subject + activity, function = mean

### References

#### Source Data Set Authors

>Human Activity Recognition Using Smartphones Dataset  
>Version 1.0  
>Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
>Smartlab - Non Linear Complex Systems Laboratory  
>DITEN - Universit? degli Studi di Genova.  
>Via Opera Pia 11A, I-16145, Genoa, Italy.  
>activityrecognition@smartlab.ws  
>www.smartlab.ws


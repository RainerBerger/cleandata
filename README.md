
## Course Project for Getting and Cleaning Data

This project deals with data related to wearable computing. Specifically, the data used was collected from the accelerometers from a Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data files were obtained from the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The project involves converted the source data from the above link to a tidy data set.

### Description of Files

This repository contains the following files:

* `run_analysis.R` - R script containing the steps for cleaning the data
* `submission_data.txt` - the Tidy data set produced from running the cleaning script
* `Codebook.md` - The code book for the source and summarized data sets
* `README.md` - This readme file


### Data Cleansing steps in run_analysis.R script:

The data cleansing is split into 3 stages:  

#### Stage 1  

The first stage involves reading the training and the testing data and combining them to create a single data set.

We Use descriptive activity names to name the activities in the data set.
The descriptive activity names are read from `activity_labels.txt`.
The descriptive feature names are read, as character, from `feature.txt`.

The train and test data sets are each broken into three files--one each for subject, y and x where subject is the test subject ID, y is the activity label and x are the measurements for each feature.

#### Stage 2  

We want to extract only the measurements on the mean and standard deviation for each measurement.

A logical filter, `filter`, is created using `grepl()` to search the names vector for names including the text "mean" or "std".  

#### Stage 3  

This stage involves creating a tidy data set with the mean of each variable
for each activity and subject.

The `tidied` data frame is written to a text file `tidy_data.txt` for further analysis.  

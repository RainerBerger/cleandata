
## Course Project for Getting and Cleaning Data

#### Stage 1 ####

## Data has been unzipped to directory "UCI HAR Dataset"

data_folder <- "UCI HAR Dataset"

## Read the activity_labels.txt file.
## This file contains the activity names as the second column 
activity_labels <- read.table(paste(data_folder, "activity_labels.txt", sep="/"), header=FALSE, 
                       colClasses="character")

## Read the features.txt file.
## The names of the features are stored in the second column
feature_labels <- read.table(paste(data_folder, "features.txt", sep="/"), header=FALSE, 
                       colClasses="character")

## Reformat the variable names, changing "-" to "_" and removing "()" 
feature_labels[,2] <- gsub("-", "_", feature_labels[,2])
feature_labels[,2] <- gsub("\\(\\)", "", feature_labels[,2])


## Read the training data.  
## Data set is stored in 3 files: subject_train.txt, y_train.txt, X_train.txt
train_subject <- read.table(paste(data_folder, "train", "subject_train.txt", sep="/"), header=FALSE, 
                    colClasses="numeric")

train_y <- read.table(paste(data_folder, "train", "y_train.txt", sep="/"), header=FALSE, 
                    colClasses="factor")

train_x <- read.table(paste(data_folder, "train", "X_train.txt", sep="/"), col.names=feature_labels[,2], 
                      colClasses="numeric")

## Rename levels of train_y with descriptive labels
levels(train_y[,1]) <- activity_labels[,2]

## Combine subject ID and train_x into one data.frame
train <- cbind(train_subject, train_y, train_x)

## Rename columns 1 & 2 with descriptive labels
names(train)[1] <- "subject"
names(train)[2] <- "activity"


## Read in testing data set.  
## This has the same format as the training data.
test_subject <- read.table(paste(data_folder, "test", "subject_test.txt", sep="/"), header=FALSE, 
                            colClasses="numeric")

test_y <- read.table(paste(data_folder, "test", "y_test.txt", sep="/"), header=FALSE, 
                      colClasses="factor")

test_x <- read.table(paste(data_folder, "test", "X_test.txt", sep="/"), col.names=feature_labels[,2], colClasses="numeric")

## Rename levels of test_y with descriptive labels
levels(test_y[,1]) <- activity_labels[,2]

## Combine subject ID and test_x into one data.frame
test <- cbind(test_subject, test_y, test_x)

## Rename columns 1 & 2 with descriptive labels
names(test)[1] <- "subject"
names(test)[2] <- "activity"

## Combine training data and test data into one data frame
combined <- rbind(train, test)

##### Stage 2 ####

## Extract only the mean and standard deviation for each measurement

## Get columns that have names containing _mean_ and _std_. 
## Special care must be taken to not include the meanFreq values
filter <- ((grepl("_mean", names(combined)) & !grepl("_meanF", names(combined))) 
           + grepl("_std", names(combined)))

## downselect to first subject, activity and columns that pass the filter 
combined_tidy <- cbind(combined[,1:2], combined[,filter==TRUE])

######## Stage 3 ########

## Create a tidy data set with the mean of each variable for each activity and each subject
library(reshape2)

## melt the data frame to long form, using subject & activity as id columns
temp <- melt(combined_tidy, id.vars=c("subject", "activity"))

## dcast by subject & activity by taking the mean of each variable
reshaped <- dcast(temp, subject + activity ~ variable, mean)

## Save the reshaped data to a text file
write.csv(reshaped, file="tidy_data.txt", row.names=FALSE)

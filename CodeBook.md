---
title: "CodeBook"
author: "Jan Kiselovic"
date: "5/1/2020"
output: html_document
---


## Codebook Getting and Cleaning Data Course Project
The goal of this project is to prepare tidy_dataset from data collected from the accelerometers from the Samsung Galaxy S smartphone.Tidy dataset can be prepared by running the script `run_analysis.R`, this script performs below step to achieve the goal.

### 1.Download and unzip file to working directory folder dedicated to project
  `fileurl` store url to collected raw data
  
  script checks if directory exists and if not, it downloads file and unzip into folder UCI HAR Dataset

### 2. Load features names from features.txt
  feautres.txt includes variables names for different type of data collected, data from text file are loaded to table     `features` with dimension 561 2, 
  
  example of different features
  
  tBodyAcc-mean()-X  
  tBodyAcc-mean()-Y   
  tBodyAcc-mean()-Z  
  tBodyAcc-std()-X  
  
### 3. Load test data and assign features names as colum names, merge with subject id and activity id
  `X_test` stores test data from the file X_test.txt
  `Y_test`stores activity id for test data, loaded from  y_test.txt
  `test_subject`stores subject id, which identifies one of 30 volunteers providing the data
  `testdf`stores merge data from above three data tables
  
### 4. Load train data and assign features names as colum names, merge with subject id and activity id
  `X_train` stores train data from the file X_train.txt
  `Y_train`stores activity id for train data, loaded from  y_train.txt
  `train_subject`stores subject id, which identifies one of 30 volunteers providing the data
  `traindf`stores merge data from above three data tables

### 5. Merge traindf and testdf into one dataframe
  `all_data` bind testdf and traindf row wise

### 6. Extracts only the measurements on the mean and standard deviation for each measurement
  `dataset1` using select function from dplyr package select only rows which contains std or mean, plus activity and     subject

### 7. Uses descriptive activity names to name the activities in the data set
    File acitivity_labels.txt includes 6 different activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)  
    `activity_labels`stores data from activity_labels.txt, 2 columns and 6 rows
    `dataset2` merge based on activity id dataframe dataset1 and activity_labels
    
### 8. Appropriately labels the data set with descriptive variable names
    Using gsub function in column names special characters like - . or spaces are replaced with empty string and all letters are lowered

### 9. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
  `dataset3` stores data from dataset2 grouped by activity name and subject
  `tidy_dataset` stores final tidy dataset with average of each variable by subject and activity  
   tidy_dataset is exported and  saved in folder working directory
  

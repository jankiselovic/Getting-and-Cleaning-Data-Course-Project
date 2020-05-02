---
title: "README"
author: "Jan Kiselovic"
date: "5/2/2020"
output: html_document
---
## Getting and Cleaning Data Course Project
  The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. This repository includes `run_analysis.R` R script file, `CodeBook.md` describing steps for cleaning and describtion of variables in the script. 
  Dataset used for this excercise represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
  dataset can be downloaded here : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
  
## CodeBook
  `CodeBook.md` describes the variables, the data, and any transformations or work that was performed to clean up the data
  
## Run_analysis R script
  `run_analysis.R` Script which execute steps required to achieve tidy_dataset.Script does the following:  
  1. Merges the training and the test sets to create one data set.  
  2.Extracts only the measurements on the mean and standard deviation for each measurement.  
  3.Uses descriptive activity names to name the activities in the data set.  
  4.Appropriately labels the data set with descriptive variable names.    
  5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
## Tidy dataset
  `tidy_dataset.txt` it is cleaned data set as required by step 5 above. Exported and stored in working directory
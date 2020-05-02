## run following script to achieve
## 1.Merges the training and the test sets to create one data set.
## 2.Extracts only the measurements on the mean and standard deviation for each measurement.
## 3.Uses descriptive activity names to name the activities in the data set
## 4.Appropriately labels the data set with descriptive variable names.
## 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)
##download and unzip the files, check if files exist
file <- "getdata_projectfiles_UCI HAR Dataset"

if (!file.exists(file)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, file, method="curl")
}  

# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
  unzip(file) 
}

##locate features id and load it to variable features
features_url<-"UCI HAR Dataset/features.txt"
features<-read.table(features_url)

##locate test data and load it, assign result to X_test variable,change col names to features 
##assign subject(Test_subject) and activity(Y_test), bin wise column all three tables as testdf

X_test_url<-"UCI HAR Dataset/test/X_test.txt"
X_test<-read.table(X_test_url,col.names = features[,2])
Y_test_url<-"UCI HAR Dataset/test/y_test.txt"
Y_test<-read.table(Y_test_url,col.names=as.factor(c("activity")))
Test_subject_url<-"UCI HAR Dataset/test/subject_test.txt"
test_subject<-read.table(Test_subject_url,col.names = as.factor(c("subject")))
testdf<-cbind(X_test,Y_test,test_subject)

##locate train data and load it, assign result to X_train variable,change col names to features 
##assign subject(Train_subject) and activity(Y_train), bin wise column all three tables as traindf

X_train_url<-"UCI HAR Dataset/train/X_train.txt"
X_train<-read.table(X_train_url,col.names = features[,2])
Y_train_url<-"UCI HAR Dataset/train/y_train.txt"
Y_train<-read.table(Y_train_url,col.names=as.factor(c("activity")))
Train_subject_url<-"UCI HAR Dataset/train/subject_train.txt"
train_subject<-read.table(Train_subject_url,col.names = as.factor(c("subject")))
traindf<-cbind(X_train,Y_train,train_subject)

## 1. merge traindf and testdf row wise

all_data<-rbind(testdf,traindf)

## 2.extracts only the measurements on the mean and standard deviation for each measurement

dataset1<-select(all_data,contains("mean"),contains("sdv"),activity,subject)

## 3.Uses descriptive activity names to name the activities in the data set

activity_url<-"UCI HAR Dataset/activity_labels.txt"
activity_labels<-read.table(activity_url,col.names = as.factor(c("activity","activityname")))
dataset2<-merge(dataset1,activity_labels)
dataset2<-select(dataset2,!activity)

## 4.Appropriately labels the data set with descriptive variable names

names(dataset2) <- gsub("\\.","",tolower(names(dataset2)))

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject

dataset3<-group_by(dataset2,activityname,subject)
tidy_dataset<-summarise_all(dataset3,mean)

write.table(tidy_dataset,"./tidy_dataset.txt",quote = FALSE, row.names = FALSE)



# Load libraries
library(dplyr)
library(data.table)

# Download zip file and extract

if(!file.exists("./data")){dir.create("./data")}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
f <- file.path("./data", "har.zip")
if(!file.exists("./data/UCI HAR Dataset")){download.file(url, f)}
if(!file.exists("./data/UCI HAR Dataset")){unzip(f, exdir = "./data")}

# Read files

features <- fread("./data/UCI HAR Dataset/features.txt", col.names = c("index","featureName"))
uniqueFeatures <- make.unique(features$featureName, sep="_")
activityLabels <- fread("./data/UCI HAR Dataset/activity_labels.txt", col.names = c("index","activityLabel"))
testData <- fread("./data/UCI HAR Dataset/test/X_test.txt", col.names = uniqueFeatures)
testLabel <- fread("./data/UCI HAR Dataset/test/y_test.txt", col.names = "activity")
testSubject <- fread("./data/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
trainData <- fread("./data/UCI HAR Dataset/train/X_train.txt", col.names = uniqueFeatures)
trainLabel <- fread("./data/UCI HAR Dataset/train/y_train.txt", col.names = "activity")
trainSubject <- fread("./data/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

# 1. Merges the training and the test sets to create one data set.

# Combine tables

testData <- cbind(testSubject, testLabel, testData)
trainData <- cbind(trainSubject, trainLabel, trainData)
df <- rbind(testData,trainData)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

df <- select(df, subject,activity, grep(".*mean.*|.*std.*", names(df), ignore.case=TRUE,value=TRUE))

# 3. Uses descriptive activity names to name the activities in the data set

df$activity <- activityLabels[df$activity, 2]

# 4. Appropriately labels the data set with descriptive variable names. 

names(df)<-gsub("^t", "time", names(df))
names(df)<-gsub("^f", "frequency", names(df))
names(df)<-gsub("Acc", "Accelerometer", names(df))
names(df)<-gsub("Gyro", "Gyroscope", names(df))
names(df)<-gsub("BodyBody", "Body", names(df))
names(df)<-gsub("Mag", "Magnitude", names(df))
names(df)<-gsub("tBody", "TimeBody", names(df))
names(df)<-gsub("-mean", "Mean", names(df), ignore.case = TRUE)
names(df)<-gsub("-std", "STD", names(df), ignore.case = TRUE)
names(df)<-gsub("-freq", "Frequency", names(df), ignore.case = TRUE)
names(df)<-gsub("\\(\\)", "", names(df))
names(df)<-gsub("\\-", "", names(df))
 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each 
#    variable for each activity and each subject.

tidydf <- as_tibble(df)
tidyMeans <- tidydf %>% group_by(subject, activity) %>% 
        summarize(across(everything(), list(mean = ~ mean(.x, na.rm = TRUE))))
write.table(tidyMeans, "tidyData.txt", row.name=FALSE)

# first check to see if dataset is in working directory. if not, download and unzip.
filename <- "UCI HAR DATASET"

if(!file.exists(filename)) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip")
  unzip("dataset.zip")
}

#load features 
features <- read.table("UCI HAR DATASET/features.txt")
featurenames <- as.character(features[,2])

#load subject data for test and training sets, combine them and name column descriptively
subject_test <- read.table("UCI HAR DATASET/test/subject_test.txt")
subject_train <- read.table("UCI HAR DATASET/train/subject_train.txt")
subject_combine <- rbind(subject_train,subject_test)
names(subject_combine) <- "SubjectID"

#load activity label data for test and training sets, combine them and name column descriptively
y_test <- read.table("UCI HAR DATASET/test/y_test.txt")
y_train <- read.table("UCI HAR DATASET/train/y_train.txt")
y_combine <- rbind(y_train,y_test)
names(y_combine) <- "Activity"

#load variable data for test and training sets, combine them and name columns according to the feature names
X_test <- read.table("UCI HAR DATASET/test/X_test.txt")
X_train <- read.table("UCI HAR DATASET/train/X_train.txt")
X_combine <- rbind(X_train,X_test)
names(X_combine) <- featurenames

#bind all the data together
testtrain <- cbind(subject_combine,y_combine,X_combine)

#find the columns containing variables with mean and std data and extract these columns along with subject and activity ID
MeanStdColumns <- grep("mean|std",names(testtrain),ignore.case=TRUE)
extractColumns <- c(1,2,MeanStdColumns)
extractedData <- testtrain[,extractColumns]

#rename the activity lables with descriptive names
activity_labels <- read.table("UCI HAR DATASET/activity_labels.txt")
activity_labels <- as.character(activity_labels[,2])
for (i in 1:6) {
  extractedData$Activity[extractedData$Activity == i] <- activity_labels[i]
}

#rename labels to descriptive variable names
names(extractedData) <- gsub("^t", "Time", names(extractedData))
names(extractedData) <- gsub("^f|Freq", "Frequency", names(extractedData))
names(extractedData) <- gsub("Acc", "Accelerometer", names(extractedData))
names(extractedData) <- gsub("mean", "Mean", names(extractedData))
names(extractedData) <- gsub("std", "STD", names(extractedData))
names(extractedData) <- gsub("Gyro", "Gyroscope", names(extractedData))
names(extractedData) <- gsub("BodyBody", "Body", names(extractedData))
names(extractedData) <- gsub("Mag", "Magnitude", names(extractedData))
names(extractedData) <- gsub("gravity", "Gravity", names(extractedData))
names(extractedData) <- gsub("()","", names(extractedData), fixed = TRUE)
names(extractedData) <- gsub("tBody","TimeBody", names(extractedData))

# create new tidy data set with the average of each variable for each activity and each subject
tidydata <- aggregate(. ~SubjectID+Activity, extractedData, mean)
write.table(tidydata, file = "TidyData.txt", row.names = FALSE, quote = FALSE)
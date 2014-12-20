# 1. Merges the training and the test sets to create one data set.
trainData <- read.table("./data/train/X_train.txt")
trainActivity <- read.table("./data/train/y_train.txt")
trainSubject <- read.table("./data/train/subject_train.txt")

testData <- read.table("./data/test/X_test.txt")
testActivity <- read.table("./data/test/y_test.txt")
testSubject <- read.table("./data/test/subject_test.txt")

allData <- rbind(trainData, testData)
allActivity <- rbind(trainActivity, testActivity)
allSubject <- rbind(trainSubject, testSubject)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("./data/features.txt")
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
allData <- allData[, meanStdIndices]
names(allData) <- gsub("\\(\\)", "", features[meanStdIndices, 2])
names(allData) <- gsub("-", "", names(allData))


# 3. Uses descriptive activity names to name the activities in the data set
activity <- read.table("./data/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[allActivity[, 1], 2]
allActivity[, 1] <- activityLabel
names(allActivity) <- "activity"

# 4. Appropriately labels the data set with descriptive variable names.
names(allSubject) <- "subject"
cleanedData <- cbind(allSubject, allActivity, allData)
write.table(cleanedData, "merged_data.txt")

# 5. From the data set in step 4, creates a second, independent tidy data 
# set with the average of each variable for each activity and each subject.
subjectLen <- length(table(allSubject))
activityLen <- dim(activity)[1]
columnLen <- dim(cleanedData)[2]
result <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen)
result <- as.data.frame(result)
colnames(result) <- colnames(cleanedData)
row <- 1
for(i in 1:subjectLen) {
  for(j in 1:activityLen) {
    result[row, 1] <- sort(unique(allSubject)[, 1])[i]
    result[row, 2] <- activity[j, 2]
    bool1 <- i == cleanedData$subject
    bool2 <- activity[j, 2] == cleanedData$activity
    result[row, 3:columnLen] <- colMeans(cleanedData[bool1&bool2, 3:columnLen])
    row <- row + 1
  }
}

write.table(result, "data_means.txt")

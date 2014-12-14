The datasec can be downloaded at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description of the data is available at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The provided R script run_analysis.R performs the following steps to prepare the data for analysis.

1. Merges the training and the test sets to create one data set. The merged dataset consists of three data frames
allData: consisting of 10299 observations and 561 variables (source: train/X_train.txt and test/X_test.txt).
allActivity: consisting of 10299 activity ids (source: train/y_train.txt with test/y_test.txt).
allSubjects: consisting of 10299 subject ids (source: train/subject_train.txt with test/subject_test.txt).

2. Extracts only the measurements on the mean and standard deviation for each measurement. The result is a data frame with 66 variables.

3. Uses descriptive activity names to name the activities in the data set. (source: activity_labels.txt)

4. Labels the data set with descriptive variable names. (underscores and parentheses are removed)

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The resulting file data_means.txt  consist of 180 rows and 68 columns.

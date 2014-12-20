This file describes how to use the run_analysis.R script to prepare the data for analysis.

1. Make sure that the run_analysis.R is in the urrent working directory.
2. Download and unzip the raw data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into a sub directory named "data".
3. Run the run_analysis.R script, e.g., by using the source command in RStudio.
The script generates two files in the current working directory:
+ merged_data.txt: a data table with 10299x68 dimension containing the merged data from the train and test data.
+ data_means.txt.: a data table with 180x68 dimension containing the average of each variable for each activity and each subject.
4. The data can be loaded into R, e.g., by using data_means <- read.table("data_means.txt") command.

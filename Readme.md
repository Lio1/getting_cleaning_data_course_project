Readme
======

**run_analysis.R** runs a series of operations on the Human Activity Recognition Using Smartphones Data Folder (available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones))

This script assumes that data folder for this assignment is already downloaded and unzipped, which means that the folder "UCI HAR Dataset" should already be in the working directory

#### Description of the script 

run_analysis.R conducts the following analysis:

1. It loads the required libraries for data manipulation
2. It loads the datasets from the *test* and *train* subfolders
3. For each *test* and *train* datasets :
 * Activity identifiers are labelled using names from the "activity_labels.txt" file
 * Activity names and subject number are added as additional variables to the main datasets (with the measurements)
 * Descriptive variable names are added, using names from the "feature.txt" file
 * A "type" colum is added to keep train of the dataset of origin (test vs. train)
4. It merges the *test* and *train* datasets into a single dataset
5. It creates a second dataset with only the average of each measurement for each activity and each subject
6. This dataset is exported as a text file named "final_tidy_set.txt" and is included in this repository

#### Usage of the script

To use this run this analysis, download and unzip the Human Activity Recognition Using Smartphones Data Folder (available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones))

 ``` data <- read.table(file_path, header = TRUE)```
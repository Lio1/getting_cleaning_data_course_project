Readme
======

**run_analysis.R** runs a series of operations on the Human Activity Recognition Using Smartphones Data Folder (available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)).

This script assumes that the data folder for this assignment is already downloaded and unzipped, which means that the folder "UCI HAR Dataset" should already be in the working directory.

### Description of the script 

run_analysis.R conducts the following analysis:

1. It loads the required libraries for data manipulation
2. It loads the datasets from the *test* and *train* subfolders
3. For each *test* and *train* datasets :
 * Activity identifiers are labelled using names from the "activity_labels.txt" file
 * Activity names and subject numbers are added as additional variables to the main dataset (the one with the measurements)
 * Descriptive variable names are added, using names from the "feature.txt" file
 * A "type" colum is added to keep track of the dataset of origin (*test* vs. *train*)
4. It merges the *test* and *train* datasets into a single dataset
5. It creates a second dataset with only the average of each measurement for each activity and each subject
6. This dataset is exported as a text file named "final_tidy_set.txt", which is included in this repository

### Usage of the script

To run this script

1. Download and unzip the Human Activity Recognition Using Smartphones Data Folder (available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)) in your working directory
2. Download the *run_analysis.R* script from this repository and store it in your working directory
3. Run the following R command

	```source("run_analysis.R")```
 
### Reading the final tidy set
 
 To read the *final_tidy_set.txt* included in this repository, which is the output of the *run_analysis.R* script
 
 1. Download the *final_tidy_set.txt* script from this repository and store it in your working directory
 2. Run the following R command

	```data <- read.table("final_tidy_set.txt", header = TRUE) ```
  
### Codebook of the final tidy set

A codebook for this dataset is included in this repository

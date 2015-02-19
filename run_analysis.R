## Getting and Cleaning Data on Coursera | Course Project
## This script assumes that data for this assignment is already downloaded and unzipped 
## This means that the folder "UCI HAR Dataset" should already be in the working directory


#Loading libraries 
library(reshape2)
library(plyr)
library(dplyr)

# Loading activity and column labels
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
features_labels <- as.character(features[,2])


### PREPARING THE TEST SETS

# Loading 
test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_activity <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Adding activities and subjects
test_activity_long <- join(test_activity,activities) # join preserves the order of rows while merging
test_activity_long <- test_activity_long[,2]
test_data <- cbind(test_data,test_activity_long,test_subject)
test_data$type <- "test" # keeping track that the data comes from the test set


### PREPARING THE TRAIN SETS (idem)

# Loading 
train_data <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_activity <- read.table("./UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Adding activities and subjects
train_activity_long <- join(train_activity,activities)
train_activity_long <- train_activity_long[,2]
train_data <- cbind(train_data,train_activity_long,train_subject)
train_data$type <- "train" # keeping track that the data comes from the train set


## MERGING THE 2 SETS AND SUBSETTING THE MEAN AND STD COLUMNS

# Aligning column names
features_labels <- c(features_labels,"activity","subject","type")
names(test_data) <- features_labels
names(train_data) <- features_labels

# Merging the 2 sets
both_data <- rbind(test_data,train_data)

# Getting the indices of "mean()" and "std()" variables + the "activity" and "subject" variables
ind <- 1
for (i in 2:563) {
      if (grepl("mean()",features[i,2],fixed=T)==T | grepl("std()",features[i,2],fixed=T)==T ) 
      {ind <- c(ind,i)
      }
}
ind <- c(ind,length(features_labels)-2, length(features_labels)-1, length(features_labels)) # keeping the activity, subject and type columns in the set

# Subsetting those mean/std columns
both_data_sub <- both_data[,ind]


## EXPORTING A TIDY DATA SET (AVG OF EACH VARIABLE PER SUBJECT AND ACTIVITY) 

tidy_data_sub <- melt(both_data_sub[,-length(both_data_sub)], id.vars=c("subject","activity")) # we use a LONG tidy format
final <- tidy_data_sub %>% group_by(subject,activity,variable) %>% dplyr::summarize(mean = mean(value))
write.table(final,"final_tidy_set.txt") # Creating .txt file in the working directory
Getting and Cleaning Data Course Project Documentation


Purpose It describes the variables, the data, and any transformations or
work that is performed to clean up the data.

Location of Source Data

A full description of the data used in this project can be found at The
UCI Machine Learning Repository

The source data for this project can be found here.

Started with merging the data files into one dataset which would be
required later for analysis purposes. The following files have been read
firstly into separate files each:

x\_train.txt y\_train.txt subject\_train.txt x\_test.txt y\_test.txt
subject\_test.txt features.txt activity\_labels.txt Then merged the test
and train datasets into a single table with rbind function.

We pulled only the mean and standard deviation measurements from the
table. Using grep we extracted all mean and std data from the merged
dataset.

Set activity names in the data set Joined data subset with the
activityType table to include the descriptive activity names.

Set labels on the dataset with descriptive variable names The gsub
function was used to clean up the variable names having special
characters in between.

Create a second tidy data set having the average of each variable for
each activity and each subject. Using the aggregate function for the
variables a single table containing the averages and means was
created.(second_set.txt)

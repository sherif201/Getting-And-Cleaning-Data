library(plyr)

#Reading test Variables
x_test<-read.table("C://Users/7/My Documents/Getting and Cleaning data/UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("C://Users/7/My Documents/Getting and Cleaning data/UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("C://Users/7/My Documents/Getting and Cleaning data/UCI HAR Dataset/test/subject_test.txt")

# Reading training variables
x_train<-read.table("C://Users/7/My Documents/Getting and Cleaning data/UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("C://Users/7/My Documents/Getting and Cleaning data/UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("C://Users/7/My Documents/Getting and Cleaning data/UCI HAR Dataset/train/subject_train.txt")

#Reading feature vector
features<- read.table("C://Users/7/My Documents/Getting and Cleaning data/UCI HAR Dataset/features.txt")

#Reading activity labels
activitylabels<- read.table("C://Users/7/My Documents/Getting and Cleaning data/UCI HAR Dataset/activity_labels.txt")

#Merge train and test sets to create one set
x_data<-rbind(x_test,x_train)
y_data<-rbind(y_test,y_train)
subject_data<-rbind(subject_test,subject_train)

# get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
x_data <- x_data[, mean_and_std_features]
names(x_data) <- features[mean_and_std_features, 2]

# Use descriptive activity names to name the activities in the data set
y_data[, 1] <- activitylabels[y_data[, 1], 2]
names(y_data) <- "activity"

# Appropriately label the data set with descriptive variable names
names(subject_data) <- "subject"

# bind all the data in a single data set
all_data <- cbind(x_data, y_data, subject_data)

# creates a second, independent tidy data set with the average of each variable for each activity and each subject.
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages_data, "second_set.txt", row.name=FALSE)


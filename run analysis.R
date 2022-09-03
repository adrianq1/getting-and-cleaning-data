library(dplyr)
#
##loading test data

testurl1 <- "/Users/adrianquizhpi/Documents/learn:classes/coursera/datasets/UCI HAR Dataset/test/subject_test.txt"
testurl2 <-"/Users/adrianquizhpi/Documents/learn:classes/coursera/datasets/UCI HAR Dataset/test/X_test.txt"
testurl3 <- "/Users/adrianquizhpi/Documents/learn:classes/coursera/datasets/UCI HAR Dataset/test/y_test.txt"



subjectTest <- read.table(testurl1, col.names = "subject")


xTest <- read.table(testurl2)


yTest <- read.table(testurl3, col.names = "y")

##loading in training data

trainurl1 <-"/Users/adrianquizhpi/Documents/learn:classes/coursera/datasets/UCI HAR Dataset/train/subject_train.txt"
trainurl2 <- "/Users/adrianquizhpi/Documents/learn:classes/coursera/datasets/UCI HAR Dataset/train/X_train.txt"
trainurl3 <-"/Users/adrianquizhpi/Documents/learn:classes/coursera/datasets/UCI HAR Dataset/train/y_train.txt"

subjectTrain <- read.table(trainurl1,col.names = "subject")

xTrain <- read.table(trainurl2)

yTrain <- read.table(trainurl3,col.names = "y")

#combines data together to a singular data set
subject_data<- rbind(subjectTest,subjectTrain)
x_data<- rbind(xTest,xTrain)
y_data<- rbind(yTest,yTrain)

xNamesUrl <-"/Users/adrianquizhpi/Documents/learn:classes/coursera/datasets/UCI HAR Dataset/features.txt"
xNames <- read.table(xNamesUrl)

names(x_data) <- xNames$V2

combinedData <- cbind(y_data,subject_data,x_data)

combinedData <- combinedData %>% select(y,subject, contains("mean"), contains("std"))

#renames col and labels "activity" col
names(combinedData)[1] <- "activity"
names(combinedData)<-gsub("Acc", "Accelerometer", names(combinedData))
names(combinedData)<-gsub("Gyro", "Gyroscope", names(combinedData))
names(combinedData)<-gsub("BodyBody", "Body", names(combinedData))
names(combinedData)<-gsub("Mag", "Magnitude", names(combinedData))
names(combinedData)<-gsub("^t", "Time", names(combinedData))
names(combinedData)<-gsub("^f", "Frequency", names(combinedData))
names(combinedData)<-gsub("tBody", "TimeBody", names(combinedData),ignore.case = TRUE)
names(combinedData)<-gsub("-mean()", "-Mean", names(combinedData), ignore.case = TRUE)
names(combinedData)<-gsub("-std()", "-STD", names(combinedData), ignore.case = TRUE)
names(combinedData)<-gsub("-freq()", "-Frequency", names(combinedData), ignore.case = TRUE)

activitypath <- "/Users/adrianquizhpi/Documents/learn:classes/coursera/datasets/UCI HAR Dataset/activity_labels.txt"
activityLabels <- read.table(activitypath)

combinedData$activity <- activityLabels$V2[combinedData$activity]

#names(combinedData)

#finds average of variables, for each activity adn subjects
combinedData %>% group_by(activity,subject) %>% summarise_all(funs(mean))


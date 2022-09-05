# getting-and-cleaning-data 

## purpose :
the purpose of this project is to collect and clean data for later analysis. The data that is used is Human activity recognition used by smart phones.

## preparations: 
- used library(dplyr) to use dplyr for later use
- data is downloaded from this file and stored into pc: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- created a variable and stored the path for the data used 

## cleaning and fixing data
- rbind() and cbind() are used to combine all the data together to make one big dataset, each test and train data are combined with cbind() as they are all column 
- test and train data are combined onto each other using rbind()
- only show col that contain  "mean" or "STD"
- renamed the names of col for easy viewing
- imported the labels for activities 
- activity data is replaced with labels making it more readable
- used group_by to group data by activity and subject, then found the mean of all col using summerise_all() and funs(mean)

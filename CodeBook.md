# code book for analysis.r

testurl1, testurl2, testurl3: paths for data in "test" folder
trainurl1, trainurl2, trainurl3: path for data in "train" folder
xtest, xtrain: getting x train and x test data in folders
ytrain, ytest: stored the data in ytrain and y test in folders
xnames, xnamesurl: path and names for columns
combineddata: all data combined into one dataset
activitypath acticitylabels: path and labels for activities
combinedData %>% group_by(activity,subject) %>% summarise_all(funs(mean)) : groups data nad finds mean of all col by group

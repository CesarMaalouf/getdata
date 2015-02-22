# The datasets should be under this path
filePathRoot <- "./UCI HAR Dataset"
filePathOutput1 <- "./tidy1.csv" #step 4 output
filePathOutput2 <- "./tidy2.csv" #step 5 output

# Lets first read the test and train data sets
filePathTest <- paste(filePathRoot, "test/X_test.txt", sep="/")
filePathTrain <- paste(filePathRoot, "train/X_train.txt", sep="/")

dfTest <- read.table(filePathTest)
dfTrain <- read.table(filePathTrain)

# Next read the activities for these data sets
filePathTestActivities <- paste(filePathRoot, "test/y_test.txt", sep="/")
filePathTrainActivities <- paste(filePathRoot, "train/y_train.txt", sep="/")

dfTestActivities <- read.table(filePathTestActivities)
dfTrainActivities <- read.table(filePathTrainActivities)

# And the subjects for these activities sets
filePathTestSubjects <- paste(filePathRoot, "test/subject_test.txt", sep="/")
filePathTrainSubjects <- paste(filePathRoot, "train/subject_train.txt", sep="/")

dfTestSubjects <- read.table(filePathTestSubjects)
dfTrainSubjects <- read.table(filePathTrainSubjects)

# Lets read the feature vector labels
filePathFeatures <- paste(filePathRoot, "features.txt", sep="/")

dfFeatures <- read.table(filePathFeatures, sep=" ")

# And now select only those that have the word 'std' or 'mean' in them
dfStd <- dfFeatures[grep("std", dfFeatures$V2, ignore.case=FALSE),]
dfMean <- dfFeatures[grep("mean", dfFeatures$V2, ignore.case=FALSE),]

# Lets subset the data sets with the index of the label for 'std' and 'mean'
dfTestMean <- dfTest[,dfMean[,1]]
dfTestStd <- dfTest[,dfStd[,1]]
  
dfTrainMean <- dfTrain[,dfMean[,1]]
dfTrainStd <- dfTrain[,dfStd[,1]]

# Lets change the column names of the subsetted data frames with the corresp
# labels for 'std' and 'mean'
colnames(dfTestMean) <- dfMean[,2]
colnames(dfTestStd) <- dfStd[,2]

colnames(dfTrainMean) <- dfMean[,2]
colnames(dfTrainStd) <- dfStd[,2]

# Lets construct a new data frame dfFinal that has all the subjects as first col
# and activity as 2nd column. Also, lets vertically concatenate
# the test and train data sets.
dfFinal <- data.frame(Subject=c(dfTestSubjects[,1], dfTrainSubjects[,1]))
dfFinal["Activity"] <- c(dfTestActivities[,1], dfTrainActivities[,1])

# And add the columns from the mean and std subsetted data frames. Also,
# vertically concatenate the test and train data sets i.e. do rbind.
dfFinal <- cbind(dfFinal, rbind(dfTestMean, dfTrainMean), rbind(dfTestStd, dfTrainStd))

# And lets map the Activity numeric values to the text label
dfFinal$Activity[dfFinal$Activity == '1'] <- 'WALKING' 
dfFinal$Activity[dfFinal$Activity == '2'] <- 'WALKING_UPSTAIRS' 
dfFinal$Activity[dfFinal$Activity == '3'] <- 'WALKING_DOWNSTAIRS' 
dfFinal$Activity[dfFinal$Activity == '4'] <- 'SITTING' 
dfFinal$Activity[dfFinal$Activity == '5'] <- 'STANDING'
dfFinal$Activity[dfFinal$Activity == '6'] <- 'LAYING' 

# write to file. This is step 4 output
write.csv(dfFinal, file=filePathOutput1, row.names=FALSE)

# Take the aggregate of values per subject per activity
result <- aggregate(. ~ Subject + Activity, data=dfFinal, FUN=mean)

# Write to file. This is step 5 output.
write.csv(result, file=filePathOutput2, row.names=FALSE)

# ship it!
#Script - run_analysis.R

The script should be run from the directory outside the 'UCI HR Dataset' directory.

Example:
```
cd c:/getdata

dir 

c:/getdata/UCI HR Dataset
c:/getdata/run_analysis.R
```

Open Rstudio and do following,
```
setwd('c:/getdata')
source('c:/getdata/run_analysis.R')
```

Now go back to command window
```
cd c:/getdata

dir 

c:/getdata/UCI HR Dataset
c:/getdata/run_analysis.R
c:/getdata/tidy1.csv
c:/getdata/tidy2.csv
```
You can open the run_analysis.R script and modify the top 4 variable declarations to point to your location of UCI HR Dataset directory - 

```
filePathRoot <- "./UCI HAR Dataset"
filePathOutput1 <- "./tidy1.csv" #step 4 output
filePathOutput2 <- "./tidy2.csv" #step 5 output
```

After sourcing this script, you should get two files tidy1.csv and tidy2.csv which corresponds to the outputs required in step 4 and 5 of the project problem definition.

tidy2.csv is the data set uploaded to the Coursera peer assessment course page.

The script has comments in it that explains how the script has been implemented.



# Codebook
## Overview
There are 81 columns in all in the data-set. The data-set is for the average of the means and standard deviations of various accelerometer and gyroscope readings and their computed values. Here are the various columns and their descriptions.

Note that I have included meanFreq columns as this appears to be a mean. If this is not expected, pls ignore the meanFreq columns.

## General columns
The first 2 critical columns are for the subject and activity.

1. Subject - The numeric id corresponding to the subject carrying out the experiments. There were 30 individuals and hence the values are from 1 to 30.
2. Activity - The activity conducted by a subject. There are 6 activities WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

## Signal columns
Rest of the columns follow the following format. Each column value represents the average of all the mean or standard deviation readings for that Subject for that Activity for that column signal. 

### Key for the format of the remaining column names

```
t = time domain
f = frequency domain signal obtained by doing FFT of the singals

BodyAcc = Body linear acceleration signal in 3 axis separated from the accelerometer readings
GravityAcc = Gravity Acceleration signal in 3 axis separated from the accelerometer readings

BodyAccJerk = Body linear acceleration derived in time to obtain Jerk signals

BodyGyro = Body gyroscope readings in 3 axis that gives the angular velcity
BodyGyroJerk = Angular velocity derived in time to obtain Jerk Signals

BodyAccMag, GravityAccMag, BodyAccJerkMag, BodyGyroMag, BodyGyroJerkMag = Euclidean norm of the these 3 dimensional signals

X, Y, Z = the 3 axis signals
mean() = mean of the signals
std() = standard deviation of the signals
```

### Time domain column names (mean values)
Each column value represents the average of all the values of that signal type for each subject for each activity.
```
tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z

tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z

tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z

tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z

tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z

tBodyAccMag-mean()
tGravityAccMag-mean()
tBodyAccJerkMag-mean()
tBodyGyroMag-mean()
tBodyGyroJerkMag-mean()
```

### Frequency domain column names (mean values)
Each column value represents the average of all the values of that signal type for each subject for each activity.
```
fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z

fBodyAcc-meanFreq()-X
fBodyAcc-meanFreq()-Y
fBodyAcc-meanFreq()-Z

fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z

fBodyAccJerk-meanFreq()-X
fBodyAccJerk-meanFreq()-Y
fBodyAccJerk-meanFreq()-Z

fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z

fBodyGyro-meanFreq()-X
fBodyGyro-meanFreq()-Y
fBodyGyro-meanFreq()-Z

fBodyAccMag-mean()
fBodyAccMag-meanFreq()
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-meanFreq()
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-meanFreq()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-meanFreq()
```

### Time domain column names (standard deviation columns)
Each column value represents the average of all the values of that signal type for each subject for each activity.
```
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z

tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z

tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z

tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z

tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z

tBodyAccMag-std()
tGravityAccMag-std()
tBodyAccJerkMag-std()
tBodyGyroMag-std()
tBodyGyroJerkMag-std()
```

### Frequency domain column names (standard deviation values)
Each column value represents the average of all the values of that signal type for each subject for each activity.
```
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z

fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z

fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z

fBodyAccMag-std()
fBodyBodyAccJerkMag-std()
fBodyBodyGyroMag-std()
fBodyBodyGyroJerkMag-std()
```

### Running the script
It is assume the dataset is downloaded and unzip into the current directory of R environment.
The script can be directly loaded into the R script to run.

###Code book
subject - a group of 30 volunteers within an age bracket of 19-48 years
          1=19yr,2=20yr,3=21yr ... till 30=48yr

activity - Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
          WALKING, 
		  WALKING_UPSTAIRS, 
		  WALKING_DOWNSTAIRS, 
		  SITTING, STANDING, 
		  LAYING

hese signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
The set of variables that were estimated (and kept for this assignment) from these signals are:

mean(): Mean value
std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

features are normalized and bounded within [-1,1].


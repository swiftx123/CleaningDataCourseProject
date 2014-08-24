##Constant variables
dataset_directory <- './UCI HAR Dataset'
tidy_txt_file <- './tidy_dataset.txt'
tidy_avgs_txt_file <- './tidy_avgs_dataset.txt'

##It is assume the dataset zip file is unzip into the directory 'UCI HAR Dataset' in the current working directory

# Read activity labels into variable
activity_label <- read.table(paste(dataset_directory, 'activity_labels.txt', sep = '/'),header = FALSE)
names(activity_label) <- c('id', 'name')

# Read the feature label
feature_label <- read.table(paste(dataset_directory, 'features.txt', sep = '/'),header = FALSE)
names(feature_label) <- c('id', 'name')

# Read the plain data files, assigning sensible column names
x_train_data <- read.table(paste(dataset_directory, 'train', 'X_train.txt', sep = '/'),header = FALSE)
names(x_train_data) <- feature_label$name


y_train_data <- read.table(paste(dataset_directory, 'train', 'y_train.txt', sep = '/'),header = FALSE)
names(y_train_data) <- c('activity')


subject_train <- read.table(paste(dataset_directory, 'train', 'subject_train.txt',sep = '/'),header = FALSE)
names(subject_train) <- c('subject')


x_test_data <- read.table(paste(dataset_directory, 'test', 'X_test.txt', sep = '/'),header = FALSE)
names(x_test_data) <- feature_label$name

y_test_data <- read.table(paste(dataset_directory, 'test', 'y_test.txt', sep = '/'),header = FALSE)
names(y_test_data) <- c('activity')

subject_test <- read.table(paste(dataset_directory, 'test', 'subject_test.txt',sep = '/'),header = FALSE)
names(subject_test) <- c('subject')

# 1) Merges the training and the test sets to create one data set.
X <- rbind(x_train_data, x_test_data)
y <- rbind(y_train_data, y_test_data)
#Combine the subject (train,test) set into single set
subject <- rbind(subject_train, subject_test)

# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
X <- X[, grep('mean|std', feature_label$name)]

# 3) Uses descriptive activity names to name the activities in the data set
y$activity <- activity_label[y$activity,]$name

# Merge partial data sets together
tidy_dataset <- cbind(subject, y, X)


## Write to csv file
# 1) Merges the training and the test sets to create one data set.
write.table(tidy_dataset, tidy_txt_file,row.name=FALSE)


# Compute the averages grouped by subject and activity
tidy_dataset_average <- aggregate(tidy_dataset[, 3:dim(tidy_dataset)[2]],
                                list(tidy_dataset$subject,
                                     tidy_dataset$activity),
                                mean)
# 4) Appropriately labels the data set with descriptive variable names. 
names(tidy_dataset_average)[1:2] <- c('subject', 'activity')

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
write.table(tidy_dataset_average, tidy_avgs_txt_file,row.name=FALSE)
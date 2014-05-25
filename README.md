## 1. Read in raw data and descriptive files
* read in raw training data and descriptors
* use names in features.txt to label df_train
* add activity labels (y_train.txt) to the left of df_train
* add IDs of training subjects (subject_train.txt) to the left of df_train
* merge activity names (activity_labels.txt) by "Act_label" in df_train
* remove activity labels (y_train.txt) because we already have descriptive activity names (activity_labels.txt)
* label subject group as "Train"
* repeat the above steps for the raw test data

## 2. Merges the training and the test sets to create one data set.
* row-bind the two data frame

## 3. Extracts only the measurements on the mean and standard deviation for each measurement. 
* select variables with mean() or std() in their names

# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names. 
* already applied descriptive activity names in step 1
* convert variable names to lowercase

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
* need "reshape2" package
* melt df into "long-format"
* for each subject, take average of each variable for each activity (variable), and cast melted df into "wide-format"
* sort tidyData based on subjects and activities, then remove row names
* export to txt (tidy.txt)

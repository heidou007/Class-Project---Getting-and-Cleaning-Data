## 1. Read in raw data and descriptive files
* read in raw training data and descriptors
* use names in features.txt to label df_train
* add activity labels in y_train.txt to the left of df_train
* add IDs of training subjects (subject_train.txt) to the left of df_train
* merge activity names (activity_labels.txt) by "Act_label" in df_train
* remove activity labels (y_train.txt) because we already have descriptive activity names
* label subject group as "training"
* repeat the above steps for the raw test data

## 2. Merges the training and the test sets to create one data set.

## 3. Extracts only the measurements on the mean and standard deviation for each measurement. 

## 4. Change variable names to lower case

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
* melt df into "long-format"
* take average of each variable (with the same group/activities/subjects), and cast melted df into "wide-format"
* sort tidyData based on subjects and activities, then remove row names
* export to txt

## The variables
* "group": 70% of the subjects are in "Train" group, 30% in "Test" group
* "activites": each subject performed 6 different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING)
* "subjects": 30 subjects in the study labeled as 1 - 30

variables in column 4 - 69: 
* prefix 't' to denote time
* prefix 'f' to indicate frequency domain signals produced by Fast Fourier Transform
* 'body': body signals
* 'gravity': gravity signals
* 'acc': data collected from the accelerometer
* 'gyro': data collected from the gyroscope
* 'jerk': body linear acceleration and angular velocity
* 'mag': magnitude of the signals calculated using the Euclidean norm
* 'mean': average value
* 'std': standard deviation
* 'x/y/z': 3-axial signals in the X, Y and Z directions


## The files

'README.txt'

'features_info.txt': Shows information about the variables used on the feature vector.

'features.txt': List of all features.

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.

'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

## The methods
# 1. Read in raw data and descriptive files
* read in raw training data (X_train.txt) and descriptors
* use names in features.txt to label df_train
* add activity labels (y_train.txt) to the left of df_train
* add IDs of training subjects (subject_train.txt) to the left of df_train
* merge activity names (activity_labels.txt) by "Act_label" in df_train
* remove activity labels (y_train.txt) because we already have descriptive activity names (activity_labels.txt)
* label subject group as "Train"
* repeat the above steps for the raw test data

# 2. Merges the training and the test sets to create one data set.
* row-bind the two data frame

# 3. Extracts only the measurements on the mean and standard deviation for each measurement. 
* select variables with mean() or std() in their names

# 4. Uses descriptive activity names to name the activities in the data set
* already applied descriptive activity names in step 1

# 5. Appropriately labels the data set with descriptive activity names. 
* convert variable names to lowercase

# 6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
* need "reshape2" package
* melt df into "long-format"
* for each subject, take average of each variable for each activity (variable), and cast melted df into "wide-format"
* sort tidyData based on subjects and activities, then remove row names
* export to txt (tidy.txt)

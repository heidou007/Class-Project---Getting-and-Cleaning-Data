
## read in raw training data and descriptors
feature <- read.table("features.txt")
activity <- read.table("activity_labels.txt")
sub_train <- read.table("./train/subject_train.txt")
y_train <- read.table("./train/y_train.txt")
df_train <- read.table("./train/X_train.txt")

## use names in features.txt to label df_train
names(df_train) <- feature[,2]

## add activity labels in y_train.txt to the left of df_train
df_train <- cbind(y_train, df_train)
names(df_train)[1] <- "Act_label"

## add IDs of training subjects (subject_train.txt) to the left of df_train
df_train <- cbind(sub_train, df_train)
names(df_train)[1] <- "Subjects"

## merge activity names (activity_labels.txt) by "Act_label" in df_train
df_train <- merge(activity, df_train, by.x = "V1", by.y = "Act_label")

## remove activity labels (y_train.txt) because we already have descriptive activity names
df_train <- df_train[, !(names(df_train) %in% c("V1"))]
names(df_train)[1] <- "Activities"

groupTrain <- data.frame(rep("Train", nrow(sub_train)))
names(groupTrain) = "Group"
df_train <- cbind(groupTrain, df_train)

###############################################

## read in raw test data and descriptors
sub_test <- read.table("./test/subject_test.txt")
y_test <- read.table("./test/y_test.txt")
df_test <- read.table("./test/X_test.txt")

## use names in features.txt to label df_test
names(df_test) <- feature[,2]

## add activity labels in y_test.txt to the left of df_test
df_test <- cbind(y_test, df_test)
names(df_test)[1] <- "Act_label"

## add IDs of test subjects (subject_test.txt) to the left of df_test
df_test <- cbind(sub_test, df_test)
names(df_test)[1] <- "Subjects"

## merge activity names (activity_labels.txt) by "Act_label" in df_test
df_test <- merge(activity, df_test, by.x = "V1", by.y = "Act_label")

## remove activity labels (y_test.txt) because we already have descriptive activity names
df_test <- df_test[, !(names(df_test) %in% c("V1"))]
names(df_test)[1] <- "Activities"

groupTest <- data.frame(rep("Test", nrow(sub_test)))
names(groupTest) = "Group"
df_test <- cbind(groupTest, df_test)

#######################################

# 1. Merges the training and the test sets to create one data set.
df <- rbind(df_train, df_test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
interested <- grep("(mean)\\(\\)|(std)\\(\\)", names(df))
df <- df[, c(1, 2, 3, interested)]

# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names. 
names(df) <- tolower(gsub("-|\\(|\\)", "", names(df)))

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
library(reshape2)

## melt df into "long-format"
dfMelt <- melt(df, id = names(df)[1:3], measure.vars = names(df)[4:69])

## take average of each variable (with the same group/activities/subjects), and cast melted df into "wide-format"
dfData <- dcast(dfMelt, ... ~ variable, fun.aggregate = mean)

## sort tidyData based on subjects and activities, then remove row names
tidyData <- dfData[order(dfData$subjects, dfData$activities), ]
row.names(tidyData) <- NULL

## export to txt
write.table(tidyData, "tidy.txt")

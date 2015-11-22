## Loading dataframes
activitylabels <- read.table("./activity_labels.txt")
features <- read.table("./features.txt")
subject <- rbind(read.table("./train/subject_train.txt"), read.table("./test/subject_test.txt"))
y <- rbind(read.table("./train/y_train.txt"), read.table("./test/y_test.txt"))
x <- rbind(read.table("./train/x_train.txt"), read.table("./test/x_test.txt"))

## Merge the activitylabels data frame with the y data frame to get the Activity Names
y = merge(y,activitylabels, by.x = "V1", by.y = "V1" )

## Renaming the variables of the subject and y data frames to improve readability
names(y) <- c("ActivityID","ActivityName")
names(subject) <- "subject"

## Updating the names of the variables in the data frame x using the rows of the data frame "features"
names(x) <- as.vector(features$V2)

## Binding the data frames x, y, and subject in a single staging object
stagingframe <- cbind(y, subject, x)

## List with the name of  the columns that will be kept in the data frame. Includes: ActivityID, ActivitName, 
## Subject and variables related to mean values and standard deviations.
variablelist <- grep("mean\\()|std\\()|subject|Activity",names(stagingframe), value = TRUE)

## Reduces the variables in the staging data frame using the list created in the previous step
stagingframe <- stagingframe[variablelist]

## Formatting of the variables names in order to increase readability
names(stagingframe) <- gsub("\\-|\\(|\\)","",names(stagingframe))
names(stagingframe) <- gsub("^t","Time",names(stagingframe))
names(stagingframe) <- gsub("^f","Frequency",names(stagingframe))
names(stagingframe) <- gsub("Acc","Accelerometer",names(stagingframe))
names(stagingframe) <- gsub("Gyro","Gyroscope",names(stagingframe))
names(stagingframe) <- gsub("Mag","Magniture",names(stagingframe))
names(stagingframe) <- gsub("mean","Mean",names(stagingframe))
names(stagingframe) <- gsub("std","StandardDeviation",names(stagingframe))

## frame that stores the mean of the variables aggregated by ActivityID, ActivityName and subject 
finalframe <-  aggregate(.~ActivityID+ActivityName+subject, stagingframe, mean)

## Export the data frame to a tidy data file
write.table(finalframe, file = "tidydata.txt", row.names = FALSE, quote = FALSE)

## clearing workspace
rm(list = ls())
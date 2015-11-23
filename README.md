# Project-GetData-034
#
This project uses a single script named run_analysis.R which creates a tidy data file 

(tidydata.txt) that aggregates the data stored in the Dataset UCI HAR and calculates the 

mean value of 66 variables extracted from this dataset.

## How to use
In order to successfully execute the script, perform the following steps:
 
* Download the dataset UCI HAR from the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Unzip the files in a working folder in your file system.
* Add the run_analysis.R script in the root folder where you placed the unzipped dataset
* Start R studio and change the working directory to the root directory where you placed the 

files and the script.
* Execute the script in Rstudio. After completion, look for the file named tidydata.txt in 

the working directory.

## What it does
The run_analysis.R script looks for the following files in the unzipped folder:
* activity_labels.txt 
* features.txt
* /train/subject_train.txt
* /test/subject_test.txt
* /train/x_train.txt
* /test/y_test.txt
* /train/y_train.txt
* /test/y_test.txt

Then, the script merges the test and training datasets. 3 dataframes are created as a result. Another 2 dataframes are also created for activity labels and features (variable names).

The script joins the data from the activity_labels.txt file with the data frame created from y_train.txt and y_test.txt. This procedure assigns a label to each activity in the activities data frame (y data frame).

By using the data in the features.txt file, the script assigns new names to the variables in the data frame created from x_train.txt and x_test.txt (x data frame).

The script binds the data from the subject, the activities frame (y) and the variables frame (x) in a single object.

The script filters the dataframe and reduces the columns. The script keeps just the variables that are related to the mean and the standard deviation of the base dataset. This shrinks the dataframe to 66 variables from the original x dataset, plus the variables ActivityID, ActivityName and the Subject (69 variables in total).

The script then changes the names of the variables to descriptive variable names.

The script creates a dataframe that stores the mean of the 66 variables extracted from x, aggregated by ActivityID, ActivityName and subject. This dataframe is exported to a text file named tidydata.txt in the working directory. Finally, the script clears the working space.
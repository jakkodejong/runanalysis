# Recipe for data tidying as in 'run_analysis.R'

The used dataset was obtained from UCI (reference: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.)

## R-version and packages used:

* R-version x64 3.3.2
* used packages: data.table

## File output:

The R-script 'run_analysis.R' outputs two data frames:

* 'data_total' contains a tidy dataset with the test and train data combined, with added columns for subject_id and activity_label.

* 'data_av' contains a tidy dataset with the average data of 'data_total', averaged per unique combination of subject_id and activity_label.

## Recipe:

* First, I manually downloaded and unzipped the dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* 'run_analysis.R' first loads the data from the test and train groups into memory from "./UCI HAR Dataset/test/X_test.txt" and "./UCI HAR Dataset/train/X_train.txt". 
It also loads a comprehensive label for each variable from "./UCI HAR Dataset/features.txt" .
The subject-id and activity-id for each entry in the dataset are obtained from "./UCI HAR Dataset/train/subject_train.txt", "./UCI HAR Dataset/test/subject_test.txt", "./UCI HAR Dataset/test/y_test.txt" and "./UCI HAR Dataset/train/y_train.txt".
A table linking activity-id to a comprehensive activity-label is obtained from "./UCI HAR Dataset/activity_labels.txt".

* The script then adds the subject_id and activity_id to the train an test sets and finally adds them together into dataframe 'data_total'

* The columns of data_total are named comprehensively.

* The activity_id is converted into a more comprehensive activity_label

* A subset of data_total is selected with only the columns that contains data about means or standard deviations of variables.
This is done with regular expressions in combination with the grep() function.

* Of this subset, all variables are averaged for each combination of subject_id and activity_label.

Hopefully this explanation was clear.

Kind regards,

Jakko de Jong

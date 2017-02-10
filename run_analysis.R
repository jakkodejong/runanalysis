# Load datasets into memory
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_labels <- read.table("./UCI HAR Dataset/test/y_test.txt")
train <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_labels <- read.table("./UCI HAR Dataset/train/y_train.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

# Merge data frames into a single data set
test_total <- cbind(test, subject_test, test_labels)
train_total <- cbind(train, subject_train, train_labels)
data_total <- rbind(test_total, train_total)

# Name columns of complete dataset with names retrieved from 'features.txt'
col_names <- as.character(features[,2])
col_names <- append(col_names,c("subject","label"))
names(data_total) <- col_names

# Change activity label into descriptive name using activity_labels
data_total$label <- sapply(data_total$label,function(x) activity_labels[x,2])

# Find all variables with 'mean' or 'std' in the columnname and select this subset of data_total.
colnums <- grep("mean|std|subject|label",names(data_total))
data_subset <- data_total[,colnums]

# Load data.table package for memory efficient averaging over data.
library(data.table)

# Create data.table to store averaged data.
data_av <- data.table(data_subset)

# aggregate by 'subject' and 'label' and average this data for every column other than 'subject' and 'label'.
data_av <- data_av[, lapply(.SD,mean), by=list(subject,label)]
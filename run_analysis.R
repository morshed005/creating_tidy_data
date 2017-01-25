## downloading and unzipping the dataset
if(!dir.exists("./data")){dir.create("./data")}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url = fileURL, destfile = "./data/Dataset.zip")

#unzip the downloaded file
unzip(zipfile = "./data/Dataset.zip", exdir = "./data")

## reading data files

# reading training data
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

#reading testing data
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# reading feature vector:
features <- read.table('./data/UCI HAR Dataset/features.txt')

# Reading activity labels:
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

## assigning column names

colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

## big merging

merged_train <- cbind(subject_train, y_train, x_train)
merged_test <- cbind(subject_test, y_test, x_test)
DataSet_1 <- rbind(merged_train, merged_test)

## extracting selective measurements

columnNames <- colnames(x = DataSet_1)
select_indexes <- grep(pattern = "(mean|std)+\\(+\\)", x = columnNames)
DataSet_2 <- DataSet_1[,c(1,2,select_indexes)]

## using descriptive activity names
descriptive_activties <- as.character(activityLabels$activityType)
DataSet_3 <- DataSet_2
DataSet_3[,2] <- descriptive_activties[ DataSet_2[,2] ]
names(DataSet_3)[2] <- "activityType"

## descriptive variable names

# variables are already in descriptive form
DataSet_4 <- DataSet_3

##  data set with the average of each variable for each activity and each subject.

DataSet_5 <- aggregate(. ~activityType + subjectId, DataSet_4, mean)
DataSet_5 <-  DataSet_5[c("subjectId", "activityType", names(DataSet_5)[-c(1:2)])]

## writing the tidy data set to a text file

write.table(x = DataSet_5, file = "tidy_data.txt", row.names = F)

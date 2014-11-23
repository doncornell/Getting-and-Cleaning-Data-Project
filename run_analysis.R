library("plyr")

# STEP 1: MERGE THE TRAINING AND TEST DATA SETS TO CREATE ONE DATA SET

# 1.1 read in subject IDs, activity labels, and data for both test and train datasets
X_test <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
y_test <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
subject_test <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
X_train <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
y_train <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
subject_train <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")

# 1.2 combine by columns the three newly-created data.frames for both test and train
test_data <- cbind(subject_test, y_test, X_test, stringsAsFactors = FALSE)
train_data <- cbind(subject_train, y_train, X_train, stringsAsFactors = FALSE)

# 1.3 combine by rows to create the merged data.frame
mdf <- rbind(test_data, train_data)

# STEP 2: EXTRACT JUST THE MEASUREMENTS ON THE MEAN AND S.D. FOR EACH MEASUREMENT

# 2.1: read in the features.txt file to use as column names
features <- read.table(".\\UCI HAR Dataset\\features.txt")
# include colnames for the first two columns, created when the three datasets were cbinded
mdf_columns <- vector(mode='character')
mdf_columns[1] <- 'ID'
mdf_columns[2] <- 'Activity'

# 2.2 use the values of the features dataset as column names
mdf_columns <- append(mdf_columns, as.vector(features[,2]))
colnames(mdf) <- mdf_columns

# 2.3 filter out just the columns whose colname contains 'mean' or 'std'
use_column <- grepl('mean',mdf_columns[1:563]) | grepl('std',mdf_columns[1:563])
use_column[1] <- TRUE
use_column[2] <- TRUE
mdf_filtered <- mdf[,use_column]

# STEP 3: USE DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATASET
mdf_filtered[,2] <- ifelse(mdf_filtered[,2]==1, "WALKING", 
              ifelse(mdf_filtered[,2]==2, "WALKING_UPSTAIRS",
                     ifelse(mdf_filtered[,2]==3, "WALKING_DOWNSTAIRS",
                            ifelse(mdf_filtered[,2]==4, "SITTING",
                                   ifelse(mdf_filtered[,2]==5, "STANDING",
                                          ifelse(mdf_filtered[,2]==6, "LAYING",NA))))))

# STEP 4: LABEL THE DATASET WITH DESCRIPTIVE VARIABLE NAMES
# see step 2.2


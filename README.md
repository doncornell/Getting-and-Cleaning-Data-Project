Getting-and-Cleaning-Data-Project
=================================
#### STEP 1: MERGE THE TRAINING AND TEST DATA SETS TO CREATE ONE DATA SET

###### Note: This code assumes that the Samsung data is in the working directory. If this is not the case,
###### please see the course project instructions for downloading the data.

##### 1.1 read in subject IDs, activity labels, and data for both test and train datasets
##### 1.2 combine by columns the three newly-created data.frames for both test and train
##### 1.3 combine by rows to create the merged data.frame

#### STEP 2: EXTRACT JUST THE MEASUREMENTS ON THE MEAN AND S.D. FOR EACH MEASUREMENT

##### 2.1: read in the features.txt file to use as column names
##### include colnames for the first two columns, created when the three datasets were cbinded
##### 2.2 use the values of the features dataset as column names
##### 2.3 filter out just the columns whose colname contains 'mean' or 'std'

#### STEP 3: USE DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATASET

##### Iteratiely replace activity codes with activity names.

#### STEP 4: LABEL THE DATASET WITH DESCRIPTIVE VARIABLE NAMES

###### Note: this was done in step 2.2

#### STEP 5: CREATE A TIDY DATASET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT

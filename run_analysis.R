library(data.table)
library(reshape2)

#A. read the files
x_train <- read.table("I:/data/R/data1/UCI HAR Dataset/train/X_train.txt", skip=1, quote="\"")
View(x_train)
y_train <- read.table("I:/data/R/data1/UCI HAR Dataset/train/y_train.txt", header=T,colClasses="character" , quote="\"")
subject_train <- read.table("I:/data/R/data1/UCI HAR Dataset/train/subject_train.txt", header=T, quote="\"")
x_test <- read.table("I:/data/R/data1/UCI HAR Dataset/test/X_test.txt", skip=1, quote="\"")
y_test <- read.table("I:/data/R/data1/UCI HAR Dataset/test/y_test.txt", header=T,colClasses="character", quote="\"")
subject_test <- read.table("I:/data/R/data1/UCI HAR Dataset/test/subject_test.txt", header=T, quote="\"")
activity <- read.table("I:/data/R/data1/UCI HAR Dataset/activity_labels.txt", header=T,colClasses="character", quote="\"")
#1. merge the training and test sets and resctructure the data
xy_test = cbind(y_test, x_test)
xy_train = cbind(y_train, x_train)
traintest = rbind(xy_train,xy_test)
tt1melt = melt(traintest, id=c("X5"),measure.vars=c("V1","V2","V3","V4","V5","V6","V7","V8","V9","V10","V11"
                                                    ,"V12","V13","V14","V15","V16","V17","V18","V19","V20","V21"
                                                    ,"V22","V23","V24","V25","V26","V27","V28","V29","V30","V31"
                                                    ,"V32","V33","V34","V35","V36","V37","V38","V39","V40","V41"
                                                    ,"V42","V43","V44","V45","V46","V47","V48","V49","V50","V51"
                                                    ,"V52","V53","V54","V55","V56","V57","V58","V59","V60","V61"
                                                    ,"V62","V63","V64","V65","V66","V67","V68","V69","V70","V71"
                                                    ,"V72","V73","V74","V75","V76","V77","V78","V79","V80","V81"
                                                    ,"V82","V83","V84","V85","V86","V87","V88","V89","V90","V91"
                                                    ,"V92","V93","V94","V95","V96","V97","V98"))
#2. Extracts the measurements on mean and sd
tt1cast = dcast(tt1melt,X5 ~ variable, mean)
#3,4. The descriptive activity names are added and labelled
tt1cast[1,1] = "WALKING"
tt1cast[2,1] = "WALKING_UPSTAIRS"
tt1cast[3,1] = "WALKING_DOWNSTAIRS"
tt1cast[4,1] = "SITTING"
tt1cast[5,1] = "STANDING"
tt1cast[6,1] = "LAYING"
#5.  Creates the second tidy data set
write.table(tt1cast, "run_analysis_data.txt")

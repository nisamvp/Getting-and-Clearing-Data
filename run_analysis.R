#1st Assignemnt

library(plyr)
library(dplyr)
yTest<-read.table("test/y_test.txt", sep="")
colnames(yTest)<-c("activity")
features<-read.table("features.txt")
XTest<-read.table("test/X_test.txt", sep="")
colnames(XTest) <- t(features[2])
testSubject<-read.table("test/subject_test.txt")
colnames(testSubject)<-c("subject")
testData<-cbind(XTest,yTest,testSubject)

yTrain<-read.table("train/y_train.txt", sep="")
colnames(yTrain)<-c("activity")
XTrain<-read.table("train/X_train.txt", sep="")
colnames(XTrain) <- t(features[2])
trainSubject<-read.table("train/subject_train.txt")
colnames(trainSubject)<-c("subject")
trainData<-cbind(XTrain,yTrain,trainSubject)
mergedData<-rbind(testData,trainData)

#2nd Assignment

Mean <- grep("mean()", names(mergedData), value = FALSE, fixed = TRUE)
#In addition, we need to include 555:559 as they have means and are associated with the gravity terms
Mean <- append(Mean, 471:477)
MeanMatrix <- mergedData[Mean]

# For STD
STD <- grep("std()", names(Master), value = FALSE)
InstrumentSTDMatrix <- Master[STD]

#3rd Assignment

mergedData$activity <- as.character(mergedData$activity)
mergedData$activity[mergedData$activity == 1] <- "Walking"
mergedData$activity[mergedData$activity == 2] <- "Walking Upstairs"
mergedData$activity[mergedData$activity == 3] <- "Walking Downstairs"
mergedData$activity[mergedData$activity == 4] <- "Sitting"
mergedData$activity[mergedData$activity == 5] <- "Standing"
mergedData$activity[mergedData$activity == 6] <- "Laying"
mergedData$activity <- as.factor(mergedData$activity)

#4th Assignment

names(mergedData) <- gsub("Acc", "Accelerator", names(mergedData))
names(mergedData) <- gsub("Mag", "Magnitude", names(mergedData))
names(mergedData) <- gsub("Gyro", "Gyroscope", names(mergedData))
names(mergedData) <- gsub("^t", "time", names(mergedData))
names(mergedData) <- gsub("^f", "frequency", names(mergedData))




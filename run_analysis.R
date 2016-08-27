## This script is designed to download, extract and clean data located at
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## First, we'll load the dplyr package,
## then download the data and read it into r.
library(dplyr)
## Let's look for the file first. If it doesn't exist, R will download it.
if(!file.exists("getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")){
      url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      download.file(url,dest="getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
}
data<-unzip("~/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
set<-grep("(test/[^I]|train/[^I]|features.txt)",data,value=T) # Filtering out the data we
                                                              # don't need. No variable names
                                                              # were given for the "Inertial
                                                              # Signals" sets, so they will
                                                              # not be included.
                                                              # We'll also need "features.txt"
                                                            
datlist<-lapply(set,read.table,stringsAsFactors=F) # Reading the data into a list
names(datlist[[2]])<-"Subject"            # Naming the Subject and Activity variables
names(datlist[[4]])<-"Activity"
names(datlist[[5]])<-"Subject"
names(datlist[[7]])<-"Activity"
names(datlist[[3]])<-datlist[[1]]$V2      # Using "features.txt" to name the columns of the 
names(datlist[[6]])<-datlist[[1]]$V2      # X_test and X_train sets
## Since we only want the measurements on the mean and standard deviation of each measurement, 
## we can use grep to get the row numbers we want, which will be the corresponding column numbers
## in the X_test and X-train sets.
mean_std<-grep("mean[^F]|std",datlist[[1]]$V2) ## Makes a vector of rows with "mean" and "std"
## the [^F] is to remove the columns with names that contain "meanFreq" and not just "mean"

X_test<-datlist[[3]][,mean_std]
X_train<-datlist[[6]][,mean_std]
Test<-cbind(datlist[[2]],datlist[[4]],X_test)
Train<-cbind(datlist[[5]],datlist[[7]],X_train)
Full_set<-rbind(Test,Train)
Full_set$Activity<-recode(Full_set$Activity,        # Replacing the values of "Activity"
                          "1"="Walking",            # with activity names.
                          "2"="Walking Upstairs",
                          "3"="Walking Downstairs",
                          "4"="Sitting",
                          "5"="Standing",
                          "6"="Laying")
names(Full_set)<-gsub('-','',colnames(Full_set))      # Getting rid of the dashes in the variable names
names(Full_set)<-gsub('[()]','',colnames(Full_set))   # Getting rid of the empty parentheses in the variable names
## Now that we have the data we want to work with, we'll find the averages of each measurement for
## each activity for each subject and save it to a .txt file.
Finalset<-data.frame()
for(i in 1:30){
      subject_set<-filter(Full_set,Subject==i) # Subsetting for each subject
      for(x in c("Walking","Walking Upstairs","Walking Downstairs","Sitting","Standing","Laying")){
            subject_activity<-filter(subject_set,Activity==x) #Subsetting for each activity
            col_means<-t(colMeans(subject_activity[,3:ncol(subject_activity)])) # Getting column averages
            temp<-cbind("Subject"=subject_set[1,1],"Activity"=x,col_means) # Builds the rows of data
            Finalset<-rbind(Finalset,temp)  #Binds the rows of data together, beginning with a null frame
      }
}
write.table(Finalset,file="tidySamsungData.txt",row.names=FALSE)

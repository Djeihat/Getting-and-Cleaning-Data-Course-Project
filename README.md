---
title: "README"
author: "Jay Yamakawa"
date: "August 27, 2016"
output: pdf_document
---

# Getting and Cleaning Data Course Project
##Tidying the Samsung Smartphone Data Set

The files in this repository are a tidying of data from the publication:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The data used was downloaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> and was originally collected using the acclerometers and gyroscopes in cellphones while subjects did various activities.

The run_analysis.R script checks for the data in the working directory and downloads it if does not find it.  Once the data is found and read into R, the script builds it into a data frame, extracting the mean and standard deviation of each measurement.  The mean frequency measurements have been omitted since it is a different measurement from just the mean of a measurement. Then the average of each measurement for each activity for each subject is calculated and saved as a .txt file.

The data in this repository include:

* 'README.md'
* 'tidySamsungDatacodebook.md' - descriptions of methods and variables used in analysis
* 'run_analysis.R' - R script
* 'tidySamsungData.txt'- data set with average of each measurement of each activity for each subject.

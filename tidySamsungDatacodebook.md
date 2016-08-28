---
title: "tidySamsungDataCodebook.md"
author: "Jay Yamakawa"
date: "August 27, 2016"
output: pdf_document
---
This exercise was to clean and tidy the data taken from the publication:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The following was taken from the documentation included in the data set and modified for the purposes of the exercise. I have included it because I used the original variable names as the variable names in my data set:

'The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

'Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

'Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

 


The variables used in this exercise were the mean and standard deviation of each measurement.  They are:
('XYZ' is used to denote 3-axial signals in the X, Y and Z directions.')

- tBodyAccmeanXYZ
- tBodyAccstdXYZ
- tGravityAccmeanXYZ
- tGravityAccstdXYZ
- tBodyAccJerkmeanXYZ
- tBodyAccJerkstdXYZ
- tBodyGyromeanXYZ
- tBodyGyrostdXYZ
- tBodyGyroJerkmeanXYZ
- tBodyGyroJerkstdXYZ
- tBodyAccMagmean
- tBodyAccMagstd
- tGravityAccMagmean
- tGravityAccMagstd
- tBodyAccJerkMagmean
- tBodyAccJerkstd
- tBodyGyroMagmean
- tBodyGyroMagstd
- tBodyGyroJerkMagmean
- tBodyGyroJerkMagstd
- fBodyAccmeanXYZ
- fBodyAccstdXYZ
- fBodyAccJerkmeanXYZ
- fBodyAccJerkstdXYZ
- fBodyGyromeanXYZ
- fBodyGyrostdXYZ
- fBodyAccMagmean
- fBodyAccMagstd
- fBodyAccJerkMagmean
- fBodyAccJerkMagstd
- fBodyGyroMagmean
- fBodyGyroMagstd
- fBodyGyroJerkMagmean
- fbodyGyroJerkstd

Accelerometer readings (variable names that contain Acc) are in standard gravity units, 'g'. Gyroscope readings are in radians/second. 

The set of files downloaded and read into R were:

* **features.txt**
* **subject_test.txt**
* **X_test.txt**
* **y_test.txt**
* **subject_train.txt**
* **X_train.txt**
* **y_train.txt**

The contents of **features.txt** were used to name the variables contained in **X_test.txt** and **X_train.txt**, then variables that were the mean and standard deviation of each measurement were selected. The contents of **subject_test.txt** and **y_test.txt** were stitched to the contents of **X_test.txt** and the same was done for the **train** set. Then the data from the **test** set was stacked on top of the data from the **train** set. From there, the values of **y_test.txt** (the activities set) were changed from integer values to character strings that represented what each subject was doing while the data was being gathered. This was the final step of merging the **test** and **train** data sets.

Next, a nested loop was created to subset out each subject's data, then find the column averages of the data from each activity, then stack all that back into a final data set.

The resulting data set is the average of the mean and standard deviation for each measurement for each activity for each subject.

# Code Book for Getting and Cleaning Data Course Assignment

## Study Design
The data used in this assignment can be found at the following site:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the data is available at the site where the data was originally
obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

From original README file:

The experiments have been carried out with a group of 30 volunteers within an age bracket of
19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS,
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on
the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear
acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have
been video-recorded to label the data manually. The obtained dataset has been randomly
partitioned into two sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise
filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128
readings/window). The sensor acceleration signal, which has gravitational and body motion
components, was separated using a Butterworth low-pass filter into body acceleration and
gravity. The gravitational force is assumed to have only low frequency components, therefore
a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was
obtained by calculating variables from the time and frequency domain. See
'features_info.txt' for more details. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body
acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

------

In these data there is a training set and a test set and these files contain 561 variables.
For this assigment the goal was to combine these two sets and extract only the measurements
on the mean and standard deviation for each measurement. 

## Code Book

First the data is downloaded and unziped.

The features are then read in.
The subject data for the training and test set are read in and merged.
The activity label for the two sets are read in and merged.
The measurement data is read in and the columns are named descriptively.
The subject data, activity data and the measurement data are then combined.
The mean and standard devation measurements are extracted.
The activity labels are labeled with their appropriate names based on the 
activity_labels file.
The variables get descriptive names:
t = Time
f = Freq = Frequency
Acc = Accelerometer
Gyro = Gyroscope
Mag = Magnitude

A new dataset is made by taking the average for each subjects measurements for each 
activity and written to TidyData.txt.


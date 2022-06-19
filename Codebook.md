# Codebook
## Data
  - Dataset: Human Activity Recognition Using Smartphones Dataset Version 1.0
  - Full description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
  - Original data:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
### About dataset
  The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data

  The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.
## Transformation
1. Merged test and train data according to subject and activity labels.
2. Select only features that measures mean and standard deviation. (mean, std, meanFreq, and Angle(Mean).
3. Renamed variables according their respective full names.
5. Group by subject and acitivty labels.
6. Averaged the values of each selected feature.
## Variables
### subject
ID of the subject that carried out the experiment. Ranges from 1-30.
### activity
Label for each activity. Values are WALKING,WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING.
### Feature variables
Each variable denotes the average for each mean and standard deviation estimated from accelerometer and gyroscope 3-axial raw signals.
Abbrevated features were renamed to their full descriptive names (original names).     
Listed below are the variable names organized based in it's naming convention:

Domain signals:
- time ("t")- These time domain signals were captured at a constant rate of 50 Hz.
- frequency ("f")- Frequency domain signals

Divided into:
- Body - Body signals
- Gravity - Gravity signals

Measurements of acceleration, gyroscope, jerk and magnitude:
- Accelerometer ("Acc")- The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'
- Gyroscope ("Gyro")- The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.
- BodyAccelerationJerk ("BodyAccJerk")- body linear acceleration derived in time to obtain Jerk signals
- BodyGyroscopeJerk ("BodyGyroJerk")- body angular velocity derived in time to obtain Jerk signals
- Magnitude ("Mag")- magnitude of the three-dimensional signals calculated using the Euclidean norm

Estimates:
- Mean ("mean()")- mean value
- STD ("std()")- standard deviation
- MeanFreq ("meanFreq()")- Weighted average of the frequency components to obtain a mean frequency

Axial signals:
- XYZ - Denote 3-axial signals in the X, Y and Z directions.

Angle:
- angle() variable - Angle between vectors
- gravityMean - average of the signals in a signal window sample

Created variable for instruction #5:
- _mean - suffix to denote average values of each feature according to subject and activity groups

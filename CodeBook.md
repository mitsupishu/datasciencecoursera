
Data Processing Steps:

1. Read "activity_labels.txt","features.txt","test\\subject_test.txt","test\\y_test.txt","test\\x_test.txt" into working environment.        

2. Read "train\\subject_train.txt","train\\y_train.txt","train\\x_train.txt" into working environment.
 
3. Append the extracted test data set to the extracted training data set
  
4. Append a column called "ActivityText" with the text description of the row ActivityID
 
5. Identify the column names containing mean and standard deviation as well as human subject identifier and activity identifier.

6. Extract  column names for mean and standard deviation as well as human subject identifier and activity identifier into another data set

7. Tidy up the extracted data set column names (remove periods and enforce general Camel Case style)

8. Group extracted data by ActivityText and human subject identifier.
  
9. Perform colMeans operation on the data contained in each group of the extracted data [ length(c("SubjectID","ActivityID","ActivityText")) exclude last three columns of row]
 
10. Write tidy data set formatted as comma-delimited with cr/lf line terminator  (mergemeanstd.txt).
       Group names formatted as "XSubjectID.ActivityText".

The mergedmeanstd data set contains the following columns:

Column Contents Description			  Column Name
-----------------------------                                            -----------------
Body Acceleration Magnitude (Mean)                        tBodyAccMagMean
Body Acceleration Magnitude (Standard Dev)          tBodyAccMagStandardDeviation
Gravity Acceleration Magnitude (Mean)                    tGravityAccMagMean
Gravity Acceleration Magnitude (Standard Dev)      tGravityAccMagStandardDeviation
Body Acceleration Jerk Magnitude (Mean)                tBodyAccJerkMagMean
Body Acceleration Jerk Magnitude (Standard Dev)  tBodyAccJerkMagStandardDeviation
Body Angular Velocity Magnitude (Mean)                       tBodyGyroMagMean
Body  Angular Velocity Magnitude (Standard Dev)        tBodyGyroMagStandardDeviation
Body  Angular Velocity Jerk Magnitude (Mean)              tBodyGyroJerkMagMean
Body  Angular Velocity Jerk Magnitude (Standard Dev)    tBodyGyroJerkMagStandardDeviation
Body Acceleration Magnitude FFT (Mean)                         fBodyAccMagMean
Body Acceleration Magnitude  FFT (Standard Dev)          fBodyAccMagStandardDeviation
Body-Body Acceleration Jerk Magnitude FFT (Mean)           fBodyBodyAccJerkMagMean
Body-Body Acceleration Jerk Magnitude FFT (Standard Dev)          fBodyBodyAccJerkMagStandardDeviation
Body-Body  Angular Velocity  Magnitude FFT (Mean)                        fBodyBodyGyroMagMean
Body-Body  Angular Velocity Magnitude FFT (Standard Dev)           fBodyBodyGyroMagStandardDeviation
Body-Body  Angular Velocity  Jerk Magnitude FFT (Mean)                        fBodyBodyGyroJerkMagMean
Body-Body  Angular Velocity Jerk Magnitude  FFT (Standard Dev)           fBodyBodyGyroJerkMagStandardDeviation
An integer (1 to 30) representing each subject in the study                      SubjectID
An integer between 1 and 6 representing what a subject was doing       ActivityID
Description of the coded activity                                                                     ActivityText


An R script has been created to process some of the data from the following source:
"Human Activity Recognition Using Smartphones Data Set".
URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

NOTE:
The downloaded data is contained in a local folder "UCI HAR Dataset". 

The following files (and folders) must exist in the R Studio working directory when run_analysis() is called:
    "activity_labels.txt","features.txt",
     "test\\subject_test.txt","test\\y_test.txt","test\\x_test.txt",
     "train\\subject_train.txt","train\\y_train.txt","train\\x_train.txt"

The script appends test and training data sets, selects a subset of columns labeled with mean
and standard deviation and creates a dataset containing these columns but with the names
transformed to be "tidy".  It then generates a text file containing column averages broken down
by a human subject identifier code and an activity code.


To use the run_analysis.R script:

1.  In R Studio set the working directory to be the folder containing the UCI HAR Dataset and 
      the associated subfolders.

2.  Move the run_analysis() script into this folder.

3.  At the R Studio prompt type "run_analysis()".
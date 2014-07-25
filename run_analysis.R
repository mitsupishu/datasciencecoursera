run_analysis<-function(){

     if (!(file.exists("activity_labels.txt") 
           & file.exists("features.txt")
           & file.exists("test\\subject_test.txt")
           & file.exists("test\\y_test.txt")
           & file.exists("test\\x_test.txt")
           & file.exists("train\\subject_train.txt")           
           & file.exists("train\\y_train.txt")
           & file.exists("train\\x_train.txt")
           )){
       print("Missing required files.  Working directory must be set to >UCI HAR Dataset<")
       return ()
     }
  
     # Labels associated with activities that data is supposed to represent
     activitylabel<<-read.table("activity_labels.txt")
     # Names associated with each feature in data set
     featurename<<-read.table("features.txt")     

     # Labels associated with the subjects used to generate the test data
     testsubjectlabel<<-read.table("test\\subject_test.txt")   
     names(testsubjectlabel)<<-c("SubjectID")
     
     testdatalabel<<-read.table("test\\y_test.txt")
     names(testdatalabel)<<-c("ActivityID")
     #testdatalabel<<-cbind(testdatalabel,ActivityText=vector("character",length=nrow(testdatalabel)))
           
     testdata<<-read.table("test\\x_test.txt")
     # Assign specified name to each feature in the data row
     names(testdata)<<-make.names(featurename$V2)      # as.character(featurename$V2)
     # Append an index column contain a unique ID for each data row. Write to global environment.     
     testdata<<-cbind(data.frame(ID=1:nrow(testdata)),testdata, testsubjectlabel, testdatalabel)
     
     # Labels associated with the subjects used to generate the test data
     trainsubjectlabel<<-read.table("train\\subject_train.txt")     
     names(trainsubjectlabel)<<-c("SubjectID")
     
     traindatalabel<<-read.table("train\\y_train.txt")
     names(traindatalabel)<<-c("ActivityID")     
     #traindatalabel<<-cbind(traindatalabel,ActivityText=vector("character",length=nrow(traindatalabel)))
     
     traindata<<-read.table("train\\x_train.txt")     
     # Assign specified name to each feature in the data row
     names(traindata)<<-make.names(featurename$V2)     # as.character(featurename$V2)
     # Append an index column contain a unique ID for each data row.  Write to global environment.     
     traindata<<-cbind(data.frame(ID=1:nrow(traindata)),traindata, trainsubjectlabel ,traindatalabel)
     
     # Append the test data set to the training data set
     merged<<-rbind(traindata,testdata)
     # Append a column called "ActivityText" with the text description of the row ActivityID
     merged<<-cbind(merged,ActivityText=as.character(activitylabel[  match( merged[,"ActivityID"] ,activitylabel[,"V1"],nomatch=0) ,2]))
 
     # Identify the column names for mean and standard deviation as well as subject and activity
     meanstdcolnames<<-regexpr("std..$|mean..$|SubjectID|ActivityID|ActivityText",names(merged))
 
     # Extract specified columns into another data set
     mergedmeanstd<<-merged[ ,names(merged)[ meanstdcolnames > -1]]
 
     #gsub("\\.s",".S",names(mergedmeanstd[1]))
     #gsub("\\.m",".M",names(mergedmeanstd[1]))
     #gsub("\\.","",names(mergedmeanstd[1]))
     messynames<-names(mergedmeanstd)
 
     # Nested looping character replacement operations to make column names more tidy
     names(mergedmeanstd)<<-lapply( lapply( lapply(messynames,function(x){gsub("\\.m",".M",x)}), function(x){gsub("\\.std",".StandardDeviation",x)}), function(x){gsub("\\.","",x)})
 
     # Group extracted data by ActivityText and SubjectID
     byActAndSub<<-split(mergedmeanstd,c(mergedmeanstd["SubjectID"],mergedmeanstd["ActivityText"]))
 
     # Perform colMeans operation on the data contained in each group of the extracted data [ length(c("SubjectID","ActivityID","ActivityText")) exclude last three columns of row]
     outputRaw<<-lapply(byActAndSub, function(x){colMeans(x[, names(x)[1:(length(names(x))-length(c("SubjectID","ActivityID","ActivityText")))]  ])})
 
     # Tidy data set formatted as comma-delimited with cr/lf line terminator will be uploaded to class server
     write.table(as.data.frame(outputRaw),file="mergedmeanstd.txt", row.names=FALSE ,sep=",",eol="\r\n")
}
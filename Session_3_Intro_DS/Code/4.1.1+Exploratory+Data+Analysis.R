#remove all the objects stored
rm(list=ls())

#set current working directory
setwd("C:/Users/ABHAY RAJ SINGH/Desktop/DS_Trainer/Session_3")

#Create vector
vec_V1 = c(2,3,4,6)

#Create list
lis = list("India",5,6,7)

# Create a matrix
sample_matrix = matrix(1:9, byrow = T, nrow = 3) # This inserts elements by rows


matrix(1:10, byrow = F, ncol = 3) # This inserts elements by columns

# Naming a matrix
colnames(sample_matrix) = c("One","Two","Three")

#transpose matrix
t(sample_matrix)

# Arithmetic with matrices
sample_matrix*5
sample_matrix/10

#Let us learn how to create data frame
df = data.frame(age = c(2, 3, 4, 5), Gender = c("M", "F", "F", "M"), Income = c(5,6,7,3))

#Rename varaible
names(df)[2] = "Gen"

#convert vector into dataframes
df_vec = as.data.frame(vec_V1) 

#Selecting variables from the dataset and making a new dataset
data = mtcars
NewData_V1 = subset(data, select = c("mpg","cyl","hp","am"))

#selecting the rows with condition
data_rowLevel = data[which(data$mpg == 21.4),]

#Creating new variable
data$LogMPG = with(data, log(mpg))

# Adding rows of two data frame
d1 = data.frame(a = c(3,4,5,6), b = c(4,5,6,6)) #Let us create two data frame to merge
d2 = data.frame(a = c(5,6,7,8), b = c(4,5,7,8))

d3 = rbind(d1,d2)

#Adding columns 
d3 = cbind(d1, d2)

#Data types
data = mtcars

#convert each varaible
data$cyl = as.factor(data$cyl)
data$vs = as.factor(data$vs)

#Convert n number of variables at a time
for(i in c(2,8:11)){
  data[,i] = as.factor(data[,i])
}

#Convert numeric to categorical/binning
data$mpgcat[data$mpg >= 10 & data$mpg <= 16] = "Low"
data$mpgcat[data$mpg > 16 & data$mpg <= 20] = "Medium"
data$mpgcat[data$mpg > 20] = "High"

#Convert categorical into numeric
voice = c(rep("Meduim", 30), rep("Poor", 30), rep("Rich", 40))
voice_factor = factor(voice, labels = (1:length(levels(factor(voice)))))
voice_numeric = as.numeric(voice_factor)

#Sorting in ascending order
data = data[order(-data$cyl),]

#Sorting in descending order
data = data[order(-data$mpg, -data$gear),]

#http://www.datasciencemadesimple.com/join-in-r-merge-in-r/

#Merging Two dataframes
df1 = data.frame(CustomerId = c(1:6), Product = c(rep("Toaster", 3), rep("Radio", 3)))
df2 = data.frame(CustomerId = c(2, 4, 6), State = c(rep("Alabama", 2), rep("Ohio", 1)))

MergedData = merge(df1, df2, by = "CustomerId")

#Joins
LeftJoin = merge(df1, df2, by = "CustomerId", all.x = TRUE) #vlookup
RightJoin = merge(df1, df2, by = "CustomerId", all.y = TRUE)
CrossJoin = merge(df1, df2, by = NULL)

#Aggregating
data = mtcars

aggregate(data, by = list(data$gear), mean)

aggregate(data, by = list(data$cyl, data$vs), mean)
aggregate(data, by = list(data$cyl), sd)

#Gives the observation which have cyl value 6
grep(6, data$cyl)
grep(14.3, data$mpg)

#Repalcing one/multiple characters by other
text="I/work/in/India"

gsub("/", "#", text)

x = c("This is a sentence about axis",
       "A second pattern is also listed here")

sub("is", "XY", x) #only first occurence
gsub("is", "XY", x) #All occurence

#remove column by its name
data$mpg = NULL

#convert row.names into a column
data = cbind(rownames(data), data)
rownames(data) = NULL
colnames(data)[1] = "CarNames"

write.csv(data, "data_transform.csv", row.names = F)

#remove all the objects stored
#R uses RAM .R can exeute only 1 program at a time.
rm(list=ls())

#set current working directory
setwd("C:/Users/ABHAY RAJ SINGH/Desktop/DS_Trainer/Session_2")

#Current working directory
getwd()

#instaling packages
install.packages("dmm")

#Install multiple packages at a time
#c will bind all the words present in parenthesis
install.packages(c("dplyr","plyr","reshape","ggplot2","data.table"))

##Load data in R
#reading CSV
df = read.csv("German.csv", header = T) 

#reading Excel sheet
install.packages("xlsx")
install.packages("rJava")
Sys.getenv("JAVA_HOME")
if (Sys.getenv("JAVA_HOME")!="")
  Sys.setenv(JAVA_HOME="")
library(rJava)
library(xlsx)
data_excel = read.xlsx("Test_R.xlsx", sheetIndex = 1, header = T)

#reading .txt file as dataframe
data_text = read.delim("churn_data.txt", sep = ",", header = F)   

#We are considering mtcars dataset to understand R commands
data = mtcars
 
#Getting the column names of the dataset
colnames(data)

#Getting the structure of the dataset
str(data)

#Getting the number of variables and obervation in the datasets
dim(data)

#Getting first 5 rows of the dataset
head(data, 5)

#Getting the last 5 rows of the dataset
tail(data, 5)

#Getting first 5 rows and 6 columns of the dataset
data[1:5,1:6]

#Getting first 6 columns of the dataset
data[, 1:6]

#Getting first 10 rows and 1 column
data[1:10, 1]

#data type
class(data$cyl)

#Unique values in a column
unique(data$gear)

#Count of unique values in a column
length(unique(data$gear))

#Distribution of unique values in a column
table(data$gear)

#Summary of a varaible 
summary(data$cyl)

#Assignment operators
df = 25 #storing numeric value
df1 = "I love India"      #storing characters

#Logical operations
df == 30

#Print object
print(df1)

#Arithematic operations
#An addition
5 + 5 

#A subtraction
5 - 5 

#A multiplication
3 * 5

#A division
(14)/2 

#squaring the number
5^2

#Modulo
7%%2

#Mean
mean(data$mpg)

#Median
median(data$mpg)

#Standard deviation
sd(data$mpg)

#Variance of the column
var(data$mpg)

#Add all the values of column
sum(data$mpg)

# Writing a csv (output)
write.csv(data, "data_output_pract.csv", row.names = F)

# Writing a xlsx file
write.xlsx(data, "data_excelwork.xlsx", row.names = F)


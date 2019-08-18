rm(list = ls())
setwd("G:/Analytics/Edwisor/Version_Revamp/Predictive Analytics using R/ModifiedVersion/Data")

###loops
# Lets define vector
Player1 = c(16, 9, 13, 5, 2, 17, 14)

for (i in Player1) {
  print(i)
  print(i+2)
}

german = read.csv("German.csv", header = T)

#use if condition in for loop
for(i in 1:nrow(german)){
  if(german$ResidenceDuration[i] == 4){
    german$newcol[i] = 1
  } else {german$newcol[i] = 0}
}

#ifelse condition
german$installement = ifelse(german$ResidenceDuration == 4, 1, 0)

###Apply family
#apply function
apply(german[1:10,1:9], 1, mean)
apply(german[1:10, 1:5], 1, median)

apply(german[,1:5], 2, sd)
apply(german[,1:5], 2, var)

# german[2,4] = NA
# 
# df = data.frame(apply(german, 2, function(x){sum(is.na(x))}))
# apply(german[,1:10], 2, function(x){sum(is.na(x))})

#create your own function
m = matrix(data = cbind(rnorm(30, 0), rnorm(30, 2), rnorm(30, 5)), nrow = 30,
           ncol = 3)
apply(m, 2, function(x) length(x[x<0]))

#lapply
lapply(german[,1:9], mean)

#sapply
# Find the square of each number using sapply and lapply
temp = c(10, 20, 30, 40, 50)

sapply(temp, function(x){x * x}) #return vector
#lapply(german[,1:9], mean)
lapply(temp, function(x){x * x}) #return list

unlist(lapply(temp, function(x){x * x}))

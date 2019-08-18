rm(list=ls(all=T))
setwd("")

#Load Libraries
library(rpart)
library(MASS)

#Load practice data
df = birthwt

#Divide the data into train and test
#set.seed(123)
train_index = sample(1:nrow(df), 0.8 * nrow(df))
train = df[train_index,]
test = df[-train_index,]
 
# ##rpart for regression
fit = rpart(bwt ~ ., data = train, method = "anova")

#Predict for new test cases
predictions_DT = predict(fit, test[,-10])

#MAPE
#calculate MAPE
MAPE = function(y, yhat){
             mean(abs((y - yhat)/y))
}

MAPE(test[,10], predictions_DT)

#Error Rate: 10.33
#Accuracy: 89.67

#Linear Regression
#check multicollearity
library(usdm)
vif(df[,-10])

vifcor(df[,-10], th = 0.9)

#run regression model
lm_model = lm(bwt ~., data = train)

#Summary of the model
summary(lm_model)

#Predict
predictions_LR = predict(lm_model, test[,1:9])

#Calculate MAPE
MAPE(test[,10], predictions_LR)

#Error Rate: 9.8
#acuracy: 91.2%












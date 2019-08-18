rm(list=ls())

#set working directory
setwd("E:/Others/Edwisor/ContentRevamp/MarketingCampaign")

#load libraries
library("ggplot2")
library("scales")
library("psych")
library("gplots")

#Load input data
Marketing_data = read.csv("marketing_train_missing.csv", header=T)

#Univariate 
#Bar plot(categorical data)
#If you want count then stat="bin"
ggplot(Marketing_data, aes_string(x = Marketing_data$profession)) +
  geom_bar(stat="count",fill =  "DarkSlateBlue") + theme_bw() +
  xlab("Profession") + ylab('Count') + scale_y_continuous(breaks=pretty_breaks(n=10)) +
  ggtitle("Marketing Campaign Analysis") +  theme(text=element_text(size=15))

#Histogram 
ggplot(Marketing_data, aes_string(x = Marketing_data$custAge)) + 
  geom_histogram(fill="cornsilk", colour = "black") + geom_density() +
  scale_y_continuous(breaks=pretty_breaks(n=10)) + 
  scale_x_continuous(breaks=pretty_breaks(n=10))+
  theme_bw() + xlab("Age") + ylab("Frequency") + ggtitle("Marketing_data: Age") +
  theme(text=element_text(size=20))

#Box plot
ggplot(Marketing_data, aes_string(x = Marketing_data$responded, y = Marketing_data$custAge, 
  fill = Marketing_data$responded)) + 
  geom_boxplot(outlier.colour = "red", outlier.size = 3) + 
  scale_y_continuous(breaks=pretty_breaks(n=10)) + 
  guides(fill=FALSE) + theme_bw() + xlab("Responded") + ylab("Customer Age") +
  ggtitle("Outlier Analysis") +  
  theme(text=element_text(size=20))

#Multivariate #Scatter Plot
ggplot(Marketing_data, aes_string(x = Marketing_data$campaign, y = Marketing_data$custAge)) + 
  geom_point(aes_string(colour = Marketing_data$responded, shape = Marketing_data$profession),size = 4) +
  theme_bw()+ ylab("Customer Age") + xlab("Campaign") + ggtitle("Scatter plot Analysis") + 
  theme(text=element_text(size=25)) + 
  scale_x_continuous(breaks=pretty_breaks(n=10)) +
  scale_y_continuous(breaks=pretty_breaks(n=10)) +
  scale_colour_discrete(name="Responded")+
  scale_shape_discrete(name="Profession")


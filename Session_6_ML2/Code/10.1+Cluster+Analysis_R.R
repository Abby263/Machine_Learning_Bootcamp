rm(list=ls())

#set current working directory
setwd("E:/Others/Edwisor/ContentRevamp/MarketingCampaign")

#load libraries
library(NbClust)

#Load data
df = iris

#standadize the data
df_new = data.frame(scale(df[-5]))

#extract number of clusters to bulid
NBclust_res = NbClust(df_new, min.nc=2, max.nc=15, method = "kmeans")

#Barplot to analys the optimum clusters
barplot(table(NBclust_res$Best.n[1,]),
        xlab="Number of Clusters", ylab="Number of Criteria",
        main="Number of Clusters Chosen by 26 Criteria")

#K-mean clustering
kmeans_model = kmeans(df_new, 3, nstart=25)

#Summarize cluster output
kmeans_model

#How well your kmeans is??
Cluster_accuracy = table(df$Species, kmeans_model$cluster)










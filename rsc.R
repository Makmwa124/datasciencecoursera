setwd("C:\\Users\\mkariuki\\Dropbox (Personal)\\R Training")
#Read data into R
train<-read.csv("train.csv",header=TRUE)
test<-read.csv("test.csv",header=TRUE)

names(train)
table(train$Pclass)

#Create a variable called survived
test.survived<-data.frame(Survived=rep("None",nrow(test)),test[,])
data.combined<-rbind(train,test.survived)
str(data.combined)
data.combined$Survived<-as.factor(data.combined$Survived)
data.combined$Pclass<-as.factor(data.combined$Pclass)
table(data.combined$Pclass)
library(ggplot2)
library(stringr)

str(train)
train$Survived<-as.factor(train$Survived)

#Hypothesis - Rich forks survived at higher rate
train$Pclass<-as.factor(train$Pclass)
ggplot(train,aes(x=Pclass,fill=factor(Survived)))+
  stat_count(width = 0.5)+
  xlab("Pclass")+
  ylab("Total Count")+
  labs(fill="Survived")

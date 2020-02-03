# Checking directry
getwd()
#Load the Data 
data1<-read.csv("/home/srssethi99_gmail/myproject/hospitalcosts.csv",header=TRUE,sep=",")
View(data1)
summary(data1)
str(data1)
library(caTools)
set.seed(1)
sample<- sample.split(data1$TOTCHG,SplitRatio = 0.70)
sample
train_data <- subset(data1 , sample==TRUE)
test_data<- subset(data1,sample==FALSE)
model <- lm(TOTCHG ~., data=train_data)
summary(model)
model1 <- lm(TOTCHG ~AGE+LOS+APRDRG, data=train_data)
summary(model1)
prob <- predict(model,test_data,type = "response")
prob
prob1<-data.frame(prob)
View(prob1)
finaldata<- cbind(test_data,prob1)
View(finaldata)
write.csv(finaldata,"hospital cost prediction.csv")
results<- ifelse(prob1>0.7,1,0)
results
table(results)

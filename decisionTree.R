library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)

setwd("~/Kaggle/Titanic")
train <- read.csv("~/Kaggle/Titanic/train.csv")
test <- read.csv("~/Kaggle/Titanic/test.csv")
test$Survived <- NA

fit <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, data=train, method="class")

fancyRpartPlot(fit)

Prediction <- predict(fit, test, type = "class")
submit <- data.frame(PassengerId = test$PassengerId, Survived = Prediction)

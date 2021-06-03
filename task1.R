#THE SPARK FOUNDTAION
#Name : Aparna Nambiar
#TASK-1 : Predict the percentage of an student based on the no. of study hours.

#loading given file
data <- read_csv("C:/Users/admin/Desktop/Machine learning/internship/data.csv")
View(data)
#importing libraries
library(readr)
library(ggplot2)

#plotting the data
ggplot(data,aes(x=Hours,y=Scores))+geom_point()+ggtitle("Hours studied vs Scores")+labs(caption = "There is a positive linear relation between the number of hours studied and percentage of score.")

#Applying linear regression
model=lm(data$Scores~data$Hours)
summary(model)

# Plotting the regression line
ggplot(data,aes(x=Hours,y=Scores))+geom_point()+stat_smooth(method = "lm", col = "dodgerblue3")+ggtitle("Linear Model Fitted to Data")

# Predicting the scores
predicted=predict(model,data.frame(data$Hours))
# Comparing Actual vs Predicted
data.frame(predicted,data$Scores)

#predicting the score if a student studies for 9.25 hrs/ day
Hours=9.25
Score=model$coefficients[1]+model$coefficients[2]*Hours
Score

#Evaluating the model
summary(model)$r.squared
#The R square value is 0.95 i.e.the model has worked well for our data

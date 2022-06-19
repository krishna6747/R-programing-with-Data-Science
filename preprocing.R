library(readr)
preproccing_trial <- read_csv("~/preproccing trial.csv")
View(preproccing_trial)

# Encoding Missing Values by imputing Mean Value
preproccing_trial$Age = ifelse(is.na(preproccing_trial$Age),
                               ave(preproccing_trial$Age, FUN = function(x)mean(x,na.rm = TRUE)),
                               preproccing_trial$Age)

preproccing_trial$Salary = ifelse(is.na(preproccing_trial$Salary),
                                  ave(preproccing_trial$Salary, FUN = function(x) mean (x,na.rm = TRUE)),
                                  preproccing_trial$Salary)

#Encoding Categorical data

preproccing_trial$Country = factor(preproccing_trial$Country,
                                   levels = c ("France","Italy","Sweden","Norway","Germany","India"),
                                   labels = c (2,3,4,5,6,1))

preproccing_trial$Purchase = factor(preproccing_trial$Purchase,
                                    levels = c("Yes","No"),
                                    labels = c(0,1))

#splitting data into trainning & test datasets
library(caTools)
set.seed(123)
split = sample.split(preproccing_trial$Purchase, SplitRatio = 0.8)
training_data = subset(preproccing_trial, split == TRUE)
test_data = subset(preproccing_trial, split == FALSE)
View(training_data)
View(test_data)
 
#feature scalling
training_data[,2:3] = scale(training_data[,2:3])
test_data[,2:3] = scale(test[,2:3])
















                                  
                                   
                                  
                                  

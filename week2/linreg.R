rm(list = ls())


data = read.csv("./data/Australian Institute of Sport.csv")

hist(data$Wt)
hist(data$BMI)

plot(data$Wt, data$BMI)

model = lm(Wt ~ BMI, data = data)
model

summary(model)

plot(data$Wt, data$BMI)

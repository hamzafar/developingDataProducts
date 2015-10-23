library(caret)
setwd("E:/Hamza/Coursera/Developing Data Products/project/code")
v<- read.csv("scientist.csv", stringsAsFactors = F)


v$class <- c(1:nrow(a))

fit <- train(class ~ day + month, data = v, method= 'knn', tuneLength =3,
             preProcess='range')

classVal <- round(predict(fit,newdata = data.frame(day=5, month = 3)))

v$Name[classVal]
a$star[classVal]
a$country[classVal]


require(lubridate)

a <- '2014-08-1'
a <- ymd(a)

day(a)
month(a)




nearestVal <- function(colName, idx){
       print(v$Name[idx])
       print(colName)
       }

nearestVal('Name',3)















normDay <- normVal(v$day,minVal = (min(v$day)), 
                   maxVal = max(max(v$day)))
normMonth <- normVal(v$month,minVal = (min(v$month)),
                     maxVal = max(max(v$month)))

normVal <- function(val,minVal,maxVal){
       (val-minVal)/(maxVal-minVal)
}



day <- 12
month <-8




a <- v
a$normMonth <- normMonth 
a$class <- c(1:nrow(a))






set.seed(1122)

knnFit <- train(Name ~ day, data = v, method = 'knn',tuneLength = 1,
                preProcess = c("center"), tuneLength = 3)

a <- v[1:2,]

knFit <- train(Name ~day, data = a, method = 'knn', tuneLength =3,
               preProcess= c('center','scale'))

d <- data.frame(day=12, Name = 'a')
predict(knFit, newdata = d)

fit <- knn3(a$Name, a$day, k=5)

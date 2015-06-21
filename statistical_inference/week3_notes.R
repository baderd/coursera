# homework3
library(datasets)
data(mtcars)

str(mtcars)
summary(mtcars$mpg)
head(mtcars)

#h1
t.test(mtcars$mpg)

#h2
x= round(qt(.975, 8)* 1/3,2)
x

#h4
round(t.test(subset(mtcars,cyl==4)$mpg, subset(mtcars,cyl==6)$mpg, var.equal = T)$conf.int, 1)




# quiz3

#q1
ci= 1100 + c(-1,1)*qt(.975,8)*30/3
ci

#q2
s= 6/qt(.975,8)
s

#q4
round(3-5 + c(-1,1)*qt(.975, 18)*sqrt(0.6/10 + 0.68/10) ,2)

#q4
6-4 + c(-1,1)*qnorm(.975)* sqrt(0.25/100 + 4/100)


#q7
round(-3 -1 + c(-1,1)* qt(.95,16)* sqrt(1.5^2/9 + 1.8^2/9) ,3)


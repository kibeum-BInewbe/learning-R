brain<-read.csv("C:/Users/user/Desktop/[K-MOOC] 데이터과학을 위한 R프로그래밍_2021/3주차/wk3/brain2210.csv")
head(brain)
dim(brain)
v<-c(1,2,3,4)
setwd("C:/Users/user/Desktop/[K-MOOC] 데이터과학을 위한 R프로그래밍_2021/3주차/wk3")
brain2<-read.csv("brain2210.csv")
brain2<-read.csv("brain2210.csv")
attach(brain)
table(sex)
table(brain$wt)
attach(brain)
table(wt)
hist(wt)
detach(brain)
install.packages("readxl")
library(readxl)
setwd("C:/Users/user/Desktop/[K-MOOC] 데이터과학을 위한 R프로그래밍_2021/3주차/wk3")
mtcars1<-read_excel("mtcarsb.xlsx", sheet="mtcars")
head(mtcars1)
dim(mtcars1)
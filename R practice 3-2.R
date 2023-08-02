setwd("C:/Users/user/Desktop/[K-MOOC] 데이터과학을 위한 R프로그래밍_2021/3주차/wk3")

brain<-read.csv("brain2210.csv")
head(brain)

attach(brain)

# subset with female
brainf<-subset(brain, sex == 'f')
mean(brainf$wt)
sd(brainf$wt)

# subset with male
brainm<-subset(brain, sex == 'm')
mean(brainm$wt)
sd(brainm$wt)

# histogram with same scale
hist(brainf$wt, breaks = seq(900,1700, by = 20), col = "green", main = "Histogram(Female)")
hist(brainm$wt, breaks = seq(900,1700, by = 20), col = "orange", main = "Histogram(Male)")

# subset with wt<1300
brain1300<-subset(brain, wt<1300)

# same subset of brain1300
brain1300<-subset(brain, !brain$wt>=1300)

summary(brain1300)
table(brain1300$sex)

# export csv file - write out to csv file
write.table(brainf, file = "brain.csv",row.names = FALSE, sep = ',', na = " ")
write.csv(brainf, file = "brainf.csv", row.names = FALSE)
write.csv(brainm, file = "brainm.csv", row.names = FALSE, na = " ")

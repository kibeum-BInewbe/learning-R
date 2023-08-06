# Data handling using "dplyr"
install.packages("dplyr")
library(dplyr)
# select, filter, mutate, group_by, summarize, arrange

setwd("C:/Users/user/Desktop/[K-MOOC] 데이터과학을 위한 R프로그래밍_2021/3주차/wk3")

car<-read.csv(file = "autompg.csv")
attach(car)

# head: 데이터가 잘 들어갔는지 확인
head(car)
# dim: 행의 길이; 관측치 수
dim(car)
# str(string): 데이터 변수들이 어떻게 정의되어 있는지 확인
str(car)

summary(car)
table(origin)
table(year)

mean(mpg)
mean(hp)
mean(wt)

# 1. subset data : selecting a few variables
set1<-select(car, mpg, hp, wt)
head(set1)
# 2. subset data : Drop variables with mpg
set2<-select(car, -starts_with("mpg"))
# 3. subset data : filter mpg>30
set3<-filter(car, mpg>30)
head(set3)
# 4. create a derived variable
# %>%는 파이프 연산자로 앞에서부터 순서대로 수행하여 데이터 처리를 하고 저장하는 것
# is.na(): NA 여부 판단하는 함수
set4<-car %>%
  filter(!is.na(mpg)) %>%
  mutate(mpg_km = mpg*1.609) # mutate(): 기존 변수를 가지고 새로운 변수 생성

# mean and standard deviation
car %>%
  summarise(mean(mpg),mean(hp),mean(wt))
# mean of some variables
select(car, 1:6) %>%
  colMeans()

# table with descriptive statistics
# 데이터에서 앞에 6개의 변수들을 선택해서 기술통계치 구함
a1<-select(car, 1:6) %>% summarize_all(mean)
a2<-select(car, 1:6) %>% summarize_all(sd)
a3<-select(car, 1:6) %>% summarize_all(min)
a4<-select(car, 1:6) %>% summarize_all(max)
table1<-rbind(a1,a2,a3,a4)
rownames(table1)<-c("mean","sd","min","max")
table1

# summary statistics by group variable
car %>%
  group_by(cyl) %>%
  summarize(mean_mpg = mean(mpg, na.rm = TRUE))
# group_by(): 데이터의 ()열을 그룹으로 묶음
# summarize(): ()그룹의 mpg 평균을 구함
# na.rm = TRUE: 통계 분석 시 결측 값을 제외함
# 요약통계량을 구할 때 group_by와 summarize 함께 사용하는 경우가 많음
# dplyr(디플라이알)은 데이터 전처리, 핸들링 부분에서 굉장히 유용한 라이브러리
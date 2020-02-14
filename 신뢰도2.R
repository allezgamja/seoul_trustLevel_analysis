library(dplyr)
View(iris)
mtcars$mpg, mtcars$disp

M<-cor(iris[,1:4])
m <- cor(mtcars$mpg, mtcars$disp)
head(iris)
irisiris <- iris[1:3]
iris_cor <- cor(irisiris)
corrplot(iris_cor)
getwd()
setwd("c:/TrustLevel/사회적신뢰도")

구글드라이브파일 전부 csv파일로 바꾸기
변수이름 영어로 바꾸기

# 종합
# 분기별데이터는 3분기만 센다. 왜냐면 신뢰도 조사를 3분기 때 진행.

시군구별 이동건수(2010-2018) 인구수 계 다 지우고 연도별 총전입이랑 총전출만 쓴다.

# 외국인(2013-2018): 3분기만 센다. (보류)
# 서울시상급학교진학률(보류)

# 종교별(2015) - 연도별 데이터가 없어서 패스
# 주거형태--> 지금 당장 못 쓰는 데이터
# 지역별 세금(2010-2018) : 패스

# corrplot() 이용해서 상관관계 분석

?read.table
library(readxl)
trust2018 = read_excel(path = "2018.xls")
trust2018 = trust2018[-c(1:28),-c(1,3,7)]
trust2018["종합"] = mean(trust2018["가족"], trust2018["이웃"], trust2018["공공기관"])
trust2017 = read_excel(path = "2017.xls")
trust2017 = trust2017[-c(1:28),-c(1,3)]
trust2016 = read_excel(path = "2016.xls")
trust2016 = trust2016[-c(1:28),-c(1,3)]
trust2015 = read_excel(path = "2015.xls")
trust2015 = trust2015[-c(1:28),-c(1,3,7)]   # 이웃, 낯선사람 합치기?
trust2015[,c(2,3,4,5)]
trust2015[1,4]
trust2014 = read_excel(path = "2014.xls")   # 이웃, 처음만난사람 합치기?
trust2014 = trust2014[-c(1:28),-c(1,3,7,8)]    # 이웃, 처음만난사람과 양의 상관관계?
trust2013 = read_excel(path = "2013.xls")   # 이웃, 처음만난사람 합치기?
trust2013 = trust2013[-c(1:28),-c(1,3,7,8)]
trust2012 = read_excel(path = "2012.xls")
trust2012 = trust2012[-c(1:28),-c(1,3,7,8)]
trust2011 = read_excel(path = "2011.xls")
trust2011 = trust2011[-c(1:28),-c(1,3,7,8)]

#2014년 세월호 이후로도 보기 # 외행성
#정권, 대통령 바뀌면서 올라갔는지?
summary(trust2018)
View(trust2018)
summary(trust2017)
summary(trust2016)
summary(trust2015)
summary(trust2014)
summary(trust2013)
summary(trust2012)
summary(trust2011)


read.table(file="서울시사회적신뢰(2015).txt", encoding="UTF-8",
           header=T, fill=T)

# 결측치 제거
# 데이터 수치형인지 확인하고 바꾸기

#정규분포이면 t.test
#아니면 wilcox.test -> 비모수추정방식

getwd()
setwd('c://Statistics/data/Part-III')
getwd()
data <- read.csv("one_sample.csv", header=TRUE)
# 모 편차를 모르기 때문에 T분포가 적절

x<-data$time
summary(x)
# 원래 결측치(NA)는 제거가 원칙...
# 시계열 데이터(e.g. 시간에 따른 온도차이)는 함부로 제거하면 흐름이 끊긴다.

summary(x)
mean(x, na.rm=T)

x1 <- na.omit(x)
summary(x1)

# 정규분포검정
# shapiro는 귀무가설 자체가 '정규성을 따른다'임
shapiro.test(x1) # 유의수준 0.05보다 큰 값이 나와서 귀무가설 기각 못함
# x1은 정규성을 따른다.
hist(x1)
# qqnorm(): qqplot. 값이 정규성을 따르면 직선 안에 들어온다.
qqnorm(x1)

t.test(x1, mu=5.2) # x1이 속한 데이터의 모집단의 평균은 5.2
# 귀무가설 기각해도 된다!

t.test(x1, mu=5.2, alter="greater", conf.level=0.95)
# e-05 는 10의 마이너스 5승, 대립가설이 맞다! 
# 이렇게 검증하고 나면 항상 연구보고서 써봐라 통계학정리.pdf p32


# 단일집단이 아닌 서로 다른 두 집단일 때 - prop.test()
data2 <- read.csv("two_sample.csv", header=TRUE)
head(data2)
a <- data2$method
b <- data2$survey
# 비율검정이므로 수치형이 아닌 범주형 데이터여야 한다
as.factor(b)

table(a)
table(b)
table(a,b, useNA='ifany') # useNA NA값이 있으면 어떻게? ifany 다 보여줘라

prop.test(c(110,135),c(150,150)) # 귀무가설 기본설정: 두 집단의 비율 차이는 없다.
prop.test(c(110,135),c(150,150), alter='greater')
#greater만 보면 귀무가설이 채택되는데 그건 사실이 아니다. 단측,양측 세 개를 다 봐라!
단측검정할 땐 two-side랑 같이 하면 좋다.


주어진 데이터가 범주형이면 비율검정, 수치형이면 

#var.test() : 분산값 검정

result <- subset(data2, !is.na(score), c(method,score))
subset은 가로로도 출력할 수 있으나 세로열을 선택하ㅡㄴ 것도 가능
head(result)
length(result$score)
# 1집단, 2집단 나누기
a<- subset(result, method==1)
b<- subset(result, method==2)

length(a$score)
length(b$score)
a1 <- a$score
b1 <- b$score
mean(a1)
mean(b1)

var.test(a1,b1) # H0: a1와 b1의 평균 분포의 차이가 없다.
t.test(a1,b1) # 평균 차이가 있다.
t.test(a1,b1, var.equal = T) # T가 default
t.test(a1,b1, var.equal = F) # 비동질성일 때
# var.equal = T는 t.test, F는 윌콕스

# 대응표본: 동질표본
# 평균검정은 두집단이건 한집단이건 t.test한다.

# 동질집단일 때
data3 <- read.csv('paired_sample.csv', header =T)
head(data3)
summary(data3)
result <- subset(data3, !is.na(after), c(before,after))
summary(result)

x<- result$before
y<- result$after
mean(x); mean(y)

# 동질집단일 때 paired옵션 준다.
var.test(x,y,paired=T)  # 귀무가설이 맞다.
#var.test는 분산비교 -> F검정 해야한다.

t.test(x,y,paired=T)
# Paired t-test에 들어간다.->동질집단에 대한 t-test
# 두 집단은 다르다. 평균차이가 난다. 


# 세 개 이상의 집단의 분석은 F검정!
# t분포로도 할 수는 있으나 두개씩 두개씩 해야 돼서 귀찮..



# 교차분석
data4 <- read.csv("cleanDescriptive.csv", header=TRUE)
head(data4)
summary(data4)

# 명목형: A형, B형, C형...
# 순서형: 

parent_edu <- data4$level2 #부모의학력
child_edu <- data4$pass2 #자녀들의 대학진학여부

table(parent_edu, child_edu)

install.packages("gmodels") # gmodels: 교차분석할 때 쓸 crossTable 지원
library(ggplot2)            # ggplot2: diamond 데이터셋 지원
library(gmodels)

data("diamonds")
diamonds

CrossTable(x=diamonds$color ,y= diamonds$cut)

D
163 = 관측치
7.607 = 카이제곱검정의 결과
0.024 = 전체 D행에서 Fair가 차지하는 비율 
0.101 = 전체 Fair열에서 D가 차지하는 비율
0.003 = 전체에서 D행의 Fair가 차지하는 비율

# 카이제곱검정: 전체, 평균에서 얼마나 유효한 범위 내에 있느냐. 실제로 관찰된 빈도가 기대한 빈도와 얼마나 가까운가.
자유도(표본의 개수)가 작을 때는 왼쪽이 짧고 오른쪽이 늘어짐
자유도가 커질수록 정규분포에 가까워진다.
귀무가설: 한 애나 안 한 애나 별로 차이가 없다.

기대빈도 = 평균

카이제곱은 두 변량이 독립적이어야 한다. 독립적이어야 카이제곱분포를 따른다.
그래서 독립성 검사할 때도 쓴다.











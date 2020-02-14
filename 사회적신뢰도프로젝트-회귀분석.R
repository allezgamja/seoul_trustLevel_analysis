getwd()



# 회귀분석
data(cars)
head(cars)
m<-lm(dist~speed, data=cars) #lm()회귀분석
# 종속변수~독립변수
m #m은 객체정보
# 계수값들에 대한 정보가 나온다.
# intercept가 절편(x가 0일때 y가 갖는 초기값)
# dist = 3.932 * speed + 17.579 --> 적합된 회귀식

summary(m)
# Residuals: 1Q, Median, 3Q를 주로 보라 
# Coefficients: Pr(>|t|)을 보라. 각각의 계수가 영향력이 없다.잔차의 차이에 대한 차이가 없다. 
잔차의 차이가 0이라는 가정하에 t검정이 들어간 것
# 각 계수의 value값 중요하니 공부!
# Signif부터는 회귀식 전체 값이 맞는지를 확인하는...
# * 보이면 유의하구나~....
# p-value가 0.05 이하면 이 전체 회귀식은 ok
# R-sqaured(결정계수R제곱): 0~1사이 값밖에 못 나옴. 다항식이 실데이터중의 65%를 설명한다. 그러면 실측치로부터 얼마나 떨어졌느냐?
# 변량이 두 개 이상일 때(다중선형회귀식)는 Multiple 말고 Adjusted R-squared를 쓴다.

fitted(m)[1:4]      
residuals(m)[1:4]   # 실측치, 예측치 사이 오차값(잔차값)

predict(m, newdata=data.frame(speed=3))

#결정계수는 큰 숫자가 나올수록 좋은 것. 잘 맞춘 것.얼마나 오차 줄이면서 예측했는지 평가하는 지표 중 하나

data(BostonHousing)
head(BostonHousing)
install.packages("mlbench")
library(mlbench)
m2 <- lm(medv~.,BostonHousing) # medv: 실제가격정보 .: 종속변수를 제외한 나머지 데이터 의미
summary(m2)

#독립변수가 여러개일 때
m2 <- lm(medv~a+b+, data=BostonHousing)  # +로 표시, 혹은 .으로 제외하고 다 처리
# 범주형 데이터도 독립변수로 쓸수있다. 하지만 0 1 2는 숫자가 의미를 갖는다고 간주될 수 있으므로 벡터화로 의미를 없애줘야 한다.
age는 별로 영향이 없다 -> 빼라 
# 학습이 이루어지고 패턴은 찾았는데 너무 과하게 이루어졌다? -> 오버피팅. 너무 심하게 자세히 ...오히려 예측률 떨어진다.
# 회귀분석이 가능한지 보려면?-> y값이 반드시 수치형이어야 한다.

각 변량별 t검정을 하여 다른 값들이 상수화(고정)되었다고 가정한 게 estimate 값.
이들이 갖고있는 f통게량을..서로 비교?
  AIC

# 단계적 변수선택방법
m3 <- step(m2, direction="both")
전체를 다 넣은 다음에 하나씨 빼면서 평가지표값 관찰
반대로 하나씩 넣으면서 관찰해도 됨
direction = "both" --> 전진제거법 후진선택법 둘다 

# Aic. 단계적선택방법은 forward와 backward를 번걸아가며 중요한 변수 추출
-2logL
AIC ㅈ ㅣ표값이 낮게 나오도록 해줘야 한다. 패널티 지표. 낮을수록 좋다.

stepwise





# ♧♣ 특수기호 ----

'''
# ☆ ★ ○ ● ◎ ⊙ ◐ ◑ ◇ ◆ ◈ □ ■ ▣ ▒ ▤▥ ▨ ▧ ▦ ▩ ▷◁ ▶◀ △ ▲ ▽ ▼ ♡ ♥ ♤ ♠ ♧ ♣  → ← ← ↑ ↓ ↔ 〓 ♨ ☏ ☎ ☜ ☞ ¶ † ‡ ↕ ↗ ↙ ↖ ↘ ♭ ♩ ♪ ♬
# ◁ _ ◁ _ ◁ _ ◁ _ ◁ _ ◁ _ ◁ _ ◁====
# **************************************--------
'''

# ___________________________----

# ♧♣ 단축키 ----

'''
Alt +  Shift + k      # 단축키 보기

Ctrl + Shift + F10    # R 재구동(Session > R restart)

Ctrl + Shift + C      # 주석 처리 (반복하면 주석 해제)
                      
Ctrl + I              # 줄 맞추기

Ctrl + Alt + <-(->)   # 탭 이동
Ctrl + 1, Ctrl + 2    # 콘솔창 이동
Ctrl + Shift + Alt+0  # 4개 창 전부 띄우기
Ctrl + Shift + 1      # 스크립트 창 확대
Ctrl + Shift + 2      # 콘솔창 확대
Ctrl + Shift + 6      # Plot 창 확대

Alt + <               # 커서 처음
Alt + >               # 커서 마지막
Alt + Shift + G       # 특정 라인(2865행) 이동
Alt + Shift + 상/하   # 해당 라인 복사
Alt + 상, 하          # 해당 라인 잡고 끌기

Ctrl + Shift + +      # 화면 확대
Ctrl + -              # 화면 축소
  
Ctrl + Shift + H      # Working Directory 변경

Ctrl + Shift + R      # Script 목차를 넣기(Code > Insert Section)
                      # ----, ==== 도 가능

Alt + L               # 섹션 접기
Alt + Shift + L       # 섹션 펼치기
Alt + O               # 모두 접기
Alt + Shift + O       # 모두 펼치기

Ctrl + L              # Console 창 삭제
dev.off()             # Plots 이미지 모두 삭제(아이콘으로 가능)

Ctrl + Enter          # 실행 (커서 이동)
Alt + Enter           # 실행 (커서 고정)
Ctrl + Shift + Enter  # 스크립트 창 전체 코드 실행

Ctrl + Shift + M      # %>% (파이프 연산자)
'''  

# ___________________________----

# ♧♣ 환경설정 ----

'''
> 화면 배치

- 상단 View → Panes → Pane Layout

> 스크립트 폭 고정

- 상단 Tools → Global Options → 좌측 Code → Display → "Show margin" 체크

> Soft-wrap

- 상단 Tools → Global Options → 좌측 Code → Editing → "Soft-wrap R source files" 체크

> 글자 깨짐 현상

- "Alt + =" (1초 정도 꾹 누르면 됨)
- 상단 Tools → Global Options → 좌측 Code → 상단 Saving → Default text encoding 옵션을 UTF-8 로 변경
- File → Reopen with Encoding → UTF-8

> 배경 테마 변경

- 상단 Tools → Global Options → 좌측 Appearance → Editor theme → "Pastel on Dark" or "Monokai"
'''
  
# ___________________________----

# ♧♣ 패키지 ----

'''
install.packages("dplyr")
install.packages("caret")
install.packages("randomForest")
install.packages("rpart")
install.packages("rpart.plot")
install.packages("e1071")
install.packages("tree")
install.packages("MASS")
install.packages("car")
install.packages("DescTools")
install.packages("ROCR")
install.packages("qcc")
install.packages("SixSigma")
install.packages("forecast")
install.packages("BSDA")
install.packages("phia")
install.packages("Hmisc")
install.packages("leaps")
install.packages("DoE.base")
install.packages("ipred")
install.packages("kernlab")
install.packages("boot")
install.packages("AER")

install.packages("tidyverse")
install.packages("tidyr")
# tidyr 패키지는 tidyverse 패키지의 일부임. tidyverse 패키지 전체를 설치해도 되고 tidyr 패키지만 따로 설치해도 됨.

install.packages("rmarkdown")
# R 마크다운에 필요함
install.packages("knitr")
# R 마크다운에 필요함

install.packages("magrittr")
# %>% 연산자는 따로 import 하지 않고 사용하기 때문에 그냥 dplyr 에 포함된 연산자인가보다라고 생각하지만 사실 magrittr 이라는 패키지에 속해있는 연산자임.
'''


# ___________________________----

# ♧♣ 실습 01 ----

# ♨ IVF-M HP pH 측정 간소화를 통한 공정시간 단축 및 GMP 리스크 감소

# ☎ 배치별 히스토리 ----

# 데이터 불러오기

batch = c('HMG19001', 'HMG19002', 'HMG19003', 'HMG19004', 'HMG19005', 'HMG19006', 'HMG19007', 'HMG19008', 'HMG19009', 'HMG19010', 'HMG19011', 'HMG19012', 'HMG19013', 'HMG20001', 'HMG20002', 'HMG20003', 'HMG20004', 'HMG20005', 'HMG20006', 'HMG20007', 'HMG20008', 'HMG20009', 'HMG20010', 'HMG20011', 'HMG20012', 'HMG20013', 'HMG20014', 'HMG20015')

before = c(4.56, 4.68, 4.58, 4.62, 4.7, 4.79, 4.76, 5.16, 5.06, 5.11, 5.17, 5.07, 4.83, 4.84, 4.9, 5.04, 5.24, 5.5, 5.5, 5.2, 4.72, 5.04, 4.92, 4.7, 5, 4.74, 4.85, 5.02)

after = c(6.42, 6.43, 6.42, 6.43, 6.39, 6.45, 6.4, 6.36, 6.49, 6.44, 6.4, 6.36, 6.41, 6.43, 6.41, 6.4, 6.42, 6.36, 6.44, 6.39, 6.39, 6.42, 6.42, 6.4, 6.39, 6.37, 6.41, 6.35)

df = data.frame(batch, before, after)
head(df, 3)

df_raw <- df

# Q1. ----
# 최근 3년간 IVF-M HP주 75IU 의 적정 전 버퍼 pH 분포의 박스 그래프를 확인하시오.





# Q2. ----
# 최근 3년간 IVF-M HP주 75IU 의 적정 전 버퍼 pH 분포의 Q1 ~ Q5 의 값을 확인하시오.






# install.packages("SixSigma")

library(SixSigma)

# Q3. ----
# pH 적정 전/후 공정 수준을 비교하시오.







# Q4. ----
# 적정 전/후의 관리도를 확인하시오.

# install.packages("qcc")

library(qcc)




# ☎ NaOH 투입에 따른 pH 적정 ----

# 데이터 불러오기

NaOH = c(0:9)
HMG21002 = c(4.8, 4.72, 4.93, 5.19, 5.44, 5.71, 5.85, 6.11, 6.31, 6.46)
HMG21003 = c(4.83, 4.75, 4.86, 5.02, 5.13, 5.51, 5.62, 6.01, 6.12, 6.32)
HMG21004 = c(4.82, 4.74, 4.9, 5.11, 5.29, 5.61, 5.74, 6.06, 6.22, 6.39)

tilt = data.frame(NaOH, HMG21002, HMG21003, HMG21004)
head(tilt, 3)


# Q5. ----
# HMG21002~4 각 배치별 NaOH 투입에 따른 pH 변화량 그래프를 그리시오.


# install.packages("tidyverse")
# install.packages("ggplot2")

library(tidyverse)
library(dplyr)
library(ggplot2)


# ___________________________----


# ♧♣ 실습 02 ----

# ♨ 공정용 소모품 사용 예측 수준 증대를 통한 낭비비용 절감

# ☎ 분석 목적 ----

'''
아래 질문에 대한 답을 찾기 위함

Q1. 분기별 정보를 추가하세요.

Q2. 21년 7월 합성의약의 소모품 사용이력을 보여주세요.

Q3. 21년 3~7월 QC 팀 소모품 사용이력을 보여주세요.

Q4. 소독액(6가지 품목) 관련 정보만 추출하세요.

Q5. 20년 1분기 QC 팀의 소독액(6가지 품목) 사용량을 확인하세요.

Q6. 21년 2분기 각 팀별 소독액(6가지 품목) 사용량 합계를 구하고 내림차순으로 정렬하세요.

Q7. 21년 2분기 각 팀별 소독액(6가지 품목) 사용량 합계를 한 눈에 비교할 수 있게 그래프로 그리세요.
'''


# 데이터 불러오기
# set Working directory 

dir()
getwd()

'''
예시) setwd("D:/#.Secure Work Folder/DX-LSS-Project/BB/DAT")
wd 에 rds 파일이 있어야 함
'''

consume <- readRDS(file = 'consume.rds')
df <- consume

head(df, 3)

library(dplyr)
library(tidyverse)

df_new = df %>%
  gather(key = "Team", value = "Quan", Finished, Substance_1, Substance_2, Complex, QC, Supporting)
df_new %>% head()

str(df); str(df_new)

# Q1. ----
# 데이터의 N/A 를 제거하고, 분기별 정보를 추가하세요.

df_new = na.omit(df_new)

df_new <- df_new %>% 
  mutate(Quarter = ifelse(Month <= 3, 1,
                   ifelse(Month <= 6, 2,
                   ifelse(Month <= 9, 3, 4))))

head(df_new); str(df_new)

# Q2. ----
# 21년 7월 합성의약의 소모품 사용이력을 보여주세요.

df_new %>% filter(.,Year == 21 & Month == 7 & Team == 'Complex')


# Q3. ----
# 21년 3~7월 QC 팀 소모품 사용이력을 보여주세요.



# Q4. ----
# 소독액(6가지 품목) 관련 정보만 추출하세요.

disinfect <- df_new %>%
  filter(Code == '303031' | Code == '303034' | Code == '303038' | Code == '303041' | Code == '303036' | Code == '303060')

# Q5. ----
# 20년 1분기 QC 팀의 소독액(6가지 품목) 사용량을 확인하세요.




# Q6. ----
# 21년 2분기 각 팀별 소독액(6가지 품목) 사용량 합계를 구하고 내림차순으로 정렬하세요.

temp <- disinfect %>%
  filter(Year == 21 & Quarter == 2) %>%
  group_by(Team) %>%
  summarise(Q = sum(Quan)) %>%
  arrange(desc(Q))
temp


# Q7. ----
# 21년 2분기 각 팀별 소독액(6가지 품목) 사용량 합계를 한 눈에 비교할 수 있게 그래프로 그리세요.

library(ggplot2)

ggplot(data = temp, aes(x = Team,
                        y = Q,
                        color = Team)) +
  geom_point()

ggplot(temp, aes(x = Team,
                 y = Q,
                 color = Team)) +
  geom_col()

# ___________________________----

# ♧♣ Day1 정리 퀴즈 ----

'''
* 문제 출처 : LG 인화원, 데이터 캠프, 20.08

LGSales 데이터(LGDatasets_Sales.csv)는 2017~2019년 LG전자 베스트샵 판매 정보로 구성되어 있습니다.
'''

sales = read.csv("LGDatasets_sales.csv")

head(sales, 3)

# Q1. ----
# LGSales 데이터가 몇 개의 row와 몇 개의 변수로 구성되어 있는지, 어떤 특징을 지닌 변수들로 구성되어 있는지 알아보세요. 하나의 함수만 이용하세요.



# Q2. ----
# date_m은 판매월, date_d는 판매일을 나타난 변수입니다. date_m은 month, date_d는 day로 변수명을 수정하세요. 데이터의 일부를 출력하여 변수명이 잘 바뀌었는지 확인해보세요.



# Q3. ----
# price는 판매가를 나타낸 변수입니다. price를 미국 달러로 환산한 파생변수를 만드세요. 데이터의 일부를 출력해 변수가 잘 추가되었는지 확인해보세요(1$ = 1164.5원)



# Q4. ----
# 판매가가 전체 평균 이상이면 "high", 그 외에는 "low"를 부여한 파생변수를 만드세요.



# Q5. ----
# "high"와 "low"에 해당하는 제품 판매량이 얼마나 되는지 빈도표와 빈도 막대 그래프를 만들어 확인해 보세요.



# Q6. ----
# "서울" 지역(region)을 추출해서 별도의 데이터를 만드세요.



# Q7. ----
# 위에서 추출한 데이터를 이용해서 서울에서 매출(판매가 합계)이 가장 높은 상위 10개 매장이 어디인지 알아보세요.





'''
summarise 함수 안에 요약통계량 구하는 함수 전부 대입하여 활용 가능.

요약통계량 구하는 함수

함수      | 기능
----------| --------
mean()    | 평균
sd()      | 표준편차
sum()     | 합계
median()  | 중앙값
min()     | 최소값
max()     | 최대값
n()       | 빈도
'''

# ___________________________----

# 2일차 교육 시작 ------------------------------------------------------------
# II Analyze -----------------------------------------------------------------

# ● 선형회귀 분석  ----------------------------------------------------------
#rm(list=ls())
#dev.off()
x=c(3,4,4,6,4,7,9,10,11,11); y=c(11,13,12,19,13,22,28,32,36,32)


# ● 의사결정나무  ----------------------------------------------------------
A=iris
library( )


# 심화학습 

# rpart 패키지의 rpart 함수를 활용한 의사결정 나무 
# library(rpart) 
# 분류 회귀 이외 생존나무, 포아송 회귀 나무 생성 가능, 자동 가지치기 등 
# B = rpart(Species~.,data=A)

# library(rpart.plot)
# rpart.plot(B)


# party 패키지의 ctree함수를 활용한 의사결정 나무 
# library(party)
# 반복 분할 방법을 통한 다중 검정으로 과적합 방지
# B = ctree(Species~.,data=A)
# plot(B)


# evtree 패키지의 evtree함수를 활용한 의사결정 나무 
# library(evtree)  # 모집단을 초기화, p개의 변수 중 하나를 랜덤 선택, 평가, 반복 
# B = evtree(Species~.,data=A)
# plot(B)


# ● 랜덤포레스트  ----------------------------------------------------------
#rm(list=ls())
library( )
library( )
data(cpus)


# ● 다중회귀분석  ----------------------------------------------------------


# ● 분산팽창지수  ----------------------------------------------------------
library( )


# III improve -----------------------------------------------------------------

# ● MSE, RMSE ----------------------------------------------------------
#rm(list=ls())
x=c(3, 4, 4, 6, 4, 7,  9, 10, 11, 11); y=c(11, 13, 12, 19, 13, 22, 28, 32, 36, 32)
A=lm (y~x);  predict(A)
library( )


# ● confusionMatrix ----------------------------------------------------------

library( )
B =tree(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data=iris)



# ● ROCR ----------------------------------------------------------
library( )
 

# performance(pred,"auc")@y.values


# ● 예측결과 ----------------------------------------------------------
#rm(list=ls())
x=c(3,4,4,6,4,7,9,10,11,11)
y=c(11,13,12,19,13,22,28,32,36,32)

temp = data.frame(x,y)
A=lm(y~x, data=temp)


# 다른 방법 
data.frame(x=5)
temp2 = data.frame(x=5)
predict(A, newdata = temp2)

temp2 = data.frame(x=8)
predict(A, newdata = temp2)



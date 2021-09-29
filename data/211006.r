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

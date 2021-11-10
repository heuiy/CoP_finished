
## ☎ 데이터 불러오기

# * 데이터 출처 : 익산공장 장현준 사원

library('readxl')

df_raw = read_excel("data/PFS2.xlsx")

df = df_raw

head(df, 3)

## ☎ 공정능력 분석

# [공정능력분석](https://www.evernote.com/shard/s230/sh/dbd6d7ee-a15d-4df0-a7a3-047704c9e5f9/913f4c7ad89f20399a2bb3c32f69f4fb)

### ♫ 열 쌓기

library(dplyr)

# install.packages("tidyverse")

library(tidyverse)

library(tidyr)

colnames(df)

ca_fill_1 <- df %>%
    select(r1_1, r1_2, r1_3, r1_4, r1_5, r1_6, r1_7, r1_8) %>%
    na.omit() %>%
    gather(key = "recipe_1", value = "fill_1", r1_1, r1_2, r1_3, r1_4, r1_5, r1_6, r1_7, r1_8)

ca_fill_2 <- df %>%
    select(r2_1, r2_2, r2_3, r2_4, r2_5, r2_6, r2_7, r2_8) %>%
    na.omit() %>%
    gather(key = "recipe_2", value = "fill_2", r2_1, r2_2, r2_3, r2_4, r2_5, r2_6, r2_7, r2_8)

ca_fill_3 <- df %>%
    select(r3_1, r3_2, r3_3, r3_4, r3_5, r3_6, r3_7, r3_8) %>%
    na.omit() %>%
    gather(key = "recipe_3", value = "fill_3", r3_1, r3_2, r3_3, r3_4, r3_5, r3_6, r3_7, r3_8)

ca_fill_4 <- df %>%
    select(r4_1, r4_2, r4_3, r4_4, r4_5, r4_6, r4_7, r4_8) %>%
    na.omit() %>%
    gather(key = "recipe_4", value = "fill_4", r4_1, r4_2, r4_3, r4_4, r4_5, r4_6, r4_7, r4_8)

### ♫ SixSigma

# install.packages("SixSigma")

library(SixSigma)

ss.study.ca(xST = ca_fill_1$fill_1, LSL = 5.147, USL = 5.253, Target = 5.2)
ss.study.ca(xST = ca_fill_2$fill_2, LSL = 5.147, USL = 5.253, Target = 5.2)
ss.study.ca(xST = ca_fill_3$fill_3, LSL = 5.147, USL = 5.253, Target = 5.2)
ss.study.ca(xST = ca_fill_4$fill_4, LSL = 5.147, USL = 5.253, Target = 5.2)

### ♫ 공정 수준 비교

# 각 Recipe 별 공정 수준을 비교하시오.

"""
Cp(산포)
- Recipe 1 : 0.0516
- Recipe 2 : 0.0174
- Recipe 3 : 0.3125
- Recipe 4 : 0.1044

Cp 가 높을수록 프로세스 능력(기술력)이 우수함

CpK(공정 평균의 치우침 반영)
- Recipe 1 : -0.0155
- Recipe 2 : 0.0014
- Recipe 3 : -0.0588
- Recipe 4 : -0.1036

CpK 가 높을수록 관리력이 우수함
"""

## ☎ Boxplot

### ♫ 박스 그래프

# 각 Recipe 의 박스 그래프를 확인하세요.

par(mfrow=c(2,2))
boxplot(ca_fill_1$fill_1, horizontal = T)
boxplot(ca_fill_2$fill_2, horizontal = T)
boxplot(ca_fill_3$fill_3, horizontal = T)
boxplot(ca_fill_4$fill_4, horizontal = T)

### ♫ Q1 ~ Q5 확인

# Recipe 1 의 Q1 ~ Q5 의 값을 확인하시오.

boxplot.stats(ca_fill_1$fill_1)

boxplot.stats(ca_fill_1$fill_1)$stats[5]

summary(ca_fill_1$fill_1)

## ☎ Gage R&R

### ♫ 10개(4.8 ~ 5.7) 샘플 개별 9회씩 측정, 2인, 총 2회 반복 시행

# Specify the factors for appraisals
oper <- factor(rep(rep(1:2, each = 1), 90))

# Specify the factors for parts
fill <- factor(rep(seq(4.8, 5.7, 0.1), each = 18))

# Specify the factors for replicates
run <- factor(rep(1:9, 20))

# Specify the measured variable
weight <- c(5.509,4.772,4.831,4.853,5.037,4.76,4.753,4.75,4.751,4.708,4.756,4.787,4.798,4.723,4.729,4.772,4.754,4.746,
5.006,4.846,4.939,4.985,5.308,4.853,4.874,4.925,4.946,4.928,4.833,4.863,4.89,4.874,4.878,4.914,4.894,4.889,
6.507,4.903,5.223,4.985,5.293,4.881,4.926,4.928,4.944,4.932,4.889,4.901,4.904,4.886,4.904,4.9,4.888,4.912,
5.18,5.092,5.179,5.182,5.482,5.086,5.11,5.111,5.128,5.1,5.099,5.085,5.091,5.097,5.093,5.077,5.093,5.085,
5.318,5.261,5.18,5.308,5.495,5.192,5.192,5.227,5.23,5.219,5.202,5.22,5.208,5.189,5.177,5.218,5.207,5.188,
5.361,5.321,5.222,5.362,5.543,5.245,5.254,5.3,5.318,5.29,5.266,5.282,5.276,5.257,5.26,5.275,5.282,5.261,
5.301,5.261,5.209,7.843,5.849,5.214,5.208,5.219,5.242,5.249,5.173,5.219,5.22,5.236,5.21,5.212,5.23,5.202,
5.601,5.544,5.511,5.6,5.963,5.428,5.334,5.557,5.504,4.441,4.426,6.04,6.829,6.295,6.326,4.804,4.82,5.448,
5.867,5.856,5.47,5.494,5.469,5.45,5.463,5.812,5.885,5.513,5.534,5.475,5.462,5.462,5.815,5.895,5.511,5.525,
5.902,5.975,5.603,5.624,5.565,5.552,5.552,5.905,5.985,5.601,5.615,5.568,5.562,5.542,5.915,5.949,5.566,5.588)

# Build data frame
gage <- data.frame(oper, fill, run, weight)
gage %>% head(3)

# Perform Gage R&R Analysis 
my.rr <- ss.rr(var = weight,
               part = fill,
               appr = oper,
               data = gage,
               main = "Six Sigma Gage R&R Measure",
               sub = "PFS Project MSA")

## ☎ ANOVA

### ♫ 일원배치 분산분석 (One-way ANOVA)

anova_fill_1 <- df %>%
    select(r1_1, r1_2, r1_3, r1_4, r1_5, r1_6, r1_7, r1_8) %>%
    na.omit()

anova_fill_2 <- df %>%
    select(r2_1, r2_2, r2_3, r2_4, r2_5, r2_6, r2_7, r2_8) %>%
    na.omit()

anova_fill_3 <- df %>%
    select(r3_1, r3_2, r3_3, r3_4, r3_5, r3_6, r3_7, r3_8) %>%
    na.omit()

anova_fill_4 <- df %>%
    select(r4_1, r4_2, r4_3, r4_4, r4_5, r4_6, r4_7, r4_8) %>%
    na.omit()

result_r1 <- aov(r1_1 ~ r1_8, data =anova_fill_1)
result_r2 <- aov(r2_1 ~ r2_8, data =anova_fill_2)
result_r3 <- aov(r3_1 ~ r3_8, data =anova_fill_3)
result_r4 <- aov(r4_1 ~ r4_8, data =anova_fill_4)

summary(result_r1)
summary(result_r2)
summary(result_r3)
summary(result_r4)

## ☎ DoE

### ♫ SixSigma

# install.packages("SixSigma")

# Import SixSigma package
library(SixSigma)

# Design the experiment (2^3)
ExperimentDesign <- expand.grid(A = gl(2, 1, labels = c("-", "+")),
                           B = gl(2, 1, labels = c("-", "+")),
                           C = gl(2, 1, labels = c("-", "+")))

ExperimentDesign

# Randomize the experiment
set.seed(1303)
ExperimentDesign$ord <- sample(1:8, 8)
ExperimentDesign[order(ExperimentDesign$ord), ]

sample(1:45, 6)

# Create replicates
set.seed(1303)
ss.data.doe1 <- data.frame(repl = rep(1:2, each = 8),
                           rbind(ExperimentDesign))
ss.data.doe1

temp = abs(rnorm(n=16, mean = 0.5, sd = 1.5))

# Add responses
# ss.data.doe1$response <- c(5.33, 6.99, 4.23, 6.61,
#                         2.26, 5.75, 3.26, 6.24,
#                         5.7, 7.71, 5.13, 6.76,
#                         2.79, 4.57, 2.48, 6.18)

ss.data.doe1$response <- temp
ss.data.doe1

# Get the average score for each experiment design
aggregate(response ~ A + B + C,
          FUN = mean, data = ss.data.doe1)

# Get restuls
doe.model <- lm(response ~ A + B + C +
                  A * B + A * C + B * C +
                  A * B * C,
                data = ss.data.doe1)

# doe.model <- lm(response ~ A + B + C + D +
#                   A * B + A * C + A * D + B * C + B * D + C * D +
#                   A * B * C + A * B * D + A * C * D + B * C * D +
#                   A * B * C * D,
#                 data = ss.data.doe1)

summary(doe.model)

# Simplify the model by excluding nonsignificant effects
doe.model.2 <- lm(response ~ A + B ,
                  data = ss.data.doe1)
summary(doe.model.2)

# Obtain model's coefficients
coef(doe.model.2)

# Obtain estimations for all experimental conditions (including the replications)
predict(doe.model.2)

# Compute confidence interval for each factpr
confint(doe.model.2)

# Factor A Plot
plot(c(-1,1), ylim = range(ss.data.doe1$response),
     coef(doe.model)[1] + c(-1,1) * coef(doe.model)[2],
     type = "b", pch = 16)
abline(h = coef(doe.model)[1])

# Visualize the main effects in separate plots
prinEF <- data.frame(Factor = rep(c("A","B"),each = 2),
                      Level = rep(c(-1,1), 2),
                     Response = c(aggregate(response ~ A, FUN = mean, data = ss.data.doe1)[,2],
                                aggregate(response ~ B, FUN = mean, data = ss.data.doe1)[,2]))

library(ggplot2)
main_effects <- ggplot(prinEF,
             aes(x = Level, y = Response)) +
  geom_point() +
  geom_line() +
  scale_x_continuous(breaks = c(-1, 1)) +
  facet_grid(. ~ Factor)
main_effects

## ☎ QCC

### ♫ X-bar I

# 각 Recipe 의 관리도를 확인하시오.

install.packages("qcc")

library(qcc)

qcc(ca_fill_1$fill_1, type = "xbar.one")
qcc(ca_fill_2$fill_2, type = "xbar.one")
qcc(ca_fill_3$fill_3, type = "xbar.one")
qcc(ca_fill_4$fill_4, type = "xbar.one")


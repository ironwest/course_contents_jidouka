library(tidyverse)

#ここでは、本セクションでのパワーポイントファイルの生成に利用した関数を説明していきます。


#まず、科毎のデータを作成する関数を作成します。
create_data_for_ka <- function(
  number_of_patients,
  admission_to_outpatient_probability, 
  age_mean, age_sd, age_range, 
  male_to_female_probability, 
  out_income_mean_sd, 
  out_income_range,
  adm_income_mean_sd,
  adm_income_range){
  
  
  
  {
    # number_of_patients <- 100
    # admission_to_outpatient_probability <- c(0.1,0.9)
    # age_mean <- 70
    # age_sd <- 20
    # age_range <- c(10, 110)
    # 
    # male_to_female_probability <- c(0.5,0.5)
    # 
    # out_income_mean_sd <- c(1000, 300)
    # out_income_range   <- c(250, 10000)
    # 
    # adm_income_mean_sd <- c(7000, 3000)
    # adm_income_range <- c(1300, 50000)
  }
  
  
  dat <- tibble(
    patient_id = 1:number_of_patients,
    
    adm_out    = sample(
      x       = c("adm","out"), 
      size    = number_of_patients, 
      replace = TRUE, 
      prob    = admission_to_outpatient_probability),
    
    age = rnorm(
      n = number_of_patients, 
      mean = age_mean, 
      sd = age_sd
    ) %>% round(0),
    
    gender = sample(
      x = c("male","female"), 
      size = number_of_patients, 
      replace = TRUE, 
      prob = male_to_female_probability
    )
  )
  
  #年齢が一定の幅になるように補正
  dat <- dat %>% 
    mutate(
      age = if_else(age > max(age_range), 
                    max(age_range), 
                    age),
      age = if_else(age < min(age_range),
                    min(age_range),
                    age)
    )
  
  #外来と入院で場合分けして、収入データを生成
  
  dat <- dat %>% 
    mutate(
     income = map_int(adm_out, ~{
       if_else(
         . == "adm",
         rnorm(1, adm_income_mean_sd[1],
               adm_income_mean_sd[2]) %>% as.integer(.),
         rnorm(1, out_income_mean_sd[1],
               adm_income_mean_sd[2]) %>% as.integer(.) ) 
     })
    )
    
  #収入データを一定の範囲に収まるように修正
  dat <- dat %>% 
    mutate(
      income = map2(adm_out, income, ~{
        
        case_when(
          .x == "adm" & .y <= adm_income_range[1] ~ adm_income_range[1],
          .x == "adm" & .y >= adm_income_range[2] ~ adm_income_range[2],
          .x == "out" & .y <= out_income_range[1] ~ out_income_range[1],
          .x == "out" & .y >= out_income_range[2] ~ out_income_range[2],
          TRUE ~ as.double(.y)
        )
      })
    )
  
  #この結果を返す
  return(dat)
}


#科別の上記の関数に与えるデータを生成しましょう
result <- 
  tibble(ka_name = LETTERS[1:10]) %>% 
  mutate(
    number_of_patients = sample(250:900, 10),
    admout_prob1 = runif(10,0,1),
    admout_prob2 = 1 - admout_prob1,
    age_mean = sample(20:80,10),
    age_sd = runif(10,0,10),
    age_range1 = 0,
    age_range2 = 100,
    mTof_prob1 = runif(10,0,1),
    mTof_prob2 = 1 - mTof_prob1,
    outInc_mean = runif(10,100,5000),
    outInc_sd   = runif(10,0,1000),
    outInc_min  = 250 + outInc_mean,
    outInc_max  = 9999999,
    admInc_mean = runif(10,3000,100000),
    admInc_sd   = runif(10,0,10000),
    admInc_min  = 2500 + outInc_mean,
    admInc_max  = 9999999
  )
  
#View(result)

#では、保存用のデータを生成します

fin <- result %>% 
  group_by(ka_name) %>% 
  nest() %>% 
  mutate(generated = map(data, ~{
    attach(.)
    
    create_data_for_ka(
      number_of_patients = number_of_patients,
      admission_to_outpatient_probability = c(admout_prob1, admout_prob2), 
      age_mean = age_mean,
      age_sd = age_sd,
      age_range = c(age_range1, age_range2), 
      male_to_female_probability = c(mTof_prob1, mTof_prob2), 
      out_income_mean_sd = c(outInc_mean,outInc_sd), 
      out_income_range = c(outInc_min, outInc_max),
      adm_income_mean_sd = c(admInc_mean, admInc_sd),
      adm_income_range = c(admInc_min, admInc_max)
    ) %>% return()
    
  }))

fin <- fin %>% 
  select(ka_name, generated) %>% 
  unnest()

#保存しておきましょう
write_rds(fin, "example_data1.rds")

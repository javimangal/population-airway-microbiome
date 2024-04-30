subsetcondit <- data %>% 
  dplyr::select(
    c(
      "Biofuel_exposure",
      "Occupational_pollution",
      "Smoking_binary",
      "SHS_binary",
      "year2pm25",
      "Age",
      "BMI",
      "Medication",
      "Gender",
      "Airway_disease",
      "AMHI"
    )
  ) 


factor_recode_YesNo <- function(x)(as.numeric(fct_recode(x,"1" = "N","2" = "Y"))) 

subsetcondit <- subsetcondit %>% 
  mutate_at(
    c("Biofuel_exposure",
      "Occupational_pollution",
      "Smoking_binary",
      "SHS_binary",
      "Medication"),
    factor_recode_YesNo
  )

subsetcondit$Gender <- factor(subsetcondit$Gender)

correlations <- lavCor(
  subsetcondit,
  ordered=c(
    "Biofuel_exposure",
    "Occupational_pollution",
    "Smoking_binary",
    "SHS_binary",
    "Medication",
    "Airway_disease",
    "Gender"
  )
)


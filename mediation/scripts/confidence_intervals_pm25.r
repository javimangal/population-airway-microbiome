### Confidence intervals for the proportion mediated 

data_temp <- pm25

# Set seed for reproducibility
set.seed(2023)


# Define function to calculate total effect
calculate_total_effect <- function(data_temp) {
  model_total <- glm(
    Airway_disease ~ year2pm25, 
    weights = data_temp$weight1, 
    data = data_temp, 
    family = binomial(link = logit)
  )
  
  total_effect_exposure <- coef(model_total)["year2pm25"]
  return(total_effect_exposure)
}

# Define function to calculate direct effect
calculate_direct_effect <- function(data_temp) {
  model_both <- glm(
    Airway_disease ~ year2pm25 + AMHI, 
    weights = data_temp$weight, 
    data = data_temp, 
    family = binomial(link = logit)
  )
  
  direct_effect_exposure <- coef(model_both)["year2pm25"]
  return(direct_effect_exposure)
}

# Define function to calculate proportion mediated
calculate_proportion_mediated <- function(direct_effect_exposure, total_effect_exposure) {
  proportion_mediated <- 1 - (direct_effect_exposure / total_effect_exposure)
  return(proportion_mediated)
}

# Bootstrap function
boot_fun <- function(data_temp, indices) {
  total_effect_exposure <- calculate_total_effect(data_temp[indices, ])
  direct_effect_exposure <- calculate_direct_effect(data_temp[indices, ])
  calculate_proportion_mediated(direct_effect_exposure, total_effect_exposure)
}

# Run bootstrap
boot_results <- boot(data = data_temp, statistic = boot_fun, R = 10000)

# Calculate 95% confidence interval
conf_interval <- boot.ci(boot_results, type = "all")


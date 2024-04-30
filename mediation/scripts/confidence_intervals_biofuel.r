### Confidence intervals for the proportion mediated 

data_temp <- biofuel

# Set seed for reproducibility
set.seed(2023)


# Define function to calculate total effect
calculate_total_effect <- function(data_temp) {
  model_total <- glm(
    Airway_disease ~ Biofuel_exposure, 
    weights = data_temp$weight1, 
    data = data_temp, 
    family = binomial(link = logit)
  )
  
  total_effect_exposure <- coef(model_total)["Biofuel_exposure2"]
  return(total_effect_exposure)
}

# Define function to calculate direct effect
calculate_direct_effect <- function(data_temp) {
  model_both <- glm(
    Airway_disease ~ Biofuel_exposure + AMHI, 
    weights = data_temp$weight, 
    data = data_temp, 
    family = binomial(link = logit)
  )
  
  direct_effect_exposure <- coef(model_both)["Biofuel_exposure2"]
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


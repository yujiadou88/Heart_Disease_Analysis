# Load packages
library(readr)
library(here)

# Read in data
data_hd_cleaned <- read.csv(here::here("Data","data_hd_cleaned.csv"),
                            check.names = FALSE)

# Fit a binomial glm model
data_hd_cleaned$Heart.Disease.Status01 <- 
  ifelse(data_hd_cleaned$`Heart Disease Status`=="No",0,1)

glm_model <- glm(Heart.Disease.Status01 ~ Age + Gender + `Exercise Habits` + 
                   `Blood Pressure` + Smoking + `Alcohol Consumption` + 
                   `Sugar Consumption` + `Stress Level` + `Sleep Hours` + 
                   `Family Heart Disease` + `Blood Pressure` + `Cholesterol Level`,
                 data = data_hd_cleaned,
                 family = binomial)

# Reduce the model using backward selection
reduced_model <- step(glm_model, direction = "backward")


# Extract and save model results
summary_out <- summary(reduced_model)

coef_table <- coef(summary_out)

odds_ratios <- exp(coef(reduced_model))
confint_vals <- exp(confint(reduced_model))

results_table <- cbind(
  Estimate = coef_table[, "Estimate"],
  `Std. Error` = coef_table[, "Std. Error"],
  `z value` = coef_table[, "z value"],
  `Pr(>|z|)` = coef_table[, "Pr(>|z|)"],
  `Odds Ratio` = odds_ratios,
  `2.5 %` = confint_vals[, 1],
  `97.5 %` = confint_vals[, 2]
)

results_table <- round(results_table, 3)

write.csv(results_table, here("Output/model_results.csv"), row.names = TRUE)

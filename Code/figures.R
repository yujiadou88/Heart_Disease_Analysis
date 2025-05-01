library(ggplot2)
library(here)
library(readr)
library(scales)

data_hd_cleaned <- read.csv(here::here("Data","data_hd_cleaned.csv"),
                            check.names = FALSE)

# Stress Level by Heart Disease Status
fig1 <- ggplot(data_hd_cleaned, aes(x = `Stress Level`, fill = `Heart Disease Status`)) +
  geom_bar(position = "fill") +
  scale_y_continuous(labels = percent) +
  labs(title = "Comparison of Heart Disease Status by Stress Level",
       x = "Stress Level",
       y = "%") +
  theme_minimal()

ggsave(filename = here::here("Output", "stress_level_plot.png"), plot = fig1, width = 6, height = 4)

# Plot:Cholesterol Level by Heart Disease Stauts
fig2 <- ggplot(data_hd_cleaned, aes(x = `Heart Disease Status`, y = `Cholesterol Level`, fill = `Heart Disease Status`)) +
  geom_boxplot() +
  labs(title = "Cholesterol Levels by Heart Disease Status",
       x = "Heart Disease Status",
       y = "Cholesterol Level") +
  theme_minimal()

ggsave(filename = here::here("Output", "cholesterol_level_plot.png"), plot = fig2, width = 6, height = 4)

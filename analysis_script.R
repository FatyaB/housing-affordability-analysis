install.packages("tidyverse")
library(tidyverse)
library(readxl)
library(dplyr)
# Reading the imported .xlsx file with the dataset into a dataframe 
housing_data <- read_excel("Housing Affordability Data Collection.xlsx")
# Cleaning the data: Renaming columns to standardized, clean names.
housing_data_stacked <- housing_data %>%
  rename(Rent_Amount = Rent_1_Amount,
         Source_Rent = Source_Rent_1,
         rent_to_income_ratio = `Rent to Income ratio`) %>% 
#Clean up city names  
  mutate(City =case_when(City == "Grande Lisboa" ~ "Lisbon",
                         City == "Comunidad de Madrid" ~ "Madrid",
                         City == "Warszawski stoĹeczny" ~ "Warsaw",TRUE ~ City))
# Calculating the Disposable Income
housing_data_stacked <- housing_data_stacked %>%
  mutate(Disposable_Income = Monthly_Net_Income_EUR-Rent_Amount)
head(housing_data_stacked)
# Transforming the data from wide to long
housing_data_long_stacked <- housing_data_stacked %>%
  pivot_longer(
    cols = c(Disposable_Income,Rent_Amount),
    names_to = 'Metrics',
    values_to = 'Amount_EUR'
  ) %>% mutate(Metrics = factor(Metrics, levels = c("Disposable_Income", "Rent_Amount")))
# Plotting the chart using a difference bar chart:
housing_plot <- ggplot(data = housing_data_long_stacked)+
  geom_col(mapping = aes(x=City,y=Amount_EUR,fill=Metrics))+
  geom_text(data = housing_data_stacked, aes(x = City, y = Monthly_Net_Income_EUR + 150, 
                                             label = paste0(round(rent_to_income_ratio * 100, 0), "%")),
            color = "black",
            fontface = "bold",
            size = 4
  ) + 
  # Defining labels
  labs(title = "Rental Affordability in 5 Major EU capitals: Rent as % of Monthly Net Income",
       subtitle = "The bar height shows Total Monthly Net Income. The red segment stands for Monthly Rent.",
       x = "City",
       y = "Monthly Amount (€)",
       fill = "Share of Income",
       caption = "Data Sources:\n 1. Eurostat - Income of households by NUTS 2 region\n 2. Eurostat - 2022 Current Market Rents") +
  scale_fill_manual(
    labels = c("Disposable Income","Monthly Rent"),
    values = c("Disposable_Income"="#A8DADC", "Rent_Amount"="red")) +
  # Adding extra space in the plot for labels 
  scale_y_continuous(expand = expansion(mult =c(0, 0.15)))+ 
  theme_minimal()+
  theme(plot.caption = element_text(hjust = 0, size = 8))
housing_plot
# Documentation and Report generation
install.packages("rmarkdown")
install.packages("knitr")
library(rmarkdown)
library(knitr)
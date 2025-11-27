---
title: "README"
output: html_document
---

Rental Affordability Analysis: A Comparison of Five European Capital Cities (2022)

Project Goal

This analysis investigates the rental affordability crisis across five major European capital cities by calculating the Rent-to-Income Ratio for an average single-person household. The goal is to determine which city presents the most economically sensible option for a working professional based on housing costs versus net monthly income.

Key Insights & Findings

The Outlier: Lisbon stands as the definitive affordability outlier, consuming a shocking 76% of the average monthly net income for a 1-bedroom apartment.

Most Favorable: Madrid and Berlin showed the most favorable affordability, requiring approximately 46-47% of net income, establishing them as the best options within the tested sample.

Income Paradox: The analysis revealed that higher absolute income (e.g., Berlin) does not guarantee proportionally higher affordability compared to cities with lower incomes (e.g., Budapest), emphasizing the criticality of the Rent-to-Income Ratio.

Visualization: The findings are presented using a custom Difference Stacked Bar Chart that clearly visualizes the rent burden on top of the disposable income base.

Data and Methodology

Data Sources: Eurostat (Household Income by NUTS 2 region) and Eurostat (Current Market Rents Report). All data is sourced for 2022.

Metrics Calculated: Monthly Net Income, Rent-to-Income Ratio, and Disposable Income.

Tools: The entire analysis pipeline???from data cleaning and transformation (using dplyr) to visualization (using ggplot2)???was conducted in R.

Reproducibility: The analysis is fully detailed in the Rental_Affordability_Report.Rmd file.

View the Full Report

The complete, knitted HTML report, including all code, methodology, and the final visualization, is available HERE.

Repository Contents

Rental_Affordability_Report.Rmd: The complete R Markdown source file.

Rental_Affordability_Report.html: The final knitted report document (Recommended viewing).

Housing Affordability Data Collection.xlsx: The raw input data used for the analysis.
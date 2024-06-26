## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(dpm.lpa)

## ----import_data--------------------------------------------------------------
data(lpa_example_data)

## ----fit_model_v2, cache = TRUE-----------------------------------------------
x_v2 = lpa_example_data[, c('wcst', 'stroop', 'trail_making', 'nback_digit')] # drop nback_picture
x_v2$trail_making = log(x_v2$trail_making) # log-transform trail_making
x_v2 = as.data.frame(scale(x_v2)) # scale, i.e. z-score
fitted_lpa_v2 = fit_dpm_lpa(x = x_v2)

## ----run_outcome_analysis-----------------------------------------------------
result = outcome_analysis_normal(model = fitted_lpa_v2,
                                 y = lpa_example_data[, c('math', 'reading', 'gym')])

## ----bayes_factors------------------------------------------------------------
result$bayes_factors

## ----outcome_plot-------------------------------------------------------------
result$plot

## -----------------------------------------------------------------------------
result$plot_df


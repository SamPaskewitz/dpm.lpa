## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>")

## ----setup--------------------------------------------------------------------
library(dpm.lpa)
# To build: devtools::build_vignettes()

## ----update_python_packages---------------------------------------------------
#update_python_packages()

## ----import_data--------------------------------------------------------------
data(lpa_example_data)

## ----fit_model----------------------------------------------------------------
fitted_lpa = fit_dpm_lpa(x = lpa_example_data[, c('wcst', 'stroop', 'trail_making', 'nback_digit', 'nback_picture')])

## ----residuals----------------------------------------------------------------
plot_lpa_residuals(fitted_lpa)

## -----------------------------------------------------------------------------
lpa_residual_correlations(fitted_lpa)

## -----------------------------------------------------------------------------
x_v2 = lpa_example_data[, c('wcst', 'stroop', 'trail_making', 'nback_digit')] # drop nback_picture
x_v2$trail_making = log(x_v2$trail_making) # log-transform trail_making
x_v2 = as.data.frame(scale(x_v2)) # scale, i.e. z-score

## ----fit_model_v2-------------------------------------------------------------
fitted_lpa_v2 = fit_dpm_lpa(x = x_v2)

## -----------------------------------------------------------------------------
plot_lpa_residuals(fitted_lpa_v2)

## -----------------------------------------------------------------------------
lpa_residual_correlations(fitted_lpa_v2)

## ----print_summary------------------------------------------------------------
print_lpa_summary(fitted_lpa_v2)

## ----profile_means------------------------------------------------------------
plot_profile_means(fitted_lpa_v2)

## ----profile_base_rates, warning=FALSE----------------------------------------
plot_profile_probs(fitted_lpa_v2)

## -----------------------------------------------------------------------------
profiles = extract_profiles(fitted_lpa_v2)
head(profiles)

## -----------------------------------------------------------------------------
soft_profiles = extract_profiles(fitted_lpa_v2, profile_probs = TRUE)
head(soft_profiles)


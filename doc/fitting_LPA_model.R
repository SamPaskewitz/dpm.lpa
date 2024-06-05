## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(dpm.lpa)
# To build: devtools::build_vignettes()

## -----------------------------------------------------------------------------
# update_python_packages()

## -----------------------------------------------------------------------------
data(iris)#read.csv("data/LPA example data.csv", row.names = 1)
x = data.frame(scale(iris[, c('Sepal.Width', 'Petal.Width')]))

## ----warning=FALSE------------------------------------------------------------
fitted_lpa = fit_dpm_lpa(x = x,
                         restarts = 10)

## ----print_summary, warning=FALSE---------------------------------------------
print_lpa_summary(fitted_lpa)

## ----residuals, warning=FALSE, fig.show='hide'--------------------------------
plot_lpa_residuals(fitted_lpa)$show()

## ----profile_means, warning=FALSE---------------------------------------------
plot_profile_means(fitted_lpa)$show()

## ----profile_base_rates, warning=FALSE----------------------------------------
# FIX THIS (START FROM 1 NOT WORKING; need to check that the Python code works properly, then upload that to PyPi, then update the downloaded version here)
plot_profile_probs(fitted_lpa, start_profile_labels_from1 = FALSE)$show()

## ----profile_similarity, warning=FALSE----------------------------------------
profile_similarity(model = fitted_lpa)$plot$show()

## ----run_outcome_analysis, warning=FALSE--------------------------------------
result = outcome_analysis_normal(model = fitted_lpa,
                                 #y = data.frame(matrix(rnorm(n = 2*150), nrow = 150, ncol = 2)))
                                 y = data.frame(y1 = rnorm(n = 150), y2 = rnorm(n = 150)))
                        #y = data.frame(scale(as.numeric(iris$Sepal.Length))))

## ----bayes_factors, warning=FALSE---------------------------------------------
result$bayes_factors

## ----outcome_plot-------------------------------------------------------------
result$plot$show()

## -----------------------------------------------------------------------------
hist(rnorm(100))


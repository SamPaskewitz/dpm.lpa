update_python_packages <- function() {
  reticulate::conda_install(envname = 'r-dpm_lpa',
                            packages = c('numpy', 'scipy', 'pandas', 'vbayesfa', 'plotnine'),
                            pip = TRUE,
                            pip_options = '--upgrade')
}

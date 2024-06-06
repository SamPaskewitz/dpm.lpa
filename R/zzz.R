lpa <- NULL

.onLoad <- function(libname, pkgname) { # This is run every time the R package is loaded.
  try(reticulate::install_miniconda(), silent = TRUE) # Install Miniconda if it isn't already installed.
  if(!('r-dpm_lpa' %in% reticulate::conda_list()$name)){
    # If it doesn't already exist, create the r-dpm_lpa conda environment and
    # import necessary Python packages. This should only happen the first time the
    # R package is loaded.
    reticulate::conda_create(envname = 'r-dpm_lpa',
                             packages = c('numpy', 'scipy', 'pandas'))
    reticulate::conda_install(envname = 'r-dpm_lpa',
                              packages = c('vbayesfa', 'plotnine'),
                              pip = TRUE)
  }
  reticulate::use_condaenv('r-dpm_lpa') # Activate the r-dpm_lpa conda environment.
  lpa <<- reticulate::import('vbayesfa') # Import the vbayesfa Python package.
}

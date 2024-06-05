lpa <- NULL

.onLoad <- function(libname, pkgname) {
  if(!('r-dpm_lpa' %in% reticulate::conda_list()$name)){
    reticulate::conda_create(envname = 'r-dpm_lpa',
                             packages = c('numpy', 'scipy', 'pandas'))
    reticulate::conda_install(envname = 'r-dpm_lpa',
                              packages = c('vbayesfa', 'plotnine'),
                              pip = TRUE)
  }
  reticulate::use_condaenv('r-dpm_lpa')
  lpa <<- reticulate::import('vbayesfa')
}

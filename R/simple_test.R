simple_test = function(){
  z_true = sample(1:2, size = 2000, replace = TRUE, prob = c(0.6, 0.4))
  mu = matrix(0.0, nrow = 2, ncol = 5)
  mu[1, ] = c(1, 0, -1, 1, 2)
  mu[2, ] = c(-1, 1, -1, -1, 0)
  x = data.frame(matrix(0.0, nrow = 2000, ncol = 5))
  for(i in 1:2000){
    x[i, ] = rnorm(n = 5, mean = mu[z_true[i], ], sd = 0.5)
  }
  foo = fit_dpm_lpa(x)
  foo$print_summary()
  foo$plot_profile_means()
}

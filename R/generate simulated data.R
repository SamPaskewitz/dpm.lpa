# true latent profiles
true_profile = c(rep(1, 100), rep(2, 60), rep(3, 40))

# profile means
mu = matrix(nrow = 4, ncol = 3)
mu[,1] = rep(0, 4) # profile 1
mu[,2] = c(-2, -2, 0, 0) # profile 2
mu[,3] = c(0, 0, 1, 2.5) # profile 3

# simulated data
lpa_example_data = data.frame(wcst = rep(0.0, 200),
                              stroop = rep(0.0, 200),
                              trail_making = rep(0.0, 200),
                              nback_digit = rep(0.0, 200),
                              nback_picture = rep(0.0, 200),
                              row.names = paste0('ID_', 1:200))
for(j in 1:4){
  lpa_example_data[,j] = rnorm(n = 200, mean = mu[j, true_profile], sd = 1)
  # fix lpa_example_data up later to make more realistic
}
lpa_example_data[, 'trail_making'] = exp(lpa_example_data[, 'trail_making']) # make trail_making right skewed
lpa_example_data[, 'nback_picture'] = lpa_example_data[, 'nback_digit'] + rnorm(n = 200, sd = 0.2) # make nback_picture highly correlated with nback_digit

# profile means for outcome variables
mu_y = matrix(nrow = 3, ncol = 3)
mu_y[,1] = c(0, 0, 0) # profile 1
mu_y[,2] = c(-1.5, 0, 0) # profile 2
mu_y[,3] = c(1.5, 0.75, 0) # profile 3

# add simulated outcome data
y_names = c('math', 'reading', 'gym')
for(j in 1:3){
  lpa_example_data[, y_names[j]] = rnorm(n = 200, mean = mu_y[j, true_profile], sd = 1)
}

# finish up
lpa_example_data = round(lpa_example_data, 2)
#usethis::use_data(lpa_example_data, overwrite = TRUE)

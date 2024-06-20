fit_dpm_lpa = function(x,
                       n_workers = 4,
                       kmeans = FALSE,
                       restarts = 50,
                       truncation_level = 20,
                       prior_w1 = 3.0,
                       prior_w2 = 1.0,
                       prior_lambda_mu = 0.5,
                       prior_strength_for_xi = 10.0,
                       seed = 1234,
                       tolerance = 1e-05,
                       max_iter = 50,
                       min_iter = 30,
                       standardize_data = TRUE){
  if(standardize_data){
    x = as.data.frame(scale(x))
  }
  result = lpa$fit_lpa$fit_lpa(x, as.integer(n_workers), kmeans, as.integer(restarts), as.integer(truncation_level), prior_w1, prior_w2, prior_lambda_mu, prior_strength_for_xi, as.integer(seed), tolerance, as.integer(max_iter), as.integer(min_iter))
  best_model = result$best_model
  best_model$x_names_R = colnames(x) # there's some SNAFU about accessing best_model.x_names in R
  return(best_model)
}

profile_similarity = function(model,
                              figure_size = c(4, 3),
                              font_size = 11,
                              start_profile_labels_from1 = TRUE){
  return(model$profile_similarity(figure_size, font_size, start_profile_labels_from1))
}

plot_profile_probs = function(model,
                              figure_size = c(4, 3),
                              font_size = 11,
                              start_profile_labels_from1 = TRUE){
  return(model$plot_profile_probs(figure_size, font_size, start_profile_labels_from1)$show())
}

plot_profile_means = function(model,
                              figure_size = c(4, 3),
                              font_size = 11,
                              kind = 'bar',
                              facet_var = 'profile',
                              ncol = 4,
                              fancy_labels = TRUE,
                              start_profile_labels_from1 = TRUE){
  return(model$plot_profile_means(figure_size, font_size, kind, facet_var, ncol, fancy_labels, start_profile_labels_from1)$show())
}

plot_lpa_residuals = function(model,
                              figure_size = c(4, 3),
                              font_size = 11,
                              ncol = 4,
                              bins = 20){
  return(model$plot_residuals(figure_size, font_size, ncol, bins)$show())
}

lpa_residual_correlations = function(model,
                                     round_decimal = 2){
  return(model$residual_correlations(round_decimal = as.integer(round_decimal)))
}

print_lpa_summary = function(model,
                             start_profile_labels_from1 = TRUE){
  return(model$print_summary(start_profile_labels_from1))
}

outcome_analysis_normal = function(model,
                                   y,
                                   profile_labels = NULL,
                                   do_post_hoc = TRUE,
                                   start_profile_labels_from1 = TRUE,
                                   prior_alpha = 1.0,
                                   prior_beta = 1.0,
                                   prior_m = 0.0,
                                   prior_lambda = 1.0,
                                   figure_size = c(5, 6),
                                   font_size = 11,
                                   facet_var = 'variable',
                                   ncol = 4,
                                   standardize_data = TRUE){
  if(standardize_data){
    y = as.data.frame(scale(y))
  }
  result = lpa$lpa_outcome_analysis$fit_y_normal(model, y, profile_labels, do_post_hoc, start_profile_labels_from1, prior_alpha, prior_beta, prior_m, prior_lambda, figure_size, font_size, facet_var, ncol)
  rownames(result$bayes_factors) = colnames(y) # for some reason, the variable names are dropped, so I need to add them back in
  result$bayes_factors$bf10 = round(as.numeric(result$bayes_factors$bf10), 2) # need to fix column types to get things to display properly
  result$bayes_factors$log10_bf10 = round(as.numeric(result$bayes_factors$log10_bf10), 2)
  result$bayes_factors$post_hoc_result = as.character(result$bayes_factors$post_hoc_result)
  print(result$bayes_factors)
  return(result)
}

extract_profiles = function(model,
                            start_profile_labels_from1 = TRUE,
                            profile_probs = FALSE,
                            include_x = FALSE){
  if(profile_probs){
    profile_df = as.data.frame(t(model$sorted_phi))
    colnames(profile_df) = paste0('P(profile ',
                                 0:(model$n_profiles - 1) + start_profile_labels_from1,
                                 ')')
    rownames(profile_df) = model$index
  }
  else{
    profile_df = data.frame(profile = model$z_hat + start_profile_labels_from1,
                            row.names = model$index)
  }

  if(include_x){
    x_df = t(model$x)
    colnames(x_df) = model$x_names_R
    rownames(x_df) = model$index
    profile_df = cbind(x_df, profile_df)
  }

  return(profile_df)
}

# add outcome_analysis_binary to wrap the corresponding Python function

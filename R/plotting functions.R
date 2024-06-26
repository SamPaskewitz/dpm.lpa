plot_profile_probs = function(model,
                              font_size = 11,
                              start_profile_labels_from1 = TRUE){
  # Creating plot_df
  plot_df = data.frame(
    profile = 0:(model$n_profiles - 1),
    pi = model$prop_per_profile
  )

  # Adjusting profile labels based on start_profile_labels_from1
  if (start_profile_labels_from1) {
    plot_df$profile = plot_df$profile + 1
  }

  # Convert profile to character type for plotting
  plot_df$profile = as.character(plot_df$profile)

  # Creating the plot using ggplot2
  plot = ggplot(plot_df, aes(x = profile, y = pi)) +
    geom_bar(stat = "identity") +
    theme_classic(base_size = font_size)

  return(plot)
}

plot_profile_means = function(model,
                              font_size = 11,
                              kind = 'bar',
                              facet_var = 'profile',
                              ncol = 4,
                              fancy_labels = TRUE,
                              start_profile_labels_from1 = TRUE){

  # Create a dataframe for plot data
  plot_df = model$profile_means_ci(fancy_labels = fancy_labels*(facet_var %in% c('profile', 'profile (flipped)')),
                                   start_profile_labels_from1 = start_profile_labels_from1)

  # Make the plot
  if (facet_var %in% c('profile', 'profile (flipped)')) {
    plot = ggplot(plot_df, aes(x = variable, y = mu, ymin = mu_plus, ymax = mu_minus)) +
      geom_bar(stat = 'identity')
  } else if (facet_var == 'variable') {
    plot = ggplot(plot_df, aes(x = profile, y = mu, ymin = mu_plus, ymax = mu_minus)) +
      geom_bar(stat = 'identity')
  }

  if (kind == 'bar') {
    plot = plot + geom_bar(stat = 'identity')
  } else if (kind == 'point') {
    plot = plot + geom_point() +
      geom_hline(yintercept = 0, linetype = 'dashed')
  } else if (kind == 'point_and_errorbar') {
    plot = plot + geom_point() +
      geom_errorbar() +
      geom_hline(yintercept = 0, linetype = 'dashed')
  }

  plot = plot +
    theme_classic(base_size = font_size)

  if (facet_var == 'profile') {
    plot = plot +
      facet_wrap(~profile, scales = 'free_x', ncol = ncol) +
      theme(axis.text.x = element_text(angle = 90, hjust = 1))
  } else if (facet_var == 'profile (flipped)') {
    plot = plot +
      coord_flip() +
      facet_wrap(~profile, scales = 'free_y', ncol = ncol)
  } else if (facet_var == 'variable') {
    plot = plot +
      facet_wrap(~variable, scales = 'free_x', ncol = ncol)
  }

  return(plot)
}

plot_lpa_residuals = function(model,
                              font_size = 11,
                              ncol = 4,
                              bins = 20){

  # Create a data frame for residuals
  residuals = model$compute_residuals()
  rdf = stack(residuals)
  colnames(rdf) = c('residuals', 'variable')

  # Plot histograms of residuals
  plot = ggplot(rdf, aes(x = residuals, y = after_stat(density))) +
    geom_histogram(bins = bins, fill = 'gray') +
    facet_wrap(~ variable, scales = 'free', ncol = ncol) +
    theme_classic(base_size = font_size)

  # Add normal density plots for comparison
  r_values = seq(-3, 3, by = 0.01)
  pdf_df_list = list()

  for (var in unique(rdf$variable)) {
    r = rdf$residuals[rdf$variable == var]
    m = mean(r, na.rm = TRUE)
    s = sd(r, na.rm = TRUE)
    norm_pdf = dnorm(r_values, mean = m, sd = s)
    pdf_df_list[[var]] = data.frame(variable = var, x = r_values, norm_pdf = norm_pdf)
  }

  pdf_df = do.call(rbind, pdf_df_list)
  plot = plot +
    geom_line(aes(x = x, y = norm_pdf, color = 'blue'), data = pdf_df)

  return(plot)
}

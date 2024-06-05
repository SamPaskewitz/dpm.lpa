\name{plot_profile_means}
\alias{plot_profile_means}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot latent profile means.}
\description{Plot latent profile means.}
\usage{
plot_profile_means(model, figure_size = c(6, 5), font_size = 11, kind = "bar", facet_var = "profile", ncol = 4, fancy_labels = TRUE, start_profile_labels_from1 = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model}{DPM-LPA model object.}
  \item{figure_size}{Size of plots.}
  \item{font_size}{Font size for plots.}
  \item{kind}{Type of plot. Options are 'bar', 'point', and 'point_and_errorbar'.}
  \item{facet_var}{Faceting variable for plots.}
  \item{ncol}{Number of columns to use in plots.}
  \item{fancy_labels}{If True, then profile labels are formatted like "profile 2 (19\)", giving the percent of people/observations in that profile.}
  \item{start_profile_labels_from1}{Whether to label latent profiles starting from 0 (Python style) or from 1 (R/Matlab/ordinary counting style). This only affects output labeling, not any calculations.}
}
\value{Plots of profile means.}
\author{Samuel Paskewitz}

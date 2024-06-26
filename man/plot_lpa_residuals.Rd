\name{plot_lpa_residuals}
\alias{plot_lpa_residuals}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot residuals (actual observations - posterior mean predicted observations).}
\description{Plot residuals (actual observations - posterior mean predicted observations).}
\usage{
plot_lpa_residuals(model, font_size = 11, ncol = 4, bins = 20)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model}{DPM-LPA model object.}
  \item{font_size}{Font size for plots.}
  \item{ncol}{Number of columns to use in plots.}
  \item{bins}{Number of bins for histograms.}
}
\details{Technically the residuals are random variables (because we're doing Bayesian stats) and we are plotting their means. This plots a density histogram of residuals for each variable, plus the corresponding normal distribution (same mean and variance as the residuals) for comparison (as a blue line).}
\value{Plots of residual histograms, facetted by variable.}
\author{Samuel Paskewitz}

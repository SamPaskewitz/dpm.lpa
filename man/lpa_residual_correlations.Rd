\name{lpa_residual_correlations}
\alias{lpa_residual_correlations}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Compute correlations of data residuals.}
\description{
Compute correlations of data residuals
        (actual observations - posterior mean predicted observations).
}
\usage{
lpa_residual_correlations(model, round_decimal = 2)
}
\arguments{
  \item{model}{DPM-LPA model object.}
  \item{round_decimal}{If an integer, then the number of places to round the
            correlation matrix. If NULL, then the matrix is not rounded.
            The default of two decimal places is there purely for convenience.}
}
\value{Matrix of residual correlations.}
\author{Sam Paskewitz}

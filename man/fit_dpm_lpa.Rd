\name{fit_dpm_lpa}
\alias{fit_dpm_lpa}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Fit a Dirichlet process mixture LPA model.}
\description{
  Fit a Dirichlet process latent profile analysis (DPM-LPA) model using mean
  field variational Bayes.
}
\usage{
fit_dpm_lpa(x, starting_hpar = NULL, n_workers = 4, restarts = 4, truncation_level = 20, prior_w1 = 3, prior_w2 = 1, prior_lambda_mu = 0.5, prior_strength_for_xi = 10, seed = 1234, tolerance = 1e-05, max_iter = 50, min_iter = 30)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
  Observed data (data frame).
}
  \item{n_workers}{
  Number of workers in the pool for parallel processing; should be less than or
  equal to the number of available CPUs.
}
  \item{restarts}{
  Number of random restarts.
}
  \item{truncation_level}{
  Truncation level of the variational approximation. Note that this argument is
  called 'T' in the Python code, but that designates 'TRUE' in R, so I renamed
  it.
}
  \item{prior_w1}{
  First prior hyperparameter on alpha.
}
  \item{prior_w2}{
  Second prior hyperparameter on alpha.
}
  \item{prior_lambda_mu}{
  Controls the width of the prior distribution on mu: higher values -> tighter
  prior around 0.
}
  \item{prior_strength_for_xi}{
  Controls the strength of the gamma prior distribution on xi.
  This prior is assumed to have a mean of 1, with alpha = prior_strength_for_xi/2
  and beta = prior_strength_for_xi/2.
}
  \item{seed}{
  Random seed (determines starting conditions of each optimization).
}
  \item{tolerance}{
  Relative change in the ELBO at which the optimization should stop.
}
  \item{max_iter}{
  Maximum number of iterations to run the optimization.
}
  \item{min_iter}{
  Minimum number of iterations to run the optimization.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
  A fitted lpa_model Python object.
}
\author{Sam Paskewitz}
\note{
  This is a wrapper for the fit_lpa function in the fit_lpa.py Python module.
  Unlike that function, this just returns the best fitting model, and not the
  models with the other random restarts.
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.

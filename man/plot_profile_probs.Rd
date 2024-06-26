\name{plot_profile_probs}
\alias{plot_profile_probs}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot estimated profile probabilities (pi).}
\description{Plot estimated profile probabilities (pi).}
\usage{
plot_profile_probs(model, start_profile_labels_from1 = TRUE)
}
\arguments{
  \item{model}{DPM-LPA model object.}
  \item{font_size}{Font size for plots.}
  \item{start_profile_labels_from1}{Whether to label latent profiles starting from 0 (Python style) or from 1 (R/Matlab/ordinary counting style). This only affects output labeling, not any calculations.}
}
\value{A bar plot of estimated latent profile probabilities. This is simply the proportion of participants assigned to each profile (by "hard" assignment).}
\author{Samuel Paskewitz}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.

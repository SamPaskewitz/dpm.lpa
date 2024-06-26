\name{extract_profiles}
\alias{extract_profiles}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Extract participants' inferred latent profiles into a data frame.}
\description{
Extract participants' inferred latent profiles into a data frame. This can then be combined with another data frame or saved (e.g. as a .csv file) for later analysis.
}
\usage{
extract_profiles(model, start_profile_labels_from1 = TRUE, profile_probs = FALSE)
}
\arguments{
  \item{model}{DPM-LPA model object.}
  \item{start_profile_labels_from1}{Whether to label latent profiles starting from 0 (Python style) or from 1 (R/Matlab/ordinary counting style). This only affects output labeling, not any calculations.}
  \item{profile_probs}{If TRUE, then return the estimated probability of the participant being in each profile ("soft" assignment). If FALSE, then return the index of each participant's most probable profile ("hard" assignment).}
}
\value{A data frame.}
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

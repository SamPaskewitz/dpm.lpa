\name{profile_similarity}
\alias{profile_similarity}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Computes pairwise distance and similarity between latent profiles.
}
\description{
Computes pairwise distance and similarity between latent profiles.
}
\usage{
profile_similarity(model, font_size = 11, start_profile_labels_from1 = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model}{DPM-LPA model object.}
  \item{font_size}{Font size for plots.}
  \item{start_profile_labels_from1}{Whether to label latent profiles starting from 0 (Python style or from 1 (R/Matlab/ordinary counting style). This only affects output labeling, not any calculations.}
}
\details{
This computes the Euclidean distance between each pair of profile means
        (m_mu) and converts it to a similarity measure as follows:

        squared_distance = sum(E_xi*(m_mu[:,j] - m_mu[:,k])^2)
        similarity = exp(-0.5*squared_distance)

        Two profiles with identical means will thus have a similarity of 1,
        while highly dissimilar profiles will have a similarity near 0.

        Distances are scaled by the estimated precision (E_xi) of each data
        dimension, so that variables with lower variances (higher E_xi) are
        given more weight.

        This similarity metric is proportional to the likelihood from each
        latent profile of the most typical (modal = mean) data point corresponding
        to each other latent profile (it is a diagonal multivariate normal density
        without the normalizing term).

        Profiles are numbered according to profile_order in the output, i.e.
        the profile with the largest estimated membership/base rate (pi)
        will be 0, the profile with the next largest membership will be 1
        etc.
}
\value{
  \item{similarity}{Similarity between profiles.}
  \item{distance}{Distance between profiles.}
  \item{max_similarity}{Maximum similarity across all profile pairs.}
  \item{most_similar_pair}{Most similar pair of profiles.}
  \item{mean_similarity}{Mean similarity across all profile pairs.}
  \item{min_distance}{Minimum distance across all profile pairs (corresponds to maximum similarity).}
  \item{mean_distance}{Mean distance across all profile pairs.}
  \item{plot}{Plot of the profile means of the most similar two profiles.}
}
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

\name{outcome_analysis_normal}
\alias{outcome_analysis_normal}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Analyze the relationship between the profiles and normally distributed
outcome variables.}
\description{
Analyze the relationship between dependent variables (y) - that are assumed to
be normally distributed - and the profiles. This is done without changing the model's other variational parameters.
}
\usage{
outcome_analysis_normal(model, y, profile_labels = NULL, start_profile_labels_from1 = FALSE, prior_alpha = 1, prior_beta = 1, prior_m = 0, prior_lambda = 1, figure_size = c("10", "12"), font_size = 11, facet_var = "variable", ncol = 4)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model}{The fitted LPA model.}
  \item{y}{Outcome data (data frame).}
  \item{profile_labels}{Optional labels for latent profiles.}
  \item{do_post_hoc}{Whether or not to do post-hoc analysis to group profile means into
        partitions. This can be computationally intensive if there are more
        than a few profiles.}
  \item{start_profile_labels_from1}{Whether to label latent profiles starting from 0 (Python style) or from 1 (R/Matlab/ordinary counting style). This only affects output labeling, not any calculations.}
  \item{prior_alpha}{Prior alpha parameter.}
  \item{prior_beta}{Prior beta parameter.}
  \item{prior_m}{Prior m parameter.}
  \item{prior_lambda}{Prior lambda parameter.}
  \item{figure_size}{Size of plots.}
  \item{font_size}{Font size for plots.}
  \item{facet_var}{Faceting variable for plots.}
  \item{ncol}{Number of columns to use in plots.}
}
\details{Outcome means/variances are given a normal-gamma prior distribution with the specified hyperparameters (prior alpha,prior_beta, prior_m, and prior_lambda).

    All calculations relating latent profiles to outcome variables (y) use hard assignment of participants/observations
    to latent profiles, i.e. each participant is assigned to their most probable profile, which is then treated as known.

    Outcome variance is treated as shared across profiles in computing the Bayes factors, but not when computing posterior
    hyperparameters or r^2. This does not seem to make much practical difference, but is an inconsistency that could be changed
    later.

    ** ADD DETAILS ABOUT THE BAYES FACTORS AND PARTIION-BASED POST-HOC ANALYSIS**}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
A list with the following data:

    \item{plot}{A plot displaying 95\% posterior credible intervals of group means for each outcome variable.}
    \item{plot_df}{Table of statistics used to create the plot.}
    \item{bayes_factors}{Table of Bayesian 1-way ANOVA results
            bf10: Bayes factor for comparing H1 (all latent profiles have different means) to H0 (all latent profiles have the same mean).
            log10_bf10: The base-10 logarithm of the above (this is easier to interpret).
            post_hoc_result: The best partition of latent profiles into sets with equal means within each set and different means between sets. This is the result of post-hoc analysis, which is performed only when log10_bf10 > *ASDF* (indicating substantial evidence for H1 according to the criteria of *REF*).}
    \item{r2}{Coefficient of determination (r^2) for each outcome, based on LPA categorization of participants/observations.}
    \item{post_hpar}{Posterior hyperparameters of each outcome for each latent profile.}
}
\author{Sam Paskewitz}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.

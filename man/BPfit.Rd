% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dynofits.R
\name{BPfit}
\alias{BPfit}
\title{Sequential break point copula model.}
\usage{
BPfit(x, y, fam1, fam2 = NULL, parallel = FALSE, date_names = NULL,
  ncores = 2)
}
\arguments{
\item{x}{A numeric vector of uniform marginal values.}

\item{y}{A numeric vector of uniform marginal values.}

\item{fam1}{An integer representing the family of the copula to use.
If \code{fam2} is not \code{NULL}, this value indicates the copula family
of the first copula component.}

\item{fam2}{A second (optional) integer indicating the use of a 
mixture copula and the family of the second copula component. Defaults to
\code{NULL}.}

\item{parallel}{Logical switch to run the breakpoint search in parallel.}

\item{date_names}{Character vector of (optional) date/timestamp names for the
marginal distributions.}

\item{ncores}{Integer specifying the number cores to use in the parallelization.
If the user specifies more cores (real or logical) than the CPU can
support, the max number of supported cores will be used.}
}
\value{
\code{BPfit} returns an S3 object of \code{\link[base]{class}}
  \code{seqBreakPoint}.
  
  The summary, plot, coef, and logLik methods will give a decent snapshot of
  the model.
  
  An object of class \code{seqBreakPoint} is a list of lists, one for each
  regime. Each individual list contains the following components:
  \tabular{ll}{
    \code{pars} \tab a vector of coefficients for the copula \cr
    \code{log.likelihood} \tab log-likelihood value for the regime \cr
    \code{dep.measures} \tab a list tail dependence and Kendall's tau \cr
    \code{emp_hess} \tab the emprical hessian \cr
    \code{opg} \tab the outer product of the gradient \cr
    \code{sandwich} \tab the sandwich estimator \cr
    \code{family} \tab integers recorded which copula family to used \cr
    \code{points} \tab start and ending index values that subset the marginal
      series for the regime \cr
  }
  
  In addition, the following three attributes are included:
  
  \tabular{ll}{
    \code{marinal_names} \tab names of the marginal series \cr
    \code{initial_bp} \tab information on the initial break points before a
      re-partition method is applied \cr
    \code{class} \tab class of the model \cr
  }
}
\description{
\code{BPfit} performs a recursive search over a bivariate time series of
  uniform marginal distributions.
}
\details{
The sequential break point model can be more computationally
  expensive than \code{\link{MSfit}} and \code{\link{STfit}}, especially
  as the length of the time series grows. This is due to the sequential hunt
  for break points.
  
  In the model's favor, robust standard errors can be calculated for each
  respective regime. In addition to the standard errors obtained by inverting
  the hessian, outer product of gradients (OPG) and sandwich estimates are
  also available. Standard errors based on the sandwich estimator are used
  in the summary.
}
\references{
Dias, Alexandra and Paul Embrechts, 2004, Change-point analysis
  for dependence structures in finance and insurance. In G. Szegoe (ed.),
  \emph{Risk Measures for the 21st Century}, Wiley Finance Series, 321-335

Dias, Alexandra and Paul Embrechts, 2009, Testing for structural
changes in exchange rates dependence beyound linear correlation,
\emph{European Journal of Finance}, 15(7), 619-637
}


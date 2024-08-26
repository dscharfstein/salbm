\name{PrepInferenceAssumption}
\alias{PrepInferenceAssumption}

\title{Sensitivity Analysis for Binary Missing Data}

\description{Given an object returned from salbmCombine this function prepares results 
  for presentation in a table.}

\usage{PrepInferenceAssumption(M, CItp=2, qt = c(0.025, 0.975), SampCIType=1, carm=2)}

\arguments{
  \item{M}{ is an object returned by the salbm function salbmCombine. It should contain
  confidence bands ECI and SCI and means and standard deviations from bootstraps 
  (Main1wts,  Main2wts, Samp1wts and Samp2wts).}

  \item{CItp}{ a number ranging from 1 to 4, indicating which confidence interval to use.}

  \item{qt}{ two values passed to quantile in producing confidence intervals.}

  \item{SampCIType}{ type of CI for samples}

  \item{carm}{ comparison arm}
}

\details{
 PrepInferenceAssumption is used in conjunction with influenceAssumption to produce 
 a summary of an salmb results object,

 It produces summeries for each arm of the study and the difference in estimates
 between arms under various assumptions:

 \bold{MCAR} when the mean value is substituted for missing at each timepoint

 \bold{missing=0} when 0 is substituted for missing at each timepoint

 \bold{missing=1} when 1 is substituted for missing at each timepoint

 \bold{benchmark} results returned from salbm or salbmM
}

\value{
  a matrix which inferenceAssumption can display.
}

\seealso{
  salbm, salbmM, influenceAssumption
}  
\examples{
\dontrun{
  data(trt1)
  data(trt2)
  data <- list( trt1 = trt1[,1:3], trt2 = trt2[,1:3] )

  ## main run
  x0 <- salbm( data = data , K = 3, ntree = 100, 
               seeds = c(22,18), seeds2 = c(-2,-3),
               alphas = -1:1, NBootstraps=0 )

  ## add Bootstraps
  samp1 <- addSamples(obj=x0, seeds=c(99,12), 
               seeds2 = c(-45,-80), bBS=1,
               NBootstraps=10)
  ## add more Bootstraps
  samp2 <- addSamples(obj=x0, seeds=c(9,2), 
               seeds2 = c(-54,-8), bBS=11,
               NBootstraps=10)

  ## Together
  M <- salbmCombine(x0=x0, Samps=list(samp1,samp2))
  M <- M[[ "Res12" ]]

  prep <- PrepInferenceAssumption( M )
  print(prep)
}
}


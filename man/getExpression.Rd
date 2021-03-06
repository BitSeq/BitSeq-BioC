\name{getExpression}
\alias{getExpression}
\title{Estimate transcript expression}
\description{
Estimate expression of transcripts. Starting from alignment and reference files function function handles the entire process of expression analysis resulting in transcript expression means and standard deviation together with file containing all the expression samples.
}
\usage{
getExpression(alignFile, trSeqFile, outPrefix=NULL, uniform=TRUE, type="RPKM", 
      log=FALSE, limitA=NULL, seed=NULL, pretend=FALSE, ... )
}
\arguments{
\item{alignFile}{File containing read alignments.}
\item{trSeqFile}{File containing transcript sequence in FASTA format.}
\item{outPrefix}{Prefix for the output files. Otherwise program creates temporary files, which are only valid for current R session.}
\item{uniform}{Use uniform read distribution.}
\item{type}{Output type, possible values: \code{theta}, \code{RPKM}, \code{counts}, \code{tau}.}
\item{log}{Report mean and expression of logged expression samples.}
\item{limitA}{Limit maximum number of alignments per read. Reads with more alignments than limit will be discarded.}
\item{seed}{Sets the initial random seed for repeatable experiments.}
\item{pretend}{Do not execute, only print out command line calls for the C++ version of the program.}
\item{...}{Other arguments are passed to \code{estimateExpression}, please see \code{\link{estimateExpression}} for more details}
}
\details{
This function uses \code{parseAlignment} function to compute alignment probabilities and the function \code{estimateExpression} to produce the expression samples.

In case of non-uniform read distribution, it first produces approximate estimates of expression using uniform read distribution with VB inference and subsequently uses these estimates to compute read distribution bias-corrected alignment probabilities, which are used in the \code{estimateExpression} function to produce expression estimates.

The order of transcripts in the results is always the same as in the alignment file. The transcripts can be identified by names stored in the \code{trInfo} part of the result.
}
\value{
\code{list} with items:
\item{exp}{\code{DataFrame} with transcript expression mean and standard deviation}
\item{fn}{name of the file containing all the expression samples}
\item{counts}{vector of estimated read counts per transcript}
\item{trInfo}{\code{DataFrame} with transcript information, contains: transcript name, possibly gene name, transcript length, and adjusted transcript length}
}
\author{Peter Glaus}

\seealso{\code{\link{getDE}}, \code{\link{estimateExpression}}, \code{\link{parseAlignment}}}
\examples{\dontrun{
res1 <- getExpression("data-c0b0.sam","ensSelect1.fasta", MCMC_chains=2, 
      MCMC_samplesN=100)
}}

\keyword{transcript expression}

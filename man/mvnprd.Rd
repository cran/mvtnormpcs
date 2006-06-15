\name{mvnprd}
\alias{mvnprd}
\title{ Multivariate Normal Distribution with Product Correlation Structure }
\description{
    For a multivariate normal vector with correlation structure defined by
    RHO(I,J) = BPD(I)*BPD(J), computes the probability that the vector 
    falls in a rectangle in N-space with error less than EPS
}
\usage{
    result <- mvnprd(A, B, BPD, INF, EPS = 1e-04, IERC = 1, HINC = 0)
}
\arguments{
  \item{A}{ Upper limits of integration.  Array of N dimensions }
  \item{B}{ Lower limits of integration.  Array of N dimensions }
  \item{BPD}{ Values defining correlation structure.  Array of N dimensions }
  \item{INF}{ Determines where integration is done to infinity.  Array of
              N dimensions.  Valid values for INF(I): 0=(B(I), inf), 
              1=(-inf, A(I)), 2=(B(I),A(I)) }
  \item{EPS}{ desired accuracy.  Defaults to 1e-04 }
  \item{IERC}{ error control.  If set to 1, strict error control based on 
               fourth derivative is used.  If set to zero, error control based
               on halving intervals is used }
  \item{HINC}{ Interval width for Simpson's rule.  Value of zero caused
               a default .24 to be used }
}
\value{
  Returns a list of values
  \item{PROB}{ approximation to the N-variate probability }
  \item{BOUND}{ bound on error of the approximation }
  \item{IFAULT}{ a fault indicator.  If 1, error in dimensions (N<1 or N>50).
                 If 2, BPD<-1 or BPD>1.  If 3, INF not 0, 1, or 2.
                 If 4, INF(I)=2 and A(I)<= B(I).  
                 If 5, the number of terms computed exceeds the limit.
                 If 6, a fault occurred in normal subroutines.
                 If 7, subintervals are too narrow, or too many.
                 If 8, BOUND exceeds EPS.
                 If 0, no errors. }
}
\references{ Dunnett, Charles, Algorithm AS 251, Multivariate Normal
             Probability Integrals with Product Correlation Structure, 
             Applied Statistics, 1989 }
\author{ Fortran code by Charles W. Dunnett.

         Ported to R by Duane Currie <duane.currie@acadiau.ca>, Acadia Centre 
         for Mathematical Modeling and Computation, Acadia University }
\note{ Much of this help text was paraphrased and/or copied from Dunnett's 
       code, as presented with the paper listed in the references. }

\examples{
    library(mvtnormpcs)
    N <- 3

    rho <- 0.5
    B   <- rep(-5.0,      length=N)
    A   <- rep(5.0,       length=N)
    INF <- rep(2,         length=N)
    BPD <- rep(sqrt(rho), length=N)

    result <- mvnprd(A,B,BPD,INF)
    result
}
\keyword{ multivariate }
\keyword{ distribution }


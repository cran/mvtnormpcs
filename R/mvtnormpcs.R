.packageName <- 'mvtnormpcs'

mvnprd <-
function(A, B, BPD, INF, EPS=0.0001, IERC=1, HINC=0.0) {
    N <- length(A)
    result <- .Fortran('mvnprd', PACKAGE='mvtnormpcs',
                       as.single(A),     as.single(B),    as.single(BPD), 
                       as.single(EPS),   as.integer(N),   as.integer(INF),
                       as.integer(IERC), as.single(HINC), 
                       prob=single(1),   bound=single(1), ifault=integer(1))

    return( list(PROB=result$prob, BOUND=result$bound, IFAULT=result$ifault) )
    }

mvstud <-
function(NDF, A, B, BPD, INF, D, EPS=0.0001, IERC=1, HINC=0.0) {
    N <- length(A)
    result <- .Fortran('mvstud', PACKAGE='mvtnormpcs',
                       as.integer(NDF), as.single(A),    as.single(B), 
                       as.single(BPD),  as.single(EPS),  as.integer(N),
                       as.integer(INF), as.single(D),    as.integer(IERC),
                       as.single(HINC),
                       prob=single(1),  bound=single(1), ifault=integer(1))
    return( list(PROB=result$prob, BOUND=result$bound, IFAULT=result$ifault) )
    }

.First.lib <- function(lib, pkg) {
  library.dynam('mvtnormpcs', pkg, lib)
}


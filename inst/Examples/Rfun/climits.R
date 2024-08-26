climits <- function( range, intl=10, oset = c( 0, 0 ) ) {
  range <- c(min(range),max(range)) + oset
  minr  <- floor(range[1])
  maxr  <- ceiling(range[2])
  lenr  <- maxr - minr
  sr    <- seq(minr,maxr,by=lenr/(lenr*round(intl)))
  crng  <- c( max( sr[sr <= range[1]]), min( sr[sr >= range[2]] ))
  return(crng)
}

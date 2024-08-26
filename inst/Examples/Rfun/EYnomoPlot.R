EYnomoPlot <- function( Res, file, height, width, ylab, xlim, ylim, legpos=c(xlim[1],ylim[2]), maintext=NULL, ltext,
                        gpar=list(mar = c(4,5,1,1), mgp=c(2.5,0.5,0)), col=c("#CC8866FF","#6688CCFF","#55CC77FF") ) {

  n    <-  ncol(Res) - 1
  col  <-  rep( col, ceiling(n/3) )

  pdf(file=file, height=height, width=width)
  par(gpar)

  plot.new()
  plot.window( xlim = xlim, ylim = ylim )

  for ( i in 1:n ) {
    lines( x = Res[,1], y = Res[,i+1], lwd=3, lty=1, col = col[i] )
  }

  legend(legpos[1], legpos[2],
      legend = ltext,
      xjust=0, yjust=1, lty = c("solid"), lwd=c(5), col=col)

  axis(1)
  axis(2)

  title( main = maintext)
  title( xlab = expression(alpha),
         ylab = ylab)
  box()
  dev.off()
  return(invisible())
}

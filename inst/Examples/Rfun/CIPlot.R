CIPlot <- function( Res, file, height, width, ylab, xlim, ylim, maintext=NULL,
                    gpar=list(mar = c(3.5,5,0.5,0.5), mgp=c(2.5,0.5,0), 
                    las=1, tcl=-0.3, cex.lab = 1),
                    col.ci = "#77AAFFFF", col.est = "#CC8866FF" ) {

  pdf(file=file, height=height, width=width)

  par(gpar)
  mgp.xlab <- par("mgp")
  mgp.xlab[1] <- max(2,mgp.xlab[1] - 0.5)

  plot.new()
  plot.window( xlim = xlim, ylim = ylim )

  lines( x = Res[,1], y = Res[,3], lwd=3, lty = c("solid"), col = col.ci)
  lines( x = Res[,1], y = Res[,4], lwd=3, lty = c("solid"), col = col.ci)

  lines( x = Res[,1], y = Res[,2], lwd=3, col = col.est)

  axis(1,cex.axis=1.0)
  axis(2,cex.axis=1.0)

  title( main = maintext)
  title( xlab = expression(alpha), mgp=mgp.xlab )
  title( ylab = ylab )
  box()

  dev.off()
  return(invisible())
}

inferenceAssumption <- function( PTab, TabName = " Table:",
                        Title1txt  = " Inference under various assumptions ( Symmetric CI )",
                        Title2Atxt = " Expected value of Y_K",
                        Title2Btxt = " Expected value of Sum_{i=1}^K(Y_i)",
                        w=9, d=4, s=12, nsp=2  ) {

  ETabList   <-   c( "MEm", "ME0", "ME1", "MEX" )
  STabList   <-   c( "MSm", "MS0", "MS1", "MSX" )

  ETab       <-   PTab[ PTab[, "type"] %in% ETabList, ]
  STab       <-   PTab[ PTab[, "type"] %in% STabList, ]
  ord        <-   c(3,1,2,4)
  ETab       <-   ETab[ord,]
  STab       <-   STab[ord,]

  sf         <-   paste("%",w,".",d,"f",sep="")
  ssf        <-   paste("%-",s,"s",sep="")
  sp         <-   paste(rep(" ",nsp),sep="",collapse="")
  fmt        <-   paste(" ",ssf,sp,sf," (",sf,",",sf," )",
                                sp,sf," (",sf,",",sf," )",
                                sp,sf," (",sf,",",sf," )",
                        "\n",sep="")

  lenB       <-   3*w+5
  lenT       <-   1+s+3*nsp+3*lenB

  dash       <-   paste(paste(rep("-",lenT+1),sep="",collapse=""),"\n")
  rlabs      <-   c( "MCAR", "missing=0", "missing=1", "salbm(alpha=0)" )

  head1      <-   paste(TabName,Title1txt,"\n",sep=" ")
  head2      <-   paste(Title2Atxt,"\n",sep=" ")

  pos        <- c(2,1+s+nsp+w-d-1, 1+s+2*nsp+lenB+w-d-1, 1+s+3*nsp+2*lenB+w-d-1, lenT)  
  h2txt      <- c("Assumption","Group 1", "Group 2", "Difference (G2-G1)" )
  head3      <- paste(rep(" ",lenT),sep="",collapse="")
  for ( i in 1:length(h2txt) ) {
      substring(head3,pos[i],pos[i]+nchar(h2txt[i])-1) <- h2txt[i]
  }
  head3 <- paste(head3,"\n",sep="")

  cat("\n")
  cat(head1)
  cat(head2)   
  cat(dash)
  cat(head3)   
  cat(dash)

  for ( i in 1:4 ) {
    line  <-  sprintf(fmt, rlabs[i], ETab[i,"M1"], ETab[i,"lb1"], ETab[i,"ub1"],
                                     ETab[i,"M2"], ETab[i,"lb2"], ETab[i,"ub2"],
                                     ETab[i,"Md"], ETab[i,"lbd"], ETab[i,"ubd"])
    cat(line)
  }
  cat(dash)
  cat("\n\n")

  head2      <-   paste(Title2Btxt,"\n",sep=" ")

  cat(head1)
  cat(head2)   
  cat(dash)
  cat(head3)   
  cat(dash)
  for ( i in 1:4 ) {
    line  <-  sprintf(fmt, rlabs[i], STab[i,"M1"], STab[i,"lb1"], STab[i,"ub1"],
                                     STab[i,"M2"], STab[i,"lb2"], STab[i,"ub2"],
                                     STab[i,"Md"], STab[i,"lbd"], STab[i,"ubd"])
    cat(line)
  }
  cat(dash)
  return(invisible())
}

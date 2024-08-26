missingPattern <- function( TabR, trtlab = "Treatment 1" ) {
  Tabdata  <- TabR$Mat
  tots     <- TabR$tots
  K        <- TabR$K 
  TMiss    <- Tabdata[ Tabdata[,"N2"] == K, "Freq" ]
  if (length(TMiss) == 0 ) TMiss <- 0
  K1       <- max(K,10)
  
  Total    <- sum(Tabdata[,"Freq"]) 
  ln1      <- c("Number",  "Number", "Sub-total")    
  ln2      <- c("Observed","Missing","Pattern","Count","Percent","Count","Percent")
  sp1      <- c(1,4,1+7+K1+10+5+3+7+6+3,5)
  sp2      <- c(1,2,7,K1-7+10,3,6,3,1)
  tsp      <- sum(sp2) + nchar(paste(ln2,sep="",collapse=""))

  dash     <- paste(rep("-",tsp),sep="",collapse="")
  
  headerT2 <- paste(paste(rep(" ",sp1[1]),sep="",collapse=""),ln1[1],
                    paste(rep(" ",sp1[2]),sep="",collapse=""),ln1[2],
                    paste(rep(" ",sp1[3]),sep="",collapse=""),ln1[3],sep="")
  headerT3 <- paste(paste(rep(" ",sp2[1]),sep="",collapse=""),ln2[1],
                    paste(rep(" ",sp2[2]),sep="",collapse=""),ln2[2],
                    paste(rep(" ",sp2[3]),sep="",collapse=""),ln2[3],
                    paste(rep(" ",sp2[4]),sep="",collapse=""),ln2[4],
                    paste(rep(" ",sp2[5]),sep="",collapse=""),ln2[5],
                    paste(rep(" ",sp2[6]),sep="",collapse=""),ln2[6],
                    paste(rep(" ",sp2[7]),sep="",collapse=""),ln2[7],
                    sep="")
  
  headerT4 <- " Monotone"
  headerT5 <- " Non-monotone"

  Text1 <- paste(" ",trtlab," (N=",Total,")",sep="")
  Text3 <- paste(" Note: There were",TMiss,"individuals with no observed data.")
  
  cat("\n\n")
  cat(paste(Text1,   "\n"))
  cat(paste(Text3,   "\n"))
  cat(paste(dash,    "\n"))
  cat(paste(headerT2,"\n"))
  cat(paste(headerT3,"\n"))
  cat(paste(dash,    "\n"))
  cat(paste(headerT4,"\n"))

  sk2  <- paste(rep(" ",10),sep="",collapse="")
  sk3  <- paste(rep(" ", 7),sep="",collapse="")
  fmt1 <- paste("%5.0f %9.0f",sk2,"%-",K1,"s",sk3,"%8.0f %9.2f",sep="")
  fmt2 <- paste("%5.0f %9.0f",sk2,"%-",K1,"s",sk3,"%8.0f %9.2f   %8.0f %9.2f",sep="")
  ir   <- 2
  for ( i in 1:nrow(Tabdata) )  {
     if ( tots[ir,2] == i ) {
      line <-  sprintf(fmt2,
                       Tabdata[i,"N1"], Tabdata[i,"N2"],Tabdata[i,"txt"], Tabdata[i,"Freq"], Tabdata[i,"pcnt"],
                       tots[ir,3], tots[ir,4])
      cat(line)
      cat("\n")
      if ( ir == 2 ) cat(paste(headerT5,"\n"))
      if ( ir > 2 && ir < nrow(tots) ) cat("\n") 
      ir <- ir+1
     } else {
      line <-  sprintf(fmt1,
                       Tabdata[i,"N1"], Tabdata[i,"N2"],Tabdata[i,"txt"], Tabdata[i,"Freq"], Tabdata[i,"pcnt"])
      cat(line)
      cat("\n")
     }
  }
  cat(paste(dash,  "\n\n"))
  return(invisible())
}    

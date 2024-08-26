options(width=180,max.print=2000)
suppressPackageStartupMessages(library(randomForestSRC,quietly=TRUE))
library(salbm)
# ---------------------------------------------------------------
   oname            <-   sprintf("LRDS/salbmResults0.rds")
   trt1             <-   readRDS("../../RDS/Eg1_1.rds")
   trt2             <-   readRDS("../../RDS/Eg1_2.rds")
   data             <-   list( trt1 = trt1, trt2 = trt2 )
   K                <-   ncol(trt1)
# ---------------------------------------------------------------
set.seed(99)
R <- salbm( data = data , K = K , ntree = 1000, 
            seeds=c(22,482), seeds2=c(-2,-3), alphas = -20:20,
            bBS = 1, NBootstraps = 0)
saveRDS(R,oname)
print(R)

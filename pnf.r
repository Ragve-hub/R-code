library(rpnf) # Load rpnf library
library(rusquant)
library(tseries)
date="2021-01-01"
p='day'
ticker =
  '@RI'
rts = getSymbols(ticker, src =
                   'Mfd'
                 , from =
                   date
                 , auto.assign = F,period=p)


colnames(rts)=c("o","h","l","c","vol","oi")
pnfdata <- pnfprocessor(
  high=rts$h,
  low=rts$l,
  date=date(rts),
  boxsize=500L,
  reversal=3L,
    log=FALSE)  
pnfplottxt(pnfdata,boxsize=500L,log=FALSE)

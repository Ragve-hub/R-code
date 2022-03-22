library(rusquant)

dateFrom = '2005-01-01'
dateTo = Sys.Date()

SPFB.RTS = getSymbols('@RI', src =
                         'Mfd'
                     , from =
                         dateFrom
                     , auto.assign = F,period='day')

log_RI <- diff(log(SPFB.RTS[,4]), lag=1)
a=na.omit(log_RI)

realized.vol30 <- xts(apply(a,2,runSD,n=30), index(a))*sqrt(252)
realized.vol60 <- xts(apply(a,2,runSD,n=60), index(a))*sqrt(252)
realized.vol90 <- xts(apply(a,2,runSD,n=90), index(a))*sqrt(252)

bb <- as.zoo(realized.vol30-realized.vol90)

plot(realized.vol30-realized.vol90)

plot(realized.vol30)

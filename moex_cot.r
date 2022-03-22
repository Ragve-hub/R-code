urlOI<-"http://moex.com/ru/derivatives/open-positions-csv.aspx?d="

dateStart<-as.Date("2021-01-01", "%Y-%m-%d")
dateEnd<-as.Date("2021-05-18", "%Y-%m-%d")
OpIn.df<-read.csv(paste(urlOI,format(dateStart, "%Y%m%d"),"&t=1", sep=""), nrows=1)
i<-dateEnd
for(i in 0:(dateEnd-dateStart)){
  id<-format(dateStart+i, "%Y%m%d")
  iurl<-paste(urlOI,id,"&t=1", sep="")
  
  print(iurl)
  OpIn.i<-read.csv(iurl)
  OpIn.df<-rbind(OpIn.df, OpIn.i)
}

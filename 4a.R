yc_xts = xts(yc$df, order.by=as.Date(rownames(yc$df)))
save(yc_xts, file = "yc_xts.rda")
load("yc_xts.rda")


x10y <- yc_xts %>% subset(select = "BC_10YEAR")
x3m <- yc_xts %>% subset(select = "BC_3MONTH")

x10y1 <- x10y['2002/2017']
x3m1 <- x3m['2002/2017']

x10y2 <- x10y['2017']
x3m2 <- x3m['2017']


isNotZero = apply(x10y1, 1, function(row) all(row != 0 ))
x10y1z <- x10y1[isNotZero,]

isNotZero = apply(x3m1, 1, function(row) all(row != 0 ))
x3m1z <- x3m1[isNotZero,]
plot.xts(cbind(x10y1z,x3m1z), col = c("red", "blue"),ylim=c(0,6), main="10 year and 3 month rate")
title(main="The interest rates of the Federal Reserve", 
      xlab="Date", ylab="Interest Rate by %")
legend("topleft",legend=c("10 Years Yield","3 Months Yield"),
       col=c("red", "blue"),lty=1)
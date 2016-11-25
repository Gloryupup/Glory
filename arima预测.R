x<-read.table(file.choose())//打开需要预测的文件
x<-ts(x[1])//转化为时间序列
x<-rev(x)//将时间序列顺序转换
plot(x,type = "l")//画时间序列图
diff1= diff(x)//观察差分是否平稳
plot(diff1,type = "l")
acf = acf(x)//画自相关系数
plot(acf,type = "l")
pacf = pacf(x)//画偏自相关系数
plot(pacf,type = "l")
library(zoo)
library(forecast)
auto.arima(x,trace = T)//获取p,d,q
y <- arima(x = x, order = c(0, 1, 1), seasonal = list(order = c(p, d, q), period = 12), 
    method = "ML")//自定义季节性为12个月
xforecast <- forecast.Arima(y,h=3,level=c(99.5))//预测三个月的数据
xforecast
plot.foracast(xforecast)//画预测图形



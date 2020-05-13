#EXPLORYING_DATA
class(weather)
dim(weather)
names(weather)
str(weather)
summary(weather)

#TIDYING_DATA
library(tidyr)
newweather <-weather[,-1] %>% gather(key = day, value = val, X1 : X31)  %>% 
  pivot_wider(names_from = measure, values_from = val)  

View(newweather)

#PREPARING_FOR_ANALYSIS

#now let's bring dates to a reasonable format
library(data.table)
library(dplyr)
weatherwithoutday <-newweather[,-3]
draftday<-data.table(newweather$day) 
day<- separate(draftday, V1, c("X", "day"),sep = 1)[,2]
finalweather<-cbind(day, weatherwithoutday)[,c(2,3,1,4:25)]

#i decided to keep days,months and years in different columns, because
#it may be convenient to select certain years/months/days as in the example below
finalweather1 <- finalweather %>% mutate_at(vars(-Events), as.numeric)
View(finalweather1)
#example
finalweather1 %>% select(c(1:5)) %>% subset(year==2014)

#what about missing values?
is.na(finalweather1)
any(is.na(finalweather1))
sum(is.na(finalweather1))

#in case if missing values aren't meaningful
finalweather2<-na.omit(finalweather1)
any(is.na(newweather1))

#ERRORS_DETECTION

summary(finalweather1)
summary(finalweather2)

boxplot(finalweather1$Max.TemperatureF, horizontal = T)
hist(finalweather1$Min.Humidity)
boxplot(finalweather2$Mean.VisibilityMiles, horizontal = T)
hist(finalweather$PrecipitationIn)


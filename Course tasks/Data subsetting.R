film <- c("John Wick","John Wick2", "John Wick3")
release <- c(2014, 2017, 2019)                   
budget<-c(30, 40, 75)
box_office <- c(89, 171,321)
rating<-c(7.4, 7.5, 7.7)
language <- c("English", "English", "English")
running_time <-c (101,122,131)
JW <- data.frame(film, release, budget, box_office, rating, running_time, language)
JW

all_info_first_film <- JW[1,]
all_info_first_film
all_info_second_film <- JW[2,]
all_info_second_film
all_info_third_film <- JW[3,]
all_info_third_film

name_and_year <- JW[1:3, 1:2]
name_and_year
name_budget_boxoffice <-JW[1:3, c(1,3,4)]
name_budget_boxoffice

all_names <-as.data.frame( JW[,1], drop=false)
all_names

all_names_and_rating <-as.data.frame( JW[,c(1,5)], drop=false)
all_names_and_rating

library(dplyr)
all_names_and_languages <-select(JW, film, language)
all_names_and_languages

in_English <-subset(JW, select=c(film, language), subset=(language=="English"))
in_English

shortest <- filter(JW, row_number() == which.min(running_time))[,c(1,6)]
shortest 

longest <- filter(JW, row_number() == which.max(running_time))[,c(1,6)]
longest

no_longer_than130 <-subset(JW, select=c(film, running_time), subset=(running_time <=130))
no_longer_than130

from_shortest_to_longest  <- JW[order(running_time),]
from_shortest_to_longest
from_longest_to_shortest <- JW[order(-running_time),]
from_longest_to_shortest

most_expensive <- filter(JW, row_number() == which.max(budget))[,c(1,3)]
most_expensive 

cheapest <- filter(JW, row_number() == which.min(budget))[,c(1,3)]
cheapest 

from_most_expensive_to_least <- JW[order(-budget),]
from_most_expensive_to_least
from_least_expensive_to_most <- JW[order(budget),]
from_least_expensive_to_most

most_profitable <-filter(JW, row_number() == which.max(box_office))[,c(1,4)]
most_profitable

least_profitable <- filter (JW, row_number() == which.min(box_office))[,c(1,4)]
least_profitable

from_most_profitable_and_least_expensive <- JW[order(-box_office, budget),]
from_most_profitable_and_least_expensive
from_least_profitable_and_most_expensive <- JW[order(box_office, -budget),]
from_least_profitable_and_most_expensive

new_one <- subset(JW, select=c(film, release), subset=(release >=2019))
new_one1 <-filter(JW, row_number() == which.max(release))[, c(1,2)]
new_one1
old_one <- filter(JW, row_number() == which.min(release))[, c(1,2)]
old_one

order_of_release <- JW[order(release),]
order_of_release 
order_of_release1 <- JW[order(-release),]
order_of_release1

new_ones <- subset(JW, select=c(film, release), subset=(release >=2017))
new_ones
most_popular_in_new_ones <-filter(new_ones, row_number() == which.max(release))
most_popular_in_new_ones
order_of_popular <-JW[order(-rating),]
order_of_popular
order_new_popular <-new_ones[order(-rating),]
order_new_popular

more_popular_than_7.4 <- subset(JW, select=c(film, rating), subset=(rating >=7.5))
more_popular_than_7.4

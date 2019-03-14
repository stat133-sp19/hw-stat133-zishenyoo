######################################################################
## title: Make shots Data Script
## description: Processing the data and saving as new csv
## input:Shot Data for Each Player (andre-iguodala.csv,draymond-green.csv,kevin-durant.csv,klay-thompson.csv,stephen-curry.csv)
## output:andre-iguodala-summary.txt,draymond-green-summary.txt,kevin-durant-summary.txt,klay-thompson-summary.txt,stephen-curry-summary.txt,shots-data-summary.txt and csv document for aggregated shot data
####################################################################



iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson<- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)

iguodala$name <- "Andre Iguodala"
green$name <- "Draymond Green"
durant$name <- "Kevin Durant"
thompson$name <- "Klay Thompson"
curry$name <- "Stephen Curry"

iguodala[iguodala$shot_made_flag=="y",]$shot_made_flag <-"shot_yes"
iguodala[iguodala$shot_made_flag=="n",]$shot_made_flag <-"shot_no"

green[green$shot_made_flag=="y",]$shot_made_flag <-"shot_yes"
green[green$shot_made_flag=="n",]$shot_made_flag <-"shot_no"

durant[durant$shot_made_flag=="y",]$shot_made_flag <-"shot_yes"
durant[durant$shot_made_flag=="n",]$shot_made_flag <-"shot_no"

thompson[thompson$shot_made_flag=="y",]$shot_made_flag <-"shot_yes"
thompson[thompson$shot_made_flag=="n",]$shot_made_flag <-"shot_no"

curry[curry$shot_made_flag=="y",]$shot_made_flag <-"shot_yes"
curry[curry$shot_made_flag=="n",]$shot_made_flag <-"shot_no"

iguodala$minute <- 12*iguodala$period - iguodala$minutes_remaining
green$minute <- 12*green$period - green$minutes_remaining
durant$minute <-12*durant$period - durant$minutes_remaining
thompson$minute <- 12*thompson$period - thompson$minutes_remaining
curry$minute <- 12*curry$period - curry$minutes_remaining


sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

sink(file = '../output/draymond-green-summary.txt')
summary(green)
sink()

sink(file = '../output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file = '../output/klay-thompson-summary.txt')
summary(thompson)
sink()

sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
sink()

everything <- rbind(iguodala,green,durant,thompson,curry)

write.csv(
  x = everything, # R object to be exported
  file = '../data/shots-data.csv'  # file path
)

sink(file = '../output/shots-data-summary.txt')
summary(everything)
sink()


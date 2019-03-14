library(ggplot2)
library(grid)
library(jpeg)
library(dplyr)

everything <- read.csv("../data/shots-data.csv", stringsAsFactors = FALSE)
curry = everything[everything$name == 'Stephen Curry', ]
klay= everything[everything$name == 'Klay Thompson', ]
green = everything[everything$name == 'Draymond Green', ]
durant = everything[everything$name == 'Kevin Durant', ]
iguodala = everything[everything$name == 'Andre Iguodala', ]

klay_scatterplot <- ggplot(data = klay) + geom_point(aes(x=x,y=y,color =  shot_made_flag))

# court image (to be used as background of plot)
court_file <- "../images/nba-court.jpg"
# create raste object
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

# shot chart with court background
klay_shot_chart <- ggplot(data = klay) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()


andre_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()


draymond_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()


kevin_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()

stephen_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()

pdf("../images/andre-iguodala-shot-chart.pdf",width =6.5, height=5)
andre_shot_chart
dev.off()

pdf("../images/draymond-green-shot-chart.pdf",width =6.5, height=5)
draymond_shot_chart
dev.off()

pdf("../images/kevin-durant-shot-chart.pdf",width =6.5, height=5)
kevin_shot_chart
dev.off()

pdf("../images/klay-thompson-shot-chart.pdf",width =6.5, height=5)
klay_shot_chart
dev.off()

pdf("../images/stephen-curry-shot-chart.pdf",width =6.5, height=5)
stephen_shot_chart
dev.off()

gsw_shot_chart <- ggplot(data = everything) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: GSW (2016 season)') +
  theme_minimal()+facet_wrap(~name)

pdf("../images/gsw-shot-charts.pdf",width =8, height=7)
gsw_shot_chart
dev.off()

png(filename = "../images/gsw-shot-charts.png",width = 8,height = 7,units = "in",res = 1200)
gsw_shot_chart
dev.off()

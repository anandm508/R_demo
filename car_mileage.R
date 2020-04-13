setwd("D:/datascience")

cars <- read.table(file = "car_mileage.txt",
                   header = TRUE,
                   sep = "\t",
                   quote = "\"")
head(cars)

library("dplyr")

efficiency <- cars %>% 
  select(Cylinders, Mileage, Transmission) %>%
  filter(Transmission == "Manual" ) %>% 
  mutate(Consumption = Mileage*.425) %>% 
  group_by(Cylinders) %>%
  summarize(Avg.Consumption = mean(Consumption)) %>%
  arrange(desc(Avg.Consumption)) %>%
  as.data.frame()

efficiency

write.csv(x = efficiency,
          file = "result.csv",
          row.names = FALSE)

# create a freq uency table for transmission
table(cars$Transmission)

#get min, max, mean, median, quantile and sd of fuel econmoy
min(cars$Mileage)
max(cars$Mileage)
mean(cars$Mileage)
median(cars$Mileage)
quantile(cars$Mileage)
sd(cars$Mileage)

#Get the correlation between cylinders and fuel econmoy
cor(x = cars$Cylinders, y = cars$Mileage)

#summarize the data
summary(cars)

# Visualizations
library(ggplot2)

# Bar chart of car count and transmission type
ggplot(
  data = cars,
  aes(x = Transmission)) + 
  geom_bar() +
  ggtitle("Count of cars by transmission type") +
  xlab("Transmission") +
  ylab("Count of cars")

# Bar chart of car count and transmission type
ggplot(
  data = cars,
  aes(x = Transmission)) + 
  geom_bar() +
  ggtitle("Count of cars by transmission type") +
  xlab("Transmission") +
  ylab("Count of cars")

# Histogram of car and fuel economy
ggplot(
  data = cars,
  aes(x = Mileage)) + 
  geom_histogram(bins = 10) +
  ggtitle("Distribution of fuel econmoy") +
  xlab("Mileage") +
  ylab("Count of cars")

# Histogram of car and fuel economy
ggplot(
  data = cars,
  aes(x = Mileage)) + 
  geom_density() +
  ggtitle("Distribution of fuel econmoy") +
  xlab("Mileage") +
  ylab("Density")

# Scatterolot of cylinders and fuel economy
ggplot(
  data = cars,
  aes(x = Cylinders, y = Mileage)) + 
  geom_point() +
  ggtitle("Fuel Economy by cylinders") +
  xlab("Number of cyliners") +
  ylab("Mileage in KM/PL")

  
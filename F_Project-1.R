library(dplyr)
library(readr)
library(tidyr)
library(cluster)  
library(caret)
library(ggplot2)
library(glm2)
library(leaflet)
library(leaflet.extras)
library(DT)

MetLand = read.csv("/Users/tanishqbakliwal/Desktop/ALY6015 INTERMEDIATE ANALYTICS /final project/meteorite_Landings.csv")
View(MetLand)

summary(MetLand)

# Create a scatter plot of 'reclat' and 'reclong'
plot(MetLand$reclong, MetLand$reclat, 
     main = "Meteorite Landings",
     xlab = "Longitude",
     ylab = "Latitude")

#Top 20 Class Of Meteorites by Count
Meteorite_Count = MetLand %>%
  group_by(recclass) %>%
  summarise(Count = n()) %>%
  arrange(desc(Count)) %>%
  ungroup() %>%
  mutate(recclass = reorder(recclass,Count)) %>%
  head(20) 
Meteorite_Count # 20 Meterorite Class

# Create a bar plot of meteorite counts.
plot <- ggplot(data = Meteorite_Count, aes(x = recclass, y = Count)) +
  geom_bar(stat = 'identity', colour = 'white', fill = 'blue') +
  geom_text(aes(x = recclass, y = 1, label = paste0("(", Count, ")", sep = "")),
            hjust = 0, vjust = 0.5, size = 4, colour = 'black', fontface = 'bold') +
  labs(x = 'Meteorites Class', y = 'Count', title = 'Meteorites Class and Count') +
  coord_flip() +
  theme_bw()
plot  # Display the plot

# Distribution of Meteorite Landings (world)
center_lon = median(MetLand$reclong,na.rm = TRUE)
center_lat = median(MetLand$reclat,na.rm = TRUE)


leaflet(MetLand) %>% addProviderTiles("Esri.NatGeoWorldMap") %>%
  addCircles(lng = ~reclong, lat = ~reclat, 
             color = c("red"))  %>%
  # controls
  setView(lng=0, lat=0,zoom = 2)


# Set a threshold (e.g., 0.5) to classify as Fell or Not Fell
predicted_classes <- ifelse(predictions > 0.5, 1, 0)

#ggplot
ggplot(MetLand, aes(x = reclong, y = reclat)) +
  geom_point() +
  labs(title = "Scatter Plot of Latitude vs. Longitude", x = "Longitude", y = "Latitude")

# Ensure the "fall" column is a binary outcome
MetLand$fall <- factor(MetLand$fall, levels = c("Fell", "Found"))

#Perform logistic regression
model <- glm(fall ~ recclass + mass..g. + year + reclat + reclong, data = MetLand, family = binomial(link = 'logit'))

# Summary of the logistic regression model
summary(model)

## Multivariable 
MetLand$mass..g. <- as.numeric(MetLand$mass..g.)
MetLand$year <- as.numeric(MetLand$year)
MetLand$reclat <- as.numeric(MetLand$reclat)
MetLand$reclong <- as.numeric(MetLand$reclong)
MetLand$fall <- as.numeric(MetLand$fall == "Fell")

# Create a binary outcome for logistic regression (if not done already)
MetLand$fall <- factor(MetLand$fall, levels = c("Fell", "Found"))

# Fit a multivariable regression model
model1 <- lm(fall ~ mass..g. + year + reclat + reclong, data = MetLand)

# Summary of the regression model
summary(model1)

# Time Series 
MetLand %>%
  filter(year >= 1970) %>%
  group_by(year) %>%
  summarise(Count = n()) %>%
  arrange(year) %>%
  
  ggplot(aes(x = year,y = Count)) +
  geom_bar(stat='identity',colour="white", fill = "blue") +
  
  labs(x = 'Meteorites Year', 
       y = 'Count', 
       title = 'Meteorites Year and Count') +
  theme_bw()

# Create a linear regression model
model2 <- lm(mass..g. ~ year + reclat + reclong, data = MetLand)

# Print the summary of the linear regression model
summary(model2)

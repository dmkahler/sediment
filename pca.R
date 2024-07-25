# Principal Component Analysis of Sentinel-2 bands
library(readr)
library(dplyr)
library(tidyr)
library(devtools)
install_github("vqv/ggbiplot") # select 1 and yes, Windows needs Rtools
library(ggbiplot)
library(ggplot2)

# EXAMPLE
# This example uses the built-in dataset, mtcars, without the categorical variables (vs and am)
data <- select(mtcars, -vs, -am)

# head(data)
pca2 <- prcomp(data, center = FALSE, scale. = FALSE)
summary(pca2)
ggbiplot(pca2)
pca1 <- prcomp(data, center = TRUE, scale. = TRUE)
summary(pca1)
ggbiplot(pca1, choices = c(1,2))
ggbiplot(pca1, choices = c(1,3))
ggbiplot(pca1, labels = rownames(data))
country <- c(rep("Japan", 3), rep("US",4), rep("Europe", 7), 
             rep("US",3), "Europe", rep("Japan", 3), 
             rep("US",4), rep("Europe", 3), "US", 
             rep("Europe", 3))
ggbiplot(pca1, ellipse=TRUE, labels = rownames(data), groups = country)

# ANALYSIS
x <- read_csv("./allSites.csv")
x <- x %>%
     select(B2, B3, B4, B5, B8, B11, sensor) %>%
     filter(is.na(B2)==FALSE)

pca <- prcomp(x, center = TRUE, scale. = TRUE)
summary(pca)
ggbiplot(pca, choices = c(1,2))
ggbiplot(pca, choices = c(1,4))


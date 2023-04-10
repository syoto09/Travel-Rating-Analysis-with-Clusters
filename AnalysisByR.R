

## Library lists

library("plyr")
library("dplyr")
library("Hmisc")
library("PerformanceAnalytics")
library("corrplot")
library("tidyverse")  # data manipulation
library("cluster")    # clustering algorithms
library("factoextra") # clustering algorithms & visualization
library("collapse")
library("scales")
library("psych") 


## Read a csv file


tripadvisor_review <- read.csv("!!!Insert the file fath!!!")
# View(tripadvisor_review)


## Change the column names
#new name lists
new_names <- c('UserId', 'Art_Galleries', 'Dance_Clubs', 'Juice_Bars',
               'Restaurants', 'Museums', 'Resorts', 'Parks_Picnics',
               'Beaches', 'Theaters', 'Religious')

colnames(tripadvisor_review) <- new_names
# View(tripadvisor_review)


## Summaty of each column
# Five number summary
summary(tripadvisor_review)


## Drop ID column
dfSub <- tripadvisor_review[,-1]



## Correlation matrix
corre <- rcorr(as.matrix(dfSub))
corre

## Correlation matrix Visualization
chart.Correlation(dfSub, histogram=TRUE, pch=19)

correlation = cor(dfSub)
corrplot(correlation, type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45)



#Drop ID column and apply SCALE function
df <- scale(tripadvisor_review[,-1])
View(df)



#Summary of df table and variance
summary(df)
apply(df, 2, var)


## K-mean & generate the K = 2,3,4, and 5
# Compute k-means with k = 4
set.seed(123)
k2 <- kmeans(df, centers = 2, nstart = 25)
k3 <- kmeans(df, centers = 3, nstart = 25)
k4 <- kmeans(df, centers = 4, nstart = 25)
k5 <- kmeans(df, centers = 5, nstart = 25)






## Clsuter plot prepare adn plot
#prepare
p1 <- fviz_cluster(k2, geom = "point", data = df) + ggtitle("k = 2")
p2 <- fviz_cluster(k3, geom = "point",  data = df) + ggtitle("k = 3")
p3 <- fviz_cluster(k4, geom = "point",  data = df) + ggtitle("k = 4")
p4 <- fviz_cluster(k5, geom = "point",  data = df) + ggtitle("k = 5")

## Cluster plot
library(gridExtra)
grid.arrange(p1, p2, p3, p4, nrow = 2)




#Apply methods to determine the number of cluster for our dataset
# Elbow method
fviz_nbclust(df, kmeans, method = "wss", print.summary = TRUE) +
  geom_vline(xintercept = 4, linetype = 2)+
  labs(subtitle = "Elbow method")

# Silhouette method with Kmeans
fviz_nbclust(df, kmeans, method = "silhouette")+
  labs(subtitle = "Silhouette method with K-means")

# Gap statistic
set.seed(123)
fviz_nbclust(df, kmeans, nstart = 25, method = "gap_stat", nboot = 500)+
  labs(subtitle = "Gap statistic method")



## Summary of models (k = 2,3,4 and 5)

#Summary K = 2
k2_rank <- aggregate(df, by=list(cluster=k2$cluster), mean)
View(k2_rank)

#Summary K = 3 
k3_rank <- aggregate(df, by=list(cluster=k3$cluster), mean)
view(k3_rank)

# summary K = 4
K4_rank <- aggregate(df, by=list(cluster=k4$cluster), mean)
View(K4_rank)

#Summary K = 5
k5_rank <- aggregate(df, by=list(cluster=k5$cluster), mean)
view(k5_rank)




## Final model
# Compute k-means clustering with k = 4
set.seed(123)
final <- kmeans(df, 4, nstart = 25)
print(final)

# Final model graph
fviz_cluster(final, data = df)







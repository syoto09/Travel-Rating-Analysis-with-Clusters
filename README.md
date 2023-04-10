# Travel Rating Analysis with Clusters

## Abstract

This study analyzed the travel rate reviews on destinations in 10 categories across East Asia. We used the cluster method to analyze the user's preference similarity. This method can divide the same group into similar and different groups with dissimilarities. We found the four other groups based on travel preferences and similarities of each user to recommend the sightseeing place.

## Technoloies

- [Excel](https://www.microsoft.com/en-us/microsoft-365/excel)
- [R](https://cran.r-project.org/bin/windows/base/)
- [Rstudion](https://posit.co/download/rstudio-desktop/)

## The list of R libraries:

- plyr
- dplyr
- Hmisc
- PerformanceAnalytics
- corrplot
- tidyverse
- cluster
- factoextra
- collapse
- scales
- psych

## Dataset

This data set is populated by TripAdvisor.com. Reviews of destinations in 10 categories mentioned across East Asia are considered. Each traveler rating is mapped as Excellent (4), Very Good (3), Average (2), Poor (1), and Terrible (0), and an average rating is used against each category per user. There are 980 unique user-ids. The dataset does not provide some information, such as the User’s age when the User visited East Asia and how many different palaces each category has per user.

The link is here:
[Data Source](https://archive.ics.uci.edu/ml/datasets/Travel+Reviews)

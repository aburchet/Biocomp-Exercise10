# Alice Burchett
# Exercies 10
# 11/22/22


library(ggplot2)
library(cowplot)

# Part 1:
# Scatter plot of 2 variables with a trendline

muscleData<-read.table("MuscleData.txt", header=T) #Prolly need to upload this too

ggplot(muscleData, aes(x=MeanIntensity, y=MassDisplacement)) +
  geom_point() +
  xlab("Mean Intensity") +
  ylab("Mass Displacement") +
  stat_smooth(method="lm") +
  theme_classic()

# Part 2
# Make 2 figures from data.txt, barplot and scatter plot, use geom_jitter() to make easier to see
# do bar and scatter plots say different thing?


data<-read.table("data.txt", header=T, sep=",")

# barplot of means of 4 populations (N,e,s,w)

bar<-ggplot(data, aes(x=region, y=observations)) +
        stat_summary(fun="mean", geom="bar")
        xlab("Region") +
        ylab("Observations") +
        theme_classic()

scatter<-ggplot(data, aes(x=region, y=observations)) +
  geom_point() +
  geom_jitter() +
  xlab("Region") +
  ylab("Observations") +
  theme_classic()

plot_grid(bar, scatter)

# The bar chart makes it look like the data from each region is about the same,
# with similar means. But, the scatter plot data shows that the data distributions
# are actually quite different between the regions, eg, the South has two separate
# clusters far apart, where North has a very close cluster around mean. 



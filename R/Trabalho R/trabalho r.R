# Packages 
install.packages('DataExplorer')
install.packages("dplyr")
install.packages("ggplot2")
install.packages('tidyr')
install.packages("ggpubr")
library(DataExplorer)
library(dplyr)
library(ggplot2)
library(tidyr)
library("ggpubr")

# import 
df <- read.csv('chembl.csv')

# str plot
plot_str(df, fontSize = 30)

# summary
summary(df)

# histogram
trim <- function(x){
  x[(x > quantile(x, probs = c(0.25), na.rm=TRUE)-1.5*IQR(x, na.rm=TRUE)) & (x < quantile(x, probs = c(0.75), na.rm=TRUE)+1.5*IQR(x,na.rm=TRUE))]
}


mol_weight_hist <- ggplot() + geom_histogram(aes(x = trim(df$Molecular_weight),y=..density..),color="#e9ecef", bins= 30, na.rm = TRUE) +
  xlab('Molecular Weight') + ylab('Frequência Relativa')
mol_weight_hist
AlogP_hist <- ggplot() + geom_histogram(aes(x = trim(df$AlogP), 
                                            y=..density..), color="#e9ecef") + 
  xlab('AlogP') + ylab('Frequência Relativa')
AlogP_hist

x <- trim(df$Molecular_weight)
x
trim(df$Molecular_weight)

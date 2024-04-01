##Installing and loading the necessary packages for data analysis and visualization
install.packages('DataExplorer')
install.packages("dplyr")
install.packages("ggplot2")
install.packages('tidyr')
install.packages("ggpubr")
install.packages("tidyverse")
install.packages("gridExtra")
install.packages("grid")
library(DataExplorer)
library(dplyr)
library(ggplot2)
library(tidyr)
library("ggpubr")
library(grid)
library(tidyverse)
library(gridExtra)
library(grid)


## import data
df <- read.csv('chembl.csv')


## Plotting a graph that displays the structure of the df data frame
plot_str(df, fontSize = 35)

##Generating a statistical summary of the df data frame
plot_missing(df)
summary(df)

##Counting the number of missing values in the "Name" column of the df data frame
sum(is.na(df$Name))

##Finding the highest and lowest observation in column of the df data frame
# Molecular_Weight
df[which.max(df$Molecular_weight),]
df[which.min(df$Molecular_weight),]
# AlogP
df[which.max(df$AlogP),]
df[which.min(df$AlogP),]
# numHacceptor
df[which.max(df$NumHAcceptors),]
df[which.min(df$NumHAcceptors),]
# numHacceptor
df[which.max(df$NumHDonors),]
df[which.min(df$NumHDonors),]
# numRotatableBonds
df[which.max(df$NumRotatableBonds),]
df[which.min(df$NumRotatableBonds),]
# RingCount
df[which.max(df$RingCounts),]
df[which.min(df$RingCounts),]
# RingCount
df[which.max(df$TPSA),]
df[which.min(df$TPSA),]
#Type
contagem <- table(df$Type)
porcentagens <- prop.table(contagem) * 100
barplot(contagem,ylim = c(0, max(contagem) * 1.2),yaxt = "n")
text(x = barplot(contagem), y = contagem, labels = paste0(round(porcentagens, 1), "%"), pos = 3, cex = 0.8)
axis(2, at = seq(0, max(contagem) * 1.2, by = 500000))
small_count <- sum(df$Type == "Small molecule")
unknown <- sum(df$Type == "Unknown")
protein <- sum(df$Type == "Protein")
oligosaccharide <- sum(df$Type == "Oligosaccharide")
oligonucleotide <- sum(df$Type == "Oligonucleotide")
gene <- sum(df$Type == "Gene")
enzyme <- sum(df$Type == "Enzyme")
cell <- sum(df$Type == "Cell")
antibody <- sum(df$Type == "Antibody")

# histograms
trim <- function(x){
  x[(x > quantile(x, probs = c(0.25), na.rm=TRUE)-1.5*IQR(x, na.rm=TRUE)) & (x < quantile(x, probs = c(0.75), na.rm=TRUE)+1.5*IQR(x,na.rm=TRUE))]
}

mol_weight_hist_trimmed <- ggplot() + geom_histogram(aes(x = trim(df$Molecular_weight),y=after_stat(density)),color="#e9ecef", bins= 30, na.rm = TRUE) +
  xlab('Molecular Weight') + ylab('Frequência Relativa')
mol_weight_hist_trimmed

mol_weight_hist <- ggplot() + geom_histogram(aes(x = df$Molecular_weight,y=after_stat(density)),color="#e9ecef", bins= 30, na.rm = TRUE) +
  xlab('Molecular Weight') + ylab('Frequência Relativa')
mol_weight_hist

AlogP_hist_trimmed <- ggplot() + geom_histogram(aes(x = trim(df$AlogP), y=after_stat(density)), color="#e9ecef",na.rm = TRUE) + 
  xlab('AlogP') + ylab('Frequência Relativa')
AlogP_hist_trimmed

AlogP_hist <- ggplot() + geom_histogram(aes(x = df$AlogP, y=after_stat(density)), color="#e9ecef",na.rm = TRUE) + 
  xlab('AlogP') + ylab('Frequência Relativa')
AlogP_hist

numHAcceptors_hist <- ggplot() + geom_histogram(aes(x = df$NumHAcceptors,y=after_stat(count/sum(count))),color="#e9ecef", bins= 30, na.rm = TRUE) +
  xlab('Number of H Acceptors') + ylab('Frequência Relativa')
numHAcceptors_hist

numHAcceptors_hist_trimmed <- ggplot() + geom_histogram(aes(x = trim(df$NumHAcceptors),y=after_stat(count/sum(count))),color="#e9ecef", bins= 30, na.rm = TRUE) +
  xlab('Number of H Acceptors') + ylab('Frequência Relativa')
numHAcceptors_hist_trimmed

numHDonors_hist <- ggplot() + geom_histogram(aes(x = df$NumHDonors,y=after_stat(count/sum(count))),color="#e9ecef", bins= 30, na.rm = TRUE) +
  xlab('Number of H Donors') + ylab('Frequência Relativa')
numHDonors_hist

numHDonors_hist_trimmed <- ggplot() + geom_histogram(aes(x = trim(df$NumHDonors),y=after_stat(count/sum(count))),color="#e9ecef", bins= 30, na.rm = TRUE) +
  xlab('Number of H Donors') + ylab('Frequência Relativa')
numHDonors_hist_trimmed

numRotatableBonds_hist <- ggplot() + geom_histogram(aes(x = df$NumRotatableBonds,y=after_stat(count/sum(count))),color="#e9ecef", bins= 30, na.rm = TRUE) +
  xlab('Number of Rotatable Bonds') + ylab('Frequência Relativa')
numRotatableBonds_hist

numRotatableBonds_hist_trimmed <- ggplot() + geom_histogram(aes(x = trim(df$NumRotatableBonds),y=after_stat(count/sum(count))),color="#e9ecef", bins= 30, na.rm = TRUE) +
  xlab('Number of Rotatable Bonds') + ylab('Frequência Relativa')
numRotatableBonds_hist_trimmed

ringcounts_hist <- ggplot() + geom_histogram(aes(x = df$RingCounts,y=after_stat(count/sum(count))),color="#e9ecef", bins= 30, na.rm = TRUE) +
  xlab('Aromatic Rings Count') + ylab('Frequência Relativa')
ringcounts_hist

ringcounts_hist_trimmed <- ggplot() + geom_histogram(aes(x = trim(df$RingCounts),y=after_stat(count/sum(count))),color="#e9ecef", na.rm = TRUE) +
  xlab('Aromatic Rings Count') + ylab('Frequência Relativa')
ringcounts_hist_trimmed

tpsa_hist <- ggplot() + geom_histogram(aes(x = df$TPSA,y=after_stat(count/sum(count))),color="#e9ecef", bins= 30, na.rm = TRUE) +
  xlab('Topological Polar Surface Area') + ylab('Frequência Relativa')
tpsa_hist

tpsa_hist_trimmed <- ggplot() + geom_histogram(aes(x = trim(df$TPSA),y=after_stat(count/sum(count))),color="#e9ecef", na.rm = TRUE) +
  xlab('Topological Polar Surface Area') + ylab('Frequência Relativa')
tpsa_hist_trimmed

hist_trimmed <- ggarrange(mol_weight_hist_trimmed, AlogP_hist_trimmed, numHAcceptors_hist_trimmed, numHDonors_hist_trimmed, numRotatableBonds_hist_trimmed, ringcounts_hist_trimmed, tpsa_hist_trimmed)
hist_trimmed

hist <- ggarrange(mol_weight_hist, AlogP_hist, numHAcceptors_hist, numHDonors_hist, numRotatableBonds_hist, ringcounts_hist, tpsa_hist)
hist
#plot of all trimmed histograms               
annotate_figure(hist_trimmed, top = text_grob("Trimmed Histograms of the quantitative variables", 
                                      color = "black", face = "bold", size = 14))     
#plot of all histograms   
annotate_figure(hist, top = text_grob("Histograms of the quantitative variables", 
                                              color = "black", face = "bold", size = 14))  


# Proportions
between_index <- (df$Molecular_weight > quantile(df$Molecular_weight, probs = c(0.25), na.rm=TRUE)-1.5*IQR(df$Molecular_weight, na.rm=TRUE)) & (df$Molecular_weight < quantile(df$Molecular_weight, probs = c(0.75), na.rm=TRUE)+1.5*IQR(df$Molecular_weight,na.rm=TRUE))
between_index
contagem <- table(df$Type)
porcentagens <- prop.table(contagem) * 100
barplot(contagem,ylim = c(0, max(contagem) * 1.2),yaxt = "n")
text(x = barplot(contagem), y = contagem, labels = paste0(round(porcentagens, 1), "%"), pos = 3, cex = 0.8)
axis(2, at = seq(0, max(contagem) * 1.2, by = 500000))


#boxplot
plot_boxplot(df, by= 'Type', geom_boxplot_args = list(outlier.stroke = T))
# Corretation
plot_correlation(na.omit(df %>% select(Molecular_weight,AlogP, NumHAcceptors, NumHDonors, NumRotatableBonds, RingCounts, TPSA)), maxcat = 5L)
# Regressions
tpsavshacceptor <- ggplot(df)  + geom_point(aes(x=NumHAcceptors, y= TPSA)) + geom_smooth(mapping = aes(x=NumHAcceptors, y= TPSA),method='lm',color = 'red') 
tpsavsAlogp <- ggplot(df)  + geom_point(aes(x=AlogP, y= TPSA))  + geom_smooth(mapping = aes(x=AlogP, y= TPSA),method='lm',color = 'red')
ringvsalogp <- ggplot(df)  + geom_point(aes(x=AlogP, y= RingCounts)) + geom_smooth(mapping = aes(x=AlogP, y= RingCounts),method='lm',color = 'red') 
rotatable <- ggplot(df)  + geom_point(aes(x=NumRotatableBonds, y= Molecular_weight)) + geom_smooth(mapping = aes(x=NumRotatableBonds, y= Molecular_weight),method='lm',color = 'red') 
numhdonors1 <- ggplot(df) + geom_point(aes(x=NumHDonors, y= TPSA)) + geom_smooth(mapping = aes(x=NumHDonors, y= TPSA),method='lm',color = 'red')
numhdonors2 <- ggplot(df)   + geom_point(aes(x=NumHDonors, y= AlogP)) + geom_smooth(mapping = aes(x=NumHDonors, y= AlogP),method='lm',color = 'red')
numhacceptor <- ggplot(df) + geom_point(aes(x=NumHDonors, y= AlogP)) + geom_smooth(mapping = aes(x=NumHAcceptors, y= AlogP),method='lm',color = 'red')
molecularweight <- ggplot(df)  + geom_point(aes(x=Molecular_weight, y= NumRotatableBonds))+ geom_smooth(mapping = aes(x=Molecular_weight, y= NumRotatableBonds),method='lm',color = 'red') 
regressions <- ggarrange(tpsavshacceptor, tpsavsAlogp, ringvsalogp, rotatable, numhdonors1, numhdonors2, numhacceptor, molecularweight)
# plot of the strongest regressions
annotate_figure(regressions, top = text_grob("Scatter plots with regression line", color = "black", face = "bold", size = 14))

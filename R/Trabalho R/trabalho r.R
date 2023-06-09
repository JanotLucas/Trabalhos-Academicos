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
               
annotate_figure(hist_trimmed, top = text_grob("Trimmed Histograms of the quantitative variables", 
                                      color = "black", face = "bold", size = 14))     

annotate_figure(hist, top = text_grob("Histograms of the quantitative variables", 
                                              color = "black", face = "bold", size = 14))  


                                                                                                                                    
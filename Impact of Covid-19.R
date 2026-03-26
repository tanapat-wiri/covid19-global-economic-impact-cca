#loading the required packages
library(dplyr) 
library(lme4)
library(CCA) 
library(CCP) 
library(vegan)

#Prepare data
dat <- read.csv("Impact of Covid-19.csv",header = TRUE)
dat <- aggregate(. ~ COUNTRY, data = dat, FUN = mean)
dat
dat$GDPCAP <- as.numeric(dat$GDPCAP)
dat$STI <- as.numeric(dat$STI)
dat$HDI <- as.numeric(dat$HDI)
dat$total_cases <- as.numeric(dat$total_cases)
dat$total_deaths <- as.numeric(dat$total_deaths)
dat$stringency_index <- as.numeric(dat$stringency_index)
dat$stringency_index <- cut(dat$stringency_index, 
                             breaks = c(0, 20, 40, 60, 80, 100), 
                             labels = c(1, 2, 3, 4, 5),
                             include.lowest = TRUE)
dat
summary(dat)
fix(dat)
Eco<-dat[,2:4]
Eco$GDPCAP <- as.numeric(Eco$GDPCAP)
Eco$STI <- as.numeric(Eco$STI)
Eco$HDI <- as.numeric(Eco$HDI)
Eco
covid<-dat[,5:7]
covid$total_cases <- as.numeric(covid$total_cases)
covid$total_deaths <- as.numeric(covid$total_deaths)
covid$stringency_index <- as.numeric(covid$stringency_index)
covid
cormat<-matcor(Eco,covid)
img.matcor(cormat, type = 2)
can_cor1=cc(Eco,covid)
can_cor1$cor
can_cor1$xcoef
can_cor1$ycoef
can_cor1$scores

# Perform Redundancy Analysis (RDA)
can_cor2 <- comput(Eco,covid,can_cor1)
D<-can_cor2$corr.X.xscores
G<-can_cor2$corr.Y.yscores

col <- ncol(D)
u.list <- c()
v.list <- c()
for(i in 1:col){
  #U
  d <- matrix(D[,i])
  d_T <- t(d)
  u <- (d_T %*% d)/4
  cat(sprintf("U%d : %.2f%%\n",
              i, u * 100,"\n"))
  u.list[i] <- u
  #V
  g <- matrix(G[,i])
  g_T <- t(g)
  v <- (g_T %*% g)/4
  cat(sprintf("V%d : %.2f%%\n",
              i,v * 100,"\n"))
  v.list[i] <- v
}




#CCP package.
#test of canonical dimensions
rho=can_cor1$cor
rho
n = nrow(Eco)
n
p = ncol(Eco)
p
q = ncol(covid)
q
p.asym(rho,n,p,q,tstat="Wilks")



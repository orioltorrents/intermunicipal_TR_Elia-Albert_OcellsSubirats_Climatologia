###################################
########## Dades climàtiques ##########
###################################

# Activem directori de treball
# S'han de canviar els slashs \ per /
# El directori de treball es pot fixar manualment a l'opció "Session"
setwd("~/RStudio/TREC_EliaAlbert_Climograma")

# Carreguem les llibreries
library(googlesheets4)
library(climatol)
library(climaemet)
library(ggplot2)
# library(tidyverse)
# library(knitr)
# library(cowplot)
# library(magick)
# library(scales)
# library(dplyr)
# library(vegan)
# library(permute)
# library(lattice)
# library(tinytex)
# library(gganimate)
# library(gifski)

# Posem url de les dades en la variable "url_dades_elia"
url_dadesclimatiques_elia <- "https://docs.google.com/spreadsheets/d/14kz6o8FV6U4E8W94gIh2lhzXeaiiA0SRemWVwYjdAvY/edit#gid=1976000054"

# Llegim la sheet de les dades climàtiques
# Les dades climàtiques son totes les dades que disposem
dades_climatol <- googlesheets4::read_sheet(url_dadesclimatiques_elia, sheet = "Climatol 2022")

#### Arreglem les dades de les Dates
# dades_climatiques_dates <- as.Date(dades_climatiques$Date)
# MonthLabsSencers <- c("Gener", "Febrer", "Març", "Abril", "Maig", "Juny", "Juliol", "Agost", "Septembre", "Octubre", "Novembre", "Desembre")
# MonthLabsAbreviats <- c("Gen", "Feb", "Mar", "Abr", "Maig", "Juny", "Jul", "Ago", "Sep", "Oct", "Nov", "Des")
# MonthLabsSimbols <- c("G", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D")
# minimum <- min(dades_climatiques_dates)
# minimum <- as.Date("2022-01-01")
# maximum <- max(dades_climatiques_dates)
# maximum <- as.Date("2022-12-31")

#### Eliminem les etiquetes de la primera columna
dades_climatol2 <- dades_climatol[2:13]
#### Engegem el Climatol
# diagwl del paquet Climatol no es pot modificar
DiaWyL <- dades_climatol2
DiaWyL
p1 <- diagwl(DiaWyL,est="Sant Pau d'Ordal (Altitud: 243 m)",per=2022,mlab ="es")

# ggclimat_walter_lieth del paquet climaemet es pot modificar com ggplot2
p2 <- ggclimat_walter_lieth(DiaWyL,est="Sant Pau d'Ordal (Altitud: 243 m)",per=2022,mlab ="es")
p2  
p2 + theme(
  plot.background = element_rect(fill = "grey80"),
  panel.background = element_rect(fill = "grey70"),
  axis.text.y.left = element_text(
    colour = "black",
    face = "italic"
  ),
  axis.text.y.right = element_text(
    colour = "black",
    face = "bold",
    size = "18"
  )
)

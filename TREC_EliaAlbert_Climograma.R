###################################
########## Dades climàtiques ##########
###################################

# Activem directori de treball
# S'han de canviar els slashs \ per /
# El directori de treball es pot fixar manualment a l'opció "Session"
setwd("~/development/trec/TR_Elia-Albert_OcellsSubirats_Climatologia")

# Carreguem les llibreries
library(googlesheets4)
library(ggplot2)
library(dplyr)
library(tidyverse)
# library(climatol)
# library(knitr)
# library(cowplot)
# library(magick)
# library(scales)
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
dades_climatiques <- googlesheets4::read_sheet(url_dadesclimatiques_elia, sheet = "All")
# Llegim la sheet de les dades de temperatura
dades_temp <- googlesheets4::read_sheet(url_dadesclimatiques_elia, sheet = "Temperature")
dades_pluja <- googlesheets4::read_sheet(url_dadesclimatiques_elia, sheet = "Rain") 
# Llegim la sheet de les dades del Climograma
# Les dades del climograma són les arreglades amb Dynamic Table i Transpose dins Spreadsheet
dades_climograma <- googlesheets4::read_sheet(url_dadesclimatiques_elia, sheet = "Climograma")

#### Arreglem les dades de les Dates
# dades_climatiques_dates <- as.Date(dades_climatiques$Date)
# MonthLabsSencers <- c("Gener", "Febrer", "Març", "Abril", "Maig", "Juny", "Juliol", "Agost", "Septembre", "Octubre", "Novembre", "Desembre")
# MonthLabsAbreviats <- c("Gen", "Feb", "Mar", "Abr", "Maig", "Juny", "Jul", "Ago", "Sep", "Oct", "Nov", "Des")
# MonthLabsSimbols <- c("G", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D")
# minimum <- min(dades_climatiques_dates)
# minimum <- as.Date("2022-01-01")
# maximum <- max(dades_climatiques_dates)
# maximum <- as.Date("2022-12-31")

#### Seleccionem dades de Temp mitjana i pluja  #####
# per seleccionar un rang 2:2
# per seleccionar columnes puntuals c(5,7)
temp_mitjana_diaria <- dades_temp[,3:12]
pluja_diaria <- dades_pluja[,3:12]


### Calculem mitjana mensual de temperatura
temp_mitjana_mensual <- colMeans(temp_mitjana_diaria, na.rm = TRUE)
View(temp_mitjana_mensual)
### Acumulem valors de pluja 
pluja_acumulada_mensual <- colSums(pluja_diaria, na.rm = TRUE)
View(pluja_acumulada_mensual)



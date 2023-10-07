#  3 Descripcion de una base de datos ####
## 3.1 Cantidad y tipo de variables ####
# is.integrer
# is.numeric
# is.character
# is.factor
# is.logical
# is.na
# is.null


data(cars)
# ?cars

# Muestra el tipo de variable
class(cars)
# data.frame"

# Muestra la estructura de la variable
str(cars)
'data.frame':	50 obs. of  2 variables:
#   $ speed: num  4 4 7 7 8 9 10 10 10 11 ...
# $ dist : num  2 10 4 22 16 10 18 26 34 17 ...
 
# Tamaño del dataset, renglones y columnas   
dim(cars)
# [1] 50  2

#Numero de renglones
nrow(cars)
# [1] 50

# Numero de columnas
ncol(cars)
# [1] 2     

# (memoria en uso)
object.size(cars)
# 1648 bytes 

# Nombre de las columnas
names(cars)
# [1] "speed" "dist" 

# Primeras 10 observaciones o renglones del dataset
head(cars,10)
# speed dist
# 1      4    2
# 2      4   10
# 3      7    4
# 4      7   22
# 5      8   16
# 6      9   10
# 7     10   18
# 8     10   26
# 9     10   34
# 10    11   17

# Ultimos 10 renglones u observaciones del dataset
tail(cars,10)
# speed dist
# 41    20   52
# 42    20   56
# 43    20   64
# 44    22   66
# 45    23   54
# 46    24   70
# 47    24   92
# 48    24   93
# 49    24  120
# 50    25   85

# Resumen de diferentes metricas de un dataset
summary(cars)
# speed           dist       
# Min.   : 4.0   Min.   :  2.00  
# 1st Qu.:12.0   1st Qu.: 26.00  
# Median :15.0   Median : 36.00  
# Mean   :15.4   Mean   : 42.98  
# 3rd Qu.:19.0   3rd Qu.: 56.00  
# Max.   :25.0   Max.   :120.00  

# Instalacion de pacquete ADER
# install.packages("ADER")

# Carga de liberia ADER
library(ADER)

?defo
# Data about defoliation in 76 stands of Pinus spp. 
# forests in Sierra de los Filabres, Almeria, Spain

# Carga de datos dataset defoliacion
data(defo)

str(defo)
# 'data.frame':	76 obs. of  12 variables:
#   $ x                : num  543726 543486 542903 535211 539086 ...
# $ y                : num  4124164 4124224 4122417 4118071 4121908 ...
# $ Especie          : Factor w/ 2 levels "Pinus nigra",..: 1 1 1 1 1 1 1 2 1 1 ...
# $ Defoliacion      : int  55 55 30 55 30 55 55 60 45 55 ...
# $ Area_basimetrica : num  25.8 28.1 24.2 22 18 ...
# $ Altura_media     : num  5.2 6.5 6.4 8 8.2 4 6.8 7 5.5 3.8 ...
# $ Densidad_pinos   : int  286 286 1592 923 1974 223 103 1293 1401 1496 ...
# $ Elevacion        : num  1807 1821 1877 1909 1688 ...
# $ Pendiente        : num  17.7 16.5 18.2 12.1 14.8 ...
# $ Orientacion      : num  220.2 189 248.8 174.7 98.4 ...
# $ Insolacion       : num  8526 8560 8480 8680 8481 ...
# $ Potencial_hidrico: num  6.7 5.01 3.08 6.66 7.8 ...

names(defo)
# [1] "x"                 "y"                 "Especie"           "Defoliacion"       "Area_basimetrica"  "Altura_media"      "Densidad_pinos"   
# [8] "Elevacion"         "Pendiente"         "Orientacion"       "Insolacion"        "Potencial_hidrico"

summary(defo)
# Pendiente        Orientacion        Insolacion   Potencial_hidrico
# Min.   : 0.3816   Min.   :  1.156   Min.   :7681   Min.   :3.083    
# 1st Qu.:11.5786   1st Qu.: 84.777   1st Qu.:8406   1st Qu.:5.872    
# Median :15.3572   Median :138.216   Median :8559   Median :6.446    
# Mean   :14.6317   Mean   :155.246   Mean   :8506   Mean   :6.512    
# 3rd Qu.:17.8143   3rd Qu.:217.536   3rd Qu.:8672   3rd Qu.:7.162    
# Max.   :28.7780   Max.   :359.648   Max.   :8890   Max.   :9.788    

levels(defo$Especie)
# [1] "Pinus nigra"      "Pinus sylvestris"

# Seleccion de subconjunto en base a un filtro
defoNigra <- defo[defo$Especie == "Pinus nigra",]

# Seleccion de subconjunto en base a filtro compuesto
# Pinus nigra y su elevacion sea mayor a 1700
defoNigraElevacion <- defo[defo$Especie == "Pinus nigra" & defo$Elevacion>=1700,]

# Seleccion de subconjunto utilizando subset
defoNigraSubSet <- subset(defo, defo$Especie=="Pinus nigra" & Elevacion>= 1700)

# Definicion de una variable tipo dataframe, con sus columnas
densidad <- data.frame(
  Especie = c("Especie01", "Especie02", "Especie03"),
  Densidad = c(0.988, 0.658, 0.919))

# Visualizar data frame
View(densidad)

# Definicion de una variable tipo dataframe, con sus columnas
arboles <- data.frame(
  Especie = c("Especie01", "Especie02", "Especie03"),
  Familia = c("Familia01", "Familia02", "Familia03"))

# Visualizar data frame
View(arboles)

# Se mezclan los datasets para generar uno nuevo en base un campo comun,
# en caso de que no se tenga una correspondencia se omite el row
bdMerge <- merge(densidad, arboles, by="Especie")
View(bdMerge)


arboles2 <- data.frame(
  Especie = c("Especie01", "Especie02", "Especie03", "Especie04"),
  Familia = c("Familia01", "Familia02", "Familia03", "Familia03"))

# Se mezclan los datasets para generar uno nuevo en base un campo comun,
# en caso de que no se tenga una correspondencia se asigna un valor NA
bdMerge2 <- merge(densidad, arboles2, by="Especie", all=T)
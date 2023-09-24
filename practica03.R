# 1.7 Objetos y dimensiones en R ####
### Packages ####
### Installed Packages ####
# install.packages("foreign");

### Used Packages ####
library(foreign);
## 1.7.4 Generacion de datos ####
x <- 1:30; x         # Rango de 1 al 30
y <- 1:10-1; y       # Rango de 1 al 10, a cada uno se le resta 1

z <- seq(1,5,0.5);z  # Secuencia del 1 al 5, con un incremento de 0.5
# [1] 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0

?seq()               # Ayuda del metodo o funcion (seq en este caso)

seq(length=9, from=1, to=5) # Secuencia de 9 elementos del 1 al 5
# [1] 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0

valores <- c(1, 1.2, 1.8, 2, 2.3, 2.9, 3.4, 3.7, 5); valores
                     # Asignacion de valores especificos a una variable
                     # se usa cuando no se tiene un patron en la secuencia
# [1] 1.0 1.2 1.8 2.0 2.3 2.9 3.4 3.7 5.0

rep(1, 30)           # Repite un valor n veces, (1 , 30 veces en este caso)
# [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1

sequence(4:5)        # Genera un par de secuencias, una termina en 4 y otra en 5
# [1] 1 2 3 4 1 2 3 4 5

seq(1:5)             # Se genera una sola secuencia del 1 al 5
# [1] 1 2 3 4 5

sequence(c(10,5))    # Genera dos secuencias, una termina en 10 y la otra en 5
# [1]  1  2  3  4  5  6  7  8  9 10  1  2  3  4  5

sequence(10:5)       # Genera tantas secuencias como hay en el rango dado,
                     # en este caso 6 secuencias, una termina en 10,9,8,7,6 y 5
# [1]  1  2  3  4  5  6  7  8  9 10  1  2  3  4  5  6  7  8  9  1  2  3  4  5  6  
# 7  8  1  2  3  4  5  6  7  1  2  3  4  5  6  1  2  3  4  5

gl(3,5)              # Generador de niveles, genera series regulares de factores
                     # Repite n niveles la cantidad de repeticiones, en este 
                     # caso, 3 niveles, 5 repeticiones (5 veces el 1, 5 el 2 y
                     # 5 el 3)
# [1] 1 1 1 1 1 2 2 2 2 2 3 3 3 3 3
# Levels: 1 2 3

gl(3, 5, length = 30) # Se generan 30 datos, en 3 niveles 5 repeticiones
# [1] 1 1 1 1 1 2 2 2 2 2 3 3 3 3 3 1 1 1 1 1 2 2 2 2 2 3 3 3 3 3
# Levels: 1 2 3

gl(2, 6, labels = c("Hembra", "Macho")) # Se generan 2 niveles, con 6 
                     # repeticiones, con las etiquetas dadas
# [1] Hembra Hembra Hembra Hembra Hembra Hembra Macho  Macho  
# Macho  Macho  Macho  Macho 
# Levels: Hembra Macho

datos <- expand.grid(a = c(60, 80), p = c(100, 300), sx = c("Hembra", "Macho"))
#expand genear las combinaciones posibles entre los vectores o variables
datos
# a   p     sx
# 1 60 100 Hembra
# 2 80 100 Hembra
# 3 60 300 Hembra
# 4 80 300 Hembra
# 5 60 100  Macho
# 6 80 100  Macho
# 7 60 300  Macho
# 8 80 300  Macho

pob <- c(34, 20, 19)
paises <- c("España", "Francia", "Italia")

df1 <- data.frame(pob, paises); df1 # Creacion de dataframe a partir de dos 
# variables
# pob  paises
# 1  34  España
# 2  20 Francia
# 3  19  Italia

continente <- rep("Europa",3);continente # Se asigna a una variable un valor 
# que se repite
# [1] "Europa" "Europa" "Europa"

df2 <- cbind(df1, continente);df2 # Creacion de un dataframe a partir de la
# union de columnas
# pob  paises continente
# 1  34  España     Europa
# 2  20 Francia     Europa
# 3  19  Italia     Europa

View(df2) # Visualizar df2 (la variable en el viewer)
datosNuevos <- data.frame(pob = 3, paises = "Camerun", continente = "Africa");
datosNuevos
# pob  paises continente
# 1   3 Camerun     Africa

df3 <- rbind(df2, datosNuevos);df3 # Se crea un nuevo dataframe agregando 
# un nuevo row al dataframe existente
# pob  paises continente
# 1  34  España     Europa
# 2  20 Francia     Europa
# 3  19  Italia     Europa
# 4   3 Camerun     Africa

df3$area <- c(505.9, 301.2, 357, 475.4);df3 # Se agrega una nueva columna 
#a un dataframe
# pob  paises continente  area
# 1  34  España     Europa 505.9
# 2  20 Francia     Europa 301.2
# 3  19  Italia     Europa 357.0
# 4   3 Camerun     Africa 475.4

str(df3) # Visualizar estructura de df3
# 'data.frame':	4 obs. of  4 variables:
#   $ pob       : num  34 20 19 3
# $ paises    : chr  "España" "Francia" "Italia" "Camerun"
# $ continente: chr  "Europa" "Europa" "Europa" "Africa"
# $ area      : num  506 301 357 475

df3$paises <- as.factor(df3$paises) 
# Se cambia el tipo a la columna a tipo factor

str(df3) # Comprobamos la estructura de df3
# 'data.frame':	4 obs. of  4 variables:
#   $ pob       : num  34 20 19 3
# $ paises    : Factor w/ 4 levels "Camerun","España",..: 2 3 4 1
# $ continente: chr  "Europa" "Europa" "Europa" "Africa"
# $ area      : num  506 301 357 475

df3[c(1,4),] # Se muestra el renglon 1 y el renglon 4
# pob  paises continente  area
# 1  34  España     Europa 505.9
# 4   3 Camerun     Africa 475.4

df3[,1:2] # Se  muestra columna 1 y columna 2
df3[,c(1,2)]
# pob  paises
# 1  34  España
# 2  20 Francia
# 3  19  Italia
# 4   3 Camerun

df3[,c(1,4)] # Se muestra columna 1 y columna 4
# pob  area
# 1  34 505.9
# 2  20 301.2
# 3  19 357.0
# 4   3 475.4

df3[1,4] # Se muestra el valor del renglon 1 y columna 4
# [1] 505.9


df3[,-3] # Se muestran las columnas con excepcion de la 3
# pob  paises  area
# 1  34  España 505.9
# 2  20 Francia 301.2
# 3  19  Italia 357.0
# 4   3 Camerun 475.4

df3[,"pob"] #Muestra la columna pb del dataframe df3
df3$pob
# [1] 34 20 19  3

attach(df3) #Se hace un attach al dataframe para no tener que hacer la 
# referencia explicita cuando se usan sus variables o columnas
area # Se usa la columna sin referenciar el dataframe al que pertenece
# [1] 505.9 301.2 357.0 475.4
detach(df3) # Se rompe el attach existente

lista <- list(df1, df2, df3); # Creacion de una lista a partir de los df
str(lista) # Visualizacion de la estructura de la lista
# List of 3
# $ :'data.frame':	3 obs. of  2 variables:
#   ..$ pob   : num [1:3] 34 20 19
# ..$ paises: chr [1:3] "España" "Francia" "Italia"
# $ :'data.frame':	3 obs. of  3 variables:
#   ..$ pob       : num [1:3] 34 20 19
# ..$ paises    : chr [1:3] "España" "Francia" "Italia"
# ..$ continente: chr [1:3] "Europa" "Europa" "Europa"
# $ :'data.frame':	4 obs. of  4 variables:
#   ..$ pob       : num [1:4] 34 20 19 3
# ..$ paises    : Factor w/ 4 levels "Camerun","España",..: 2 3 4 1
# ..$ continente: chr [1:4] "Europa" "Europa" "Europa" "Africa"
# ..$ area      : num [1:4] 506 301 357 475

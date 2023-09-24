# Si se termina el comment con 4 #, se convierte en un nodo de navegacion
# Shift  + Option + Command + J  (Jumo to...)

# ??nombre_de_paquete, abre la ayuda del paquete

# nombre_paquete::function , se usa la funcion sin cargar toda la libreria
# Paqueterias ####
# Instalacion de paquetes
install.packages("ggplot2")
## Sub etiqueta ####

# Carga de paquetes
library(ggplot2)

install.packages("dplyr")

#Ayuda de una libreria
??ggplot2

#Ayuda de un metodo
?setwd()

#Para utilizar alguna funcion de alguna libreria, sin cargar toda la libreria
dplyr::arrange()

# Para indicar el directorio de trabajo
# setwd(path)

# Para indicar la ruta de trabajo en la sesion
# Shift + Ctrl + H

# Operaciones sobre 
# No se recomienda el uso de varias instrucciones en una misma linea
ls()          # Listado de las variables que estan en el global environment
ls(pat="s")   # Listado de variables que cumplen con un patron
ls(pat="^t")  # Listado de variables que empiecen con t
ls.str()      # Listado de variables con su estructura: tipo, contenido

rm(i)         # Para eliminar una variable del global environment
rm(a,b)       # Para eliminar un listado de variables

# Operaciones basicas en R ####

## Operadores de asignacion ####
a<-5  # Tipo de asignacion mas comun
6->b  # Asignacion no tan utilizada
i=8   # Por legibilidad no se usa esta asignacion
# <<-   # Asignacion global

edades<-c(10:15,17:22,35) # Asignacion de colecciones, ejemplo con rangos
tomates<-c("rojo", "verde") # Asignacion de coleccion de strings
semaforo<-as.factor(tomates)
bin <-c(1,0)
bin<-as.factor((bin))

## Operaciones basicas ####
5+7 # Suma de constantes
a+b # Suma de variables
a-b # Resta de variables
a*b # Multiplicacion de variables
a/b # Division de variables
a^b # Potencia 
a%/%b # Cociente de una division
b/a # Division de variables
b%/%a # Cociente de una division
b%%a # Residuo o modulo de una division

# Operaciones Logicas ####
9 < 7 
12 > 5

# Asignacion de vectores
d <- c(1, 3, 2)  
e <- c(1, 5,-2)
d == e   # Comparacion de vector, elemento por elemento
f <- c(1, 0, 0, 1)
d == f   # No se pueden comparar dos elementos de diferente longitud

#asignacion de diferentes variables en una sola linea
edad <- 12; nombre<-"juan"; status<-"TRUE";
# Asignacion de rango a un vector
x <- c(1:20)
# Seleccion de elementos especificos de un vector
x[5:7]
x[x>=15]
x[x%%2==0]

#DataFrame, al asignar los vectores todos deben tener la misma dimension
rm(miMarco)
miMarco<-data.frame(edad = c(15,19,13,NA,20),
                    deporte =c(TRUE, TRUE, NA, FALSE, TRUE),
                    comic=c(NA,"Superman", "Batman", NA, "Batman"))
miMarco
attach(miMarco)  #detach , para revertir el attach
# Seleccion de rows que cumplan la condicion, incluidos los NA
miMarco[edad>=15,]
miMarco[deporte == TRUE]
miMarco[edad>15&deporte==TRUE,]

respuesta <-c(TRUE, FALSE, TRUE)
respuesta
# ! operador de negacion
!respuesta

x<-c(5, 1.5, 2, 3, 2)
!(x<2.5)

# Evaluar elementos de un vector, sobre una condicion
y <- c(2, 4, 6, 8, 10)
y > 5

x<4 & y> 5

# Importar datos ####
# Importar datos de archivo de excel
library(readxl)
dsClientes <- read_excel("data/Lista-de-clientes-con-nombre-y-direccion.xlsx")
View(dsClientes)

# Importar datos de archivo separado por comas
library(readr)
DatosTitanicEsp <- read_csv("data/DatosTitanicEsp.csv")
View(DatosTitanicEsp)

# Importar datos de archivo de texto
# T = TRUE, F = False
Consumo_cerveza <- read.table(file="data/Consumo_cerveza.txt", header = TRUE, sep=",")
View(Consumo_cerveza)

# Importar datos desde una url
url <- "http://courses.washington.edu/b517/Datasets/string.txt"
webData <- read.table(url, header = TRUE)
View(webData)




































# Analisis ####
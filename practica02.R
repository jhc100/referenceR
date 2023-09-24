n <- 3 + rnorm(1);n
# rnorm random number, normal distribution

# Para tener resultados "repetibles", utilizamos un seed
# Numeros aleatorios ####
set.seed(1234)
n <- 3 + rnorm(1);n           # 1.792934
n <- 3 + rnorm(2);n           # Generacion de dos numeros aleatorios; 
                              #       4.0844412 0.6543023
n <- round(3 + rnorm(2), 2);n # Redondeo a dos decimales; 3.43 3.51
N <- 2.1e23;N                 #1.3x10-4  0.00013

# Tipos de objetos ####
## Factor ####
# levels : Opciones disponibles
# factor : Sub conjunto del universo de opciones disponibles
factor <- factor(c(2,4), levels = 2:5, labels = c("A","B","C","D"));
factor;

factor1 <- factor(1:3,labels=c("A","B","C"))
factor1

# Generacion de 10 num aleatorios
sample(10)

# Matriz ####
matrix(1:6, nrow = 2, ncol=3)
mx = matrix(1:9, nrow =3, ncol=3); mx

# Obtencion de datos
mx[2,3] # Un solo elemento
mx[2,]  # Una fila
mx[,2]  # Una columna

a <- c(1, 2, 3);
a + mx; # Matematicamente no es posible sumar un vector a una matriz
# R puede sumarlos, ya que una matriz, lo maneja como un arreglo de vectores

x <- 1:3
y <- 4:6

# Union de vectores para formar una matriz 
newMatrixC = cbind(x,y);newMatrixC; #cbind, union por columnas c/vector = col
newMatrixR = rbind(x,y);newMatrixR; #rbind, union por renglones, c/vector = row

# Crear matriz, aprovechando el patron (diagonal) + reciclaje de valores
matrix(5:8, nrow=3, ncol=4)

# Diferentes formas de crear una matrix con los mismos datos
rbind(c(10, 9, 5), c(7, 10, 10), c(3, 2, 7), c(7, 9, 10))
datos <- c(10,7,3,7,9,10,2,9,5,10,7,10)
matrixData <- matrix(datos, 4,3);matrixData;

apply(matrixData, 1, mean) # Mean per row, (1 para fila)
apply(matrixData, 2, mean) # Mean per column (2 para columna)

diag(matrixData) # Para obtener la diagonal
sort(matrixData) # Ordena elementos de un objeto
apply(matrixData,1,sort) # Se ordena por fila
apply(matrixData,2,sort) # Se ordena por columna
# Nota: el ordenamiento genera una matrix diferente

# Operaciones con matrices ####
# Producto matricial                A %*% B
# Producto elemento a elemento      A * B
# Transpuesta                       t(A)
# Determinante                      det(A)
# Extraer diagonal                  diag(A)
# Resolver sistema de 
# ecuaciones lineales               (\(Ax=b\)):solve(A,b)
# Inversa                           solve(A)
# Autovalores y autovectores        eigen(A)

A <- matrix(c(4,-2,3,0,1,-5),2,3);A
B <- matrix(c(0,1,3,2),2,2);B
C <- matrix(c(1,3,2,4),2,2);C

dim(A) # Para conocer las dimensiones de un objeto

A + B   # No es posible, diferentes dimensiones
B + C   # Mismas dimensiones 
2 * A   # Producto de escalar por una matriz
A * B   # Diferentes dimensiones, no es posible
B * A   # Diferentes dimensiones, no es posible
A %*% B # Diferentes dimensiones, no es posible
B %*% A # Si es posible
B * C   # Mismas dimensiones
B %*%C  # Mismas dimensiones

# Dataset ejemplo de R
iris
?iris

data <- iris;
summary(data); # Resumen de base de datos
str(data); # Visualizar estructura de dataset
names(data); # Nombre de las variables que componen el dataset (columnas + reng)
colnames(data); # Nombre de las variables de las columnas (encabezados)
head(data); # Trae los primeros 6 renglones del dataset
head(data, n=10); # Trae los 10 (n) renglones del dataset
tail(data, n=12); # Trae los ultimos 12 (n) renglones del dataset
tail(data); # Trae los ultimos 6 renglones del dataset

attach(data);       # Attach a dataset
mean(Sepal.Length); # Mean de Sepal Length
sd(Sepal.Length);

sapply(data[,-5], sd)  # Dos formas de aplicar la desviacion estandar 
sapply(data[,1:4], sd) # a todas las columnas menos la columna 5, 
tapply(Petal.Length, Species, mean) # Se aplica una funcion por columna/filtro
colnames(data)<-c("LargoSepalo","AnchoSepalo", "LargoPetalo", "AnchoPetalo");
colnames(data); # La ultima columna se quedo sin nombre
colnames(data)<-c("LargoSepalo",
                  "AnchoSepalo", 
                  "LargoPetalo", 
                  "AnchoPetalo",
                  "Especies");
colnames(data); # Ahora si la ultima columna tiene su "alias
mean(LargoSepalo); # No se reconoce la columnas con el nuevo alias, se requiere
                   # un nuevo attach
attach(data); 
mean(LargoSepalo); # Ahora si se toma el nuevo alias, 
                   # despues de efectual el attach
# library(dplyr)
# data <- iris;
# data <- data %>% rename("LargoSepalo"="Sepal.Length")
# detach(data); 

#Ejercicio ####
datos <- datasets::airquality; datos;
# Ozone Solar.R Wind Temp Month Day
# 1      41     190  7.4   67     5   1
# 2      36     118  8.0   72     5   2
# 3      12     149 12.6   74     5   3
# 4      18     313 11.5   62     5   4
# 5      NA      NA 14.3   56     5   5
# ....

summary(datos);
# Ozone           Solar.R           Wind             Temp           Month            Day      
# Min.   :  1.00   Min.   :  7.0   Min.   : 1.700   Min.   :56.00   Min.   :5.000   Min.   : 1.0  
# 1st Qu.: 18.00   1st Qu.:115.8   1st Qu.: 7.400   1st Qu.:72.00   1st Qu.:6.000   1st Qu.: 8.0  
# Median : 31.50   Median :205.0   Median : 9.700   Median :79.00   Median :7.000   Median :16.0  
# Mean   : 42.13   Mean   :185.9   Mean   : 9.958   Mean   :77.88   Mean   :6.993   Mean   :15.8  
# 3rd Qu.: 63.25   3rd Qu.:258.8   3rd Qu.:11.500   3rd Qu.:85.00   3rd Qu.:8.000   3rd Qu.:23.0  
# Max.   :168.00   Max.   :334.0   Max.   :20.700   Max.   :97.00   Max.   :9.000   Max.   :31.0  
# NA's   :37       NA's   :7                                                                      

str(datos);
# 'data.frame':	153 obs. of  6 variables:
#   $ Ozone  : int  41 36 12 18 NA 28 23 19 8 NA ...
# $ Solar.R: int  190 118 149 313 NA NA 299 99 19 194 ...
# $ Wind   : num  7.4 8 12.6 11.5 14.3 14.9 8.6 13.8 20.1 8.6 ...
# $ Temp   : int  67 72 74 62 56 66 65 59 61 69 ...
# $ Month  : int  5 5 5 5 5 5 5 5 5 5 ...
# $ Day    : int  1 2 3 4 5 6 7 8 9 10 ...
names(datos);
# "Ozone"   "Solar.R" "Wind"    "Temp"    "Month"   "Day"  
colnames(datos);
# "Ozone"   "Solar.R" "Wind"    "Temp"    "Month"   "Day" 
head(datos);
# Ozone Solar.R Wind Temp Month Day
# 1    41     190  7.4   67     5   1
# 2    36     118  8.0   72     5   2
# 3    12     149 12.6   74     5   3
# 4    18     313 11.5   62     5   4
# 5    NA      NA 14.3   56     5   5
# 6    28      NA 14.9   66     5   6
tail(datos);
# Ozone Solar.R Wind Temp Month Day
# 148    14      20 16.6   63     9  25
# 149    30     193  6.9   70     9  26
# 150    NA     145 13.2   77     9  27
# 151    14     191 14.3   75     9  28
# 152    18     131  8.0   76     9  29
# 153    20     223 11.5   68     9  30
attach(datos);
sapply(datos, sd);
# Ozone  Solar.R     Wind     Temp    Month      Day 
# NA       NA 3.523001 9.465270 1.416522 8.864520 
sapply(datos,mean);
# Ozone   Solar.R      Wind      Temp     Month       Day 
# NA        NA  9.957516 77.882353  6.993464 15.803922 
colnames(datos) <- c("Ozono", "RadiacionSolar","Viento","Temperatura","Mes","Dia");
colnames(datos);
# "Ozono"          "RadiacionSolar" "Viento"         "Temperatura"    "Mes"            "Dia" 
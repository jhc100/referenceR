# Respaso instrucciones
# Revisando informacion de base de datos iris
data <- iris
str(data)
levels(data$Species)
head(data,4)
tail(data,4)
head(data)
tail(data)
summary(data)
data[,1]
data$Sepal.Length
attach(data)
detach(data)
colnames(data)

mean(Sepal.Length)
mean(Sepal.Length,na.rm=T) # Para no tomar en cuenta los NA

mean(Sepal.Length, na.rm = T, trim=0.025)  # Para recortar o bien discriminar 
# un 2.5% del total de la poblacion , los quantiles de cada extremo , un 5% 
# en total

median(Sepal.Length) # calculo de la mediana

# Instalacion de paquete modeest, para calculo de moda
# install.packages("modeest")
library(modeest)

# Visualizar moda, con metodo mfv
mlv(Sepal.Length, method = "mfv")

# Escritura de datos a un archivo
write.csv(data, file="iris.csv")

# install.packages("xlsx")
library(xlsx)
write.xlsx(data, file = "iris.xlsx")

# Calculo de varianza
var(Sepal.Length)

# Calculo de desviacion estandar
sd(Sepal.Length)
# [1] 0.8280661

# Calculo de raiz cuadrada
sqrt(var(Sepal.Length))
# [1] 0.8280661

# Creacion de tabla tomando una propiedad del data frame
tabla01 <- table(Sepal.Length); tabla01
# Sepal.Length
# 4.3 4.4 4.5 4.6 4.7 4.8 4.9   5 5.1 5.2 5.3 5.4 5.5 5.6 5.7 5.8 5.9   6 6.1 6.2 6.3 6.4 6.5 6.6 6.7 6.8 6.9   7 7.1 7.2 7.3 7.4 7.6 7.7 7.9 
# 1   3   1   4   2   5   6  10   9   4   1   6   7   6   8   7   3   6   6   4   9   7   5   2   8   3   4   1   1   3   1   1   1   4   1 


#Ordenamiento de la tabla de manera descendente 
# Ordenamiento tomando en cuenta la frecuencia (descendente)
# en segundo termino valor de manera ascendente
sort(tabla01, decreasing = T)
# Sepal.Length
# 5 5.1 6.3 5.7 6.7 5.5 5.8 6.4 4.9 5.4 5.6   6 6.1 4.8 6.5 4.6 5.2 6.2 6.9 7.7 4.4 5.9 6.8 7.2 4.7 6.6 4.3 4.5 5.3   7 7.1 7.3 7.4 7.6 7.9 
# 10   9   9   8   8   7   7   7   6   6   6   6   6   5   5   4   4   4   4   4   3   3   3   3   2   2   1   1   1   1   1   1   1   1   1 


tabla02 <- table(Species) ; tabla02

# Valor minimo
min(Sepal.Length)
# [1] 4.3

# Valor maximo
max(Sepal.Length)
# [1] 7.9

# Rango
range(Sepal.Length)
# [1] 4.3 7.9

rango <- range(Sepal.Length)

# Calculo del rango de la variable
rango[2] - rango[1]
# [1] 3.6

# Funcion que calcula el rango en base a la diferencia
Rango <- function(x)
{
  return (max(x)-min(x));
}

# Aplicacion de funcion a una variable
Rango(Sepal.Length)
# > Rango(Sepal.Length)
# [1] 3.6

# Aplicacion de funcion a varias columnas usando sapply
sapply(data[,-5],Rango)
# > sapply(data[,-5],Rango)
# Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
# 3.6          2.4          5.9          2.4 

# Visualizar quantil
quantile(Sepal.Length, 0.25)
# > quantile(Sepal.Length, 0.25)
# 25% 
# 5.1 

# Quantil 
quantile(Sepal.Length, 0.5)
# > quantile(Sepal.Length, 0.5)
# 50% 
# 5.8 

# Aqui se encuentra el 50% de los datos, Medida inter quantil
IQR(Sepal.Length)
median(Sepal.Length)
# > median(Sepal.Length)
# [1] 5.8
# > IQR(Sepal.Length)
# [1] 1.3

# Summary agrupado por un variable categorica
by(data, Species, summary)
# Species: setosa
# Sepal.Length    Sepal.Width     Petal.Length    Petal.Width          Species  
# Min.   :4.300   Min.   :2.300   Min.   :1.000   Min.   :0.100   setosa    :50  
# 1st Qu.:4.800   1st Qu.:3.200   1st Qu.:1.400   1st Qu.:0.200   versicolor: 0  
# Median :5.000   Median :3.400   Median :1.500   Median :0.200   virginica : 0  
# Mean   :5.006   Mean   :3.428   Mean   :1.462   Mean   :0.246                  
# 3rd Qu.:5.200   3rd Qu.:3.675   3rd Qu.:1.575   3rd Qu.:0.300                  
# Max.   :5.800   Max.   :4.400   Max.   :1.900   Max.   :0.600                  
# ---------------------------------------------------------------------------------------------------------- 
#   Species: versicolor
# Sepal.Length    Sepal.Width     Petal.Length   Petal.Width          Species  
# Min.   :4.900   Min.   :2.000   Min.   :3.00   Min.   :1.000   setosa    : 0  
# 1st Qu.:5.600   1st Qu.:2.525   1st Qu.:4.00   1st Qu.:1.200   versicolor:50  
# Median :5.900   Median :2.800   Median :4.35   Median :1.300   virginica : 0  
# Mean   :5.936   Mean   :2.770   Mean   :4.26   Mean   :1.326                  
# 3rd Qu.:6.300   3rd Qu.:3.000   3rd Qu.:4.60   3rd Qu.:1.500                  
# Max.   :7.000   Max.   :3.400   Max.   :5.10   Max.   :1.800                  
# ---------------------------------------------------------------------------------------------------------- 
#   Species: virginica
# Sepal.Length    Sepal.Width     Petal.Length    Petal.Width          Species  
# Min.   :4.900   Min.   :2.200   Min.   :4.500   Min.   :1.400   setosa    : 0  
# 1st Qu.:6.225   1st Qu.:2.800   1st Qu.:5.100   1st Qu.:1.800   versicolor: 0  
# Median :6.500   Median :3.000   Median :5.550   Median :2.000   virginica :50  
# Mean   :6.588   Mean   :2.974   Mean   :5.552   Mean   :2.026                  
# 3rd Qu.:6.900   3rd Qu.:3.175   3rd Qu.:5.875   3rd Qu.:2.300                  
# Max.   :7.900   Max.   :3.800   Max.   :6.900   Max.   :2.500      

# Calculo de media por especie
by(data, Species, FUN=function(x) colMeans(x[,1:4]))
# Species: setosa
# Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
# 5.006        3.428        1.462        0.246 
# ---------------------------------------------------------------------------------------------------------- 
#   Species: versicolor
# Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
# 5.936        2.770        4.260        1.326 
# ---------------------------------------------------------------------------------------------------------- 
#   Species: virginica
# Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
# 6.588        2.974        5.552        2.026 

# Tabla de contingencia
IrisSize <- ifelse(Sepal.Length<median(Sepal.Length),"Small","Big"); IrisSize
# > IrisSize
# [1] "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Big"   "Small" "Small"
# [18] "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small"
# [35] "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Small" "Big"  
# [52] "Big"   "Big"   "Small" "Big"   "Small" "Big"   "Small" "Big"   "Small" "Small" "Big"   "Big"   "Big"   "Small" "Big"   "Small" "Big"  
# [69] "Big"   "Small" "Big"   "Big"   "Big"   "Big"   "Big"   "Big"   "Big"   "Big"   "Big"   "Small" "Small" "Small" "Big"   "Big"   "Small"
# [86] "Big"   "Big"   "Big"   "Small" "Small" "Small" "Big"   "Big"   "Small" "Small" "Small" "Small" "Big"   "Small" "Small" "Big"   "Big"  
# [103] "Big"   "Big"   "Big"   "Big"   "Small" "Big"   "Big"   "Big"   "Big"   "Big"   "Big"   "Small" "Big"   "Big"   "Big"   "Big"   "Big"  
# [120] "Big"   "Big"   "Small" "Big"   "Big"   "Big"   "Big"   "Big"   "Big"   "Big"   "Big"   "Big"   "Big"   "Big"   "Big"   "Big"   "Big"  
# [137] "Big"   "Big"   "Big"   "Big"   "Big"   "Big"   "Big"   "Big"   "Big"   "Big"   "Big"   "Big"   "Big"   "Big"

tabla03 <- table(IrisSize); tabla03
# IrisSize
# Big Small 
# 77    73 

data$Size <- IrisSize; data
# > data$Size <- IrisSize; data
# Sepal.Length Sepal.Width Petal.Length Petal.Width    Species  Size
# 1            5.1         3.5          1.4         0.2     setosa Small
# 2            4.9         3.0          1.4         0.2     setosa Small
# 3            4.7         3.2          1.3         0.2     setosa Small
# 4            4.6         3.1          1.5         0.2     setosa Small
# 5            5.0         3.6          1.4         0.2     setosa Small
Species
tabla04<- table(data$Species,data$Size); table04
# Big Small
# setosa       1    49
# versicolor  29    21
# virginica   47     3

# Proporcion en tabla 03
prop.table(tabla03)*100
# IrisSize
# Big    Small 
# 51.33333 48.66667 

# Proporcionalidad por renglon (1)
prop.table(tabla03,1)*100 
# IrisSize
# Big Small 
# 100   100 

# Proporcionalidad por columna (2)
round(prop.table(tabla04, 2) * 100, 2)
# Big Small
# setosa      1.30 67.12
# versicolor 37.66 28.77
# virginica  61.04  4.11

cumsum(tabla03)
# Big Small 
# 77   150 

tabla
Sepal.Length
# 4.3 4.4 4.5 4.6 4.7 4.8 4.9   5 5.1 5.2 5.3 5.4 5.5 5.6 5.7 5.8 5.9   6 6.1 6.2 6.3 6.4 6.5 6.6 6.7 6.8 6.9   7 7.1 7.2 7.3 7.4 7.6 7.7 7.9 
# 1   3   1   4   2   5   6  10   9   4   1   6   7   6   8   7   3   6   6   4   9   7   5   2   8   3   4   1   1   3   1   1   1   4   1 

cumsum(tabla)
# 4.3 4.4 4.5 4.6 4.7 4.8 4.9   5 5.1 5.2 5.3 5.4 5.5 5.6 5.7 5.8 5.9   6 6.1 6.2 6.3 6.4 6.5 6.6 6.7 6.8 6.9   7 7.1 7.2 7.3 7.4 7.6 7.7 7.9 

quantile(Sepal.Length,prop=c(0.15,0.85,0.95), na.rm = T)
# 0%  25%  50%  75% 100% 
# 4.3  5.1  5.8  6.4  7.9 

# 3.4 Ajuste de distribuciones ####
## Simetria y curtosis ####
# install.packages("psych")

library(psych)
# ?psych

# Simetria
skew(Sepal.Length)
# [1] 0.3086407

# Curtosis
# Kustosi es positiva, es Leptocurtica, si es negativa es platicurtica,
# si es 0 es Mesocurtica
kurtosi(Sepal.Length)
# [1] -0.6058125

#Para enviar a una nueva vista
# X11()

# Generacion de un histograma
hist(Sepal.Length)

# Test para revisar la normalidad
shapiro.test(Sepal.Length)
# Shapiro-Wilk normality test
# 
# data:  Sepal.Length
# W = 0.97609, p-value = 0.01018



# 2.0 Ciclos en R ####
## Funciones ####
suma2num <-
  function(a, b) {
    a + b
  } # Definicion de una funcion simple

suma2num(2, 4) # Llamada a la funcion antes definida
# [1] 6
suma2num(123.456,-98.76)
# [1] 24.696


## 2.1 Condicion if ####
if (4 > 3) {
  "verdadero"
}
# [1] "verdadero"

## 2.1 Condicion if else ####
if (4 > 5) {
  "verdadero"
} else
{
  "falso"
}
# [1] "falso"

# if(condicion)
# {
#   operaciones_condicion_verdadera
# }
# else
# {
#   operaciones_condicion_falsa
# }

#Definicion de una funcion
promedio <- function(calificaciones) {
  mean(calificaciones)
  
}

# Llamando a la funcion previamente definida
promedio(c(5, 8, 5.5, 7, 10))
# [1] 7.1

# Definicion de una funcion con varias operaciones
validar_promedio <- function(calificaciones) {
  media <- mean(calificaciones)
  
  if (media >= 7) {
    print(paste0("Promedio:", media , " - Aprobado"))
  }
  else{
    print(paste0("Promedio:", media , " - Reprobado"))
  }
}

# Llamada a la funcion previa
calificaciones1 <- c(5, 8, 5.5, 7, 10)

validar_promedio(calificaciones1)

# [1] "Aprobado"
calificaciones2 <- c(5, 8, 5.5, 7, 5)
validar_promedio(calificaciones2)

# [1] "Reprobado"

## 2.1 Condicion ifelse ####
num <- 1:8
num
ifelse(num %% 2 == 0, "Par", "Non") #Version corta de if / else

num1 <- 1:20
num1
# Para que se cumplan las dos condiciones "and"
ifelse(num1 %% 2 == 0 & num1 %% 3 == 0, "Divisible", "No divisible")
ifelse(num1 %% 2 == 0 &
         num1 %% 3 == 0,
       paste0(num1, " - Divisible"),
       paste0(num1, " - No divisible"))

# Que se cumpla al menos una condicion "or"
ifelse(num1 %% 2 == 0 | num1 %% 3 == 0, "Divisible", "No divisible")
ifelse(num1 %% 2 == 0 |
         num1 %% 3 == 0,
       paste0(num1, " - Divisible"),
       paste0(num1, " - No divisible"))

# https://es.wikipedia.org/wiki/Año_bisiesto
# Año bisiesto es el divisible entre 4, salvo que sea año secular -último de cada siglo, terminado en «00»-, en cuyo caso también ha de ser divisible entre 400.
esBisiesto <- function(aaaa) {
  (aaaa %% 4 == 0 & aaaa %% 100 != 0 | aaaa %% 400 == 0)
}

esBisiesto(1600)
esBisiesto(1992)
esBisiesto(2000)
esBisiesto(1900)
esBisiesto(2024)

## 2.2 Ciclo for ####
dado <- 1:6 # variable dado, con 6 valores (rango)
# Ciclo for, para imprimir cada uno de los valores del vector
for (cara in dado) {
  print(cara ^ 2)
}
# [1] 1
# [1] 4
# [1] 9
# [1] 16
# [1] 25
# [1] 36

# Ciclo for directamente con rango
for (numero in 1:10) {
  print(numero)
}
# [1] 1
# [1] 2
# [1] 3
# [1] 4
# [1] 5
# [1] 6
# [1] 7
# [1] 8
# [1] 9
# [1] 10

# Ciclo for con valores directo de una cadena
for (n in c(2, 5, 10, 20, 50)) {
  print(n)
}
# [1] 2
# [1] 5
# [1] 10
# [1] 20
# [1] 50

letras <- letters
letras
# [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"

for (l in letters) {
  print(l)
}
# [1] "a"
# [1] "b"
# [1] "c"
# ...
# [1] "x"
# [1] "y"
# [1] "z"


# Ejemplo de for, utilizando una distribucion uniforme "runif"
# These functions provide information about the uniform distribution on the
# interval from min to max. dunif gives the density, punif gives the distribution
# function qunif gives the quantile function and runif generates random deviates.
set.seed(1)
rep <- 5000
rep
n <- 2
media <- numeric(rep)
media
for (irep in 1:rep) {
  x <- runif(n)
  
  media[irep] <- mean(x)
  
}

# Para abrir el grafico en otra ventana
# X11()

# Generacion de histograma
hist(media, breaks = 40, main = paste("n = ", n))

## 2.3 Ciclo while ####
umbral <- 5
valor <- 0
print("Se inicia el ciclo")
while (valor < umbral) {
  print("Aun no")
  valor <- valor + 1
}
print("Ya termino el ciclo")

# [1] "Se inicia el ciclo"
# > while (valor < umbral) {
#   +   print("Aun no")
#   +   valor <- valor + 1
#   + }
# [1] "Aun no"
# [1] "Aun no"
# [1] "Aun no"
# [1] "Aun no"
# [1] "Aun no"
# > print("Ya termino el ciclo")
# [1] "Ya termino el ciclo"

factorial <- function(num) {
  if (num == 0) {
    resultado <- 1
  }
  else{
    resultado <- num
    while (num > 1) {
      resultado <- (num - 1) * resultado
      num <- num - 1
    }
  }
  return(resultado)
}

factorial(0)
# [1] 1
factorial(1)
# [1] 1
factorial(5)
# [1] 120

## 2.4 Instruccion switch ####

# Ejemplo utilizando if
y <- "aa"
if(y=="a"){
  r <- 1
}
if(y=="aa"){
  r <- 2
}
if(y=="aaa"){
  r <- 3
}
if(y=="aaaa"){
  r <- 4
}
print(r)

# cambiando el codigo por switch
switch(y,
       "a"=result<-1,
       "aa"=result<-2,
       "aaa"=result<-3,
       "aaaa"=result<-4)
print(result)
# [1] 2












# 2.0 Ciclos en R ####
## Funciones ####
suma2num <- function(a,b) { a +b } # Definicion de una funcion simple

suma2num(2,4) # Llamada a la funcion antes definida
# [1] 6
suma2num(123.456, -98.76)
# [1] 24.696


## Condicion if ####
if(4>3){
  "verdadero"
}
# [1] "verdadero"

## Condicion if else ####
if(4>5){
  "verdadero"
}else
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
promedio <- function(calificaciones){
  mean(calificaciones);
}

# Llamando a la funcion previamente definida
promedio(c(5,8,5.5,7,10))
# [1] 7.1

# Definicion de una funcion con varias operaciones
validar_promedio <- function(calificaciones){
  media <- mean(calificaciones);
  if(media >= 7) {
    print(paste0("Promedio:",media ," - Aprobado"))
  }
  else{
    print(paste0("Promedio:",media ," - Reprobado"))
  }
}

# Llamada a la funcion previa
calificaciones1 <- c(5,8,5.5,7,10);
validar_promedio(calificaciones1);
# [1] "Aprobado"
calificaciones2 <- c(5,8,5.5,7,5)
validar_promedio(calificaciones2);
# [1] "Reprobado"

## Condicion ifelse ####
num <-1:8;num
ifelse(num %% 2 == 0, "Par", "Non") #Version corta de if / else

num1 <- 1:20; num1
# Para que se cumplan las dos condiciones "and"
ifelse(num1 %% 2 == 0 & num1 %% 3 == 0, "Divisible", "No divisible")
 ifelse(num1 %% 2 == 0 & num1 %% 3 == 0, paste0(num1," - Divisible"), paste0(num1," - No divisible"))

# Que se cumpla al menos una condicion "or"
ifelse(num1 %% 2 == 0 | num1 %% 3 == 0, "Divisible", "No divisible")
ifelse(num1 %% 2 == 0 | num1 %% 3 == 0, paste0(num1," - Divisible"), paste0(num1," - No divisible"))

# https://es.wikipedia.org/wiki/Año_bisiesto
# Año bisiesto es el divisible entre 4, salvo que sea año secular -último de cada siglo, terminado en «00»-, en cuyo caso también ha de ser divisible entre 400.
esBisiesto <- function(aaaa){
  (aaaa %% 4 == 0 & aaaa %% 100 != 0 | aaaa %% 400 == 0)
}

esBisiesto(1600)
esBisiesto(1992)
esBisiesto(2000)
esBisiesto(1900)
esBisiesto(2024)

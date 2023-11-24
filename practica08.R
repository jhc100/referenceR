# Repaso de algunos conceptos ####
cat("\014")
# dev.off()
# install.packages("dplyr")
# install.packages("repmis")

library(dplyr)
library(repmis)

source_data(
  "https://github.com/hllinas/DatosPublicos/blob/main/Estudiantes.Rdata?raw=false"
)
datosCompleto <- Estudiantes

## Seleccion por columnas ####
filtro01 <- datosCompleto[1:10, 2:7]
View(filtro01)

filtro01[3, 2]           # A) Solo la fila 3 y la columna 2
filtro01[, 2]            # B) Todas las filas (por el espacio en blanco) y solo la columna 2
filtro01[3,]            # C) Solo la fila 3 y todas las columnas (por el espacio en blanco)
filtro01[-5, ]          # D) Quitar la fila 5 (por eso el signo menos) y dejar todas las columnas
filtro01[,-2]           # E) Todas las filas, pero sin la columna 2 (por eso, el signo menos)
filtro01[, 2:5]          # F) Todas las filas, pero solo columnas de 2 a 5 (por eso, dos puntos)
filtro01[, c(2, 5)]       # G) Todas las filas, pero solo columnas 2 y 5 (c representa un vector)
filtro01[1:4, 2:5]       # H) Solo las filas de 1 a 4, con las columnas 2 a 5
filtro01[1:4, c(2, 5)]    # I) Solo las filas de 1 a 4, con las columnas 2 y 5
filtro01[c(1, 5), c(2, 4)] # J) Solo las filas 1 y 5, con las columnas 2 y 4
filtro01[1:5,-c(2, 5)]   # K) Solo las filas de 1 a 5, quitando las columnas 2 y 5
filtro01[-3,-c(2, 5)]    # L) Quitar la filas 3, y las columnas 2 y 5

## Seleccion por subset ####
filtro02 <- subset(filtro01, select = c(ID, Edad, Fuma))
filtro03 <- subset(filtro01, Edad >= 20, select = -c(ID, Fuma))
filtro04 <-
  subset(filtro01, Edad <= 18 | Edad > 21, select = -c(ID, Fuma))
filtro05 <- subset(filtro01, filtro01$Fuma == "Si")
filtro06 <- subset(filtro01, filtro01$Fuma != "No")
filtro07 <- subset(filtro01, filtro01$SexoNum == 0 & filtro01$Edad < 18)

## Seleccion aletoria ####
set.seed(1011)
N <- nrow(filtro01)
n <- 4
i <- sample(1:N, n, replace = F)
filtro08 <- filtro01[i, ]
filtro08b <- filtro01[i, 4:6]

## filter dplyr ####
filtro09 <- filter(filtro01, Edad >= 20)
filtro10 <- filter(filtro01, Edad>=20 & SexoNum <1)
filtro11 <- filter(filtro01[,2:4], Edad >= 20 & Sexo == "Femenino")
filtro12 <- filter(filtro01[,2:4], Edad >= 20 | Sexo == "Femenino")
filtro13 <- filter(filtro01, Edad >= 20 & Sexo != "Masculino") 
filtro14 <- filter(filtro01, Edad >= 20 | Sexo == "Femenino") 
filtro15 <- filter(filtro01, Edad <  20 | Estatura != "Alta") 
filtro16 <- filter(filtro01, Edad >= 18, Estatura %in% c("Baja", "Media", "Gigante"))
filtro17 <- filter(filtro01, SexoNum != 1, Fuma %in% c("Si", "Enfermo", "Delicado"))

## Pipe ####
mujeres <- filtro01 %>% filter(Sexo=="Femenino")
mujeres %>% names

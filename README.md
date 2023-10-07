# Practicas R

-   Practica01.R

    -   Instalacion de paquetes en R [install.packages("libreria")]

    -   Carga de una libreria [library(libreria)]

    -   Uso de funciones de librerias, sin cargar la libreria en su totalidad. [libreria::metodo]

    -   Mostrar ayuda de una liberia libreria [libreria??]

    -   Mostrar ayuda de un metodo metodo [metodo?]

    -   Listado de variables en "Global Environment" [ls]

    -   Borrado de variables [rm(variable)]

    -   Asignacion de valores a una variable [ \<- ]

    -   as.factor()

    -   Operaciones basicas

        -   Suma

        -   Resta

        -   Division

        -   Multiplicacion

        -   Potencia

        -   Modulo

    -   Operadores logicos [== , \>, \<, \>=, \<=, !=]

    -   Referencia a valores de un vector

        -   Por posicion

        -   Por condicion

    -   Variables

        -   Simples

        -   Vector

        -   DataFrame

    -   Carga de datos desde archivos

        -   Archivo xls, xlsx

        -   Archivo csv

        -   Archivo txt

        -   Archivo desde url

-   Practica02.R

    -   Numeros aletorios

    -   Semilla de numeros aleatorios

    -   Distribucion normal [ rnorm() ]

    -   Redondeo [ round(variable, num decimales) ]

    -   Tipos de objetos

        -   Factor

        -   Matriz

            -   Accesar a valores de una matriz

            -   Union de columnas [ cbind() ]

            -   Union de renglones [ rbind() ]

            -   Aplicacion de funciones a vectores o data frames [ apply() ]

            -   Obtencion de la diagonal de una matriz [ diag() ]

            -   Ordenamiento de elementos [ sort() ]

            -   Operaciones con matrices

                -   Suma

                -   Producto por un escalar

                -   Multiplicacion de matrices

    -   Carga datasets de ejemplo

    -   Resumen de datos [ summary() ]

    -   Visualizar estructura de objeto [ str() ]

    -   Nombre de variables que componen un dataset [ names() ]

    -   Nombre de columnas de un dataset [ colnames() ]

        -   Renombrar columnas

    -   Primeros renglones de un dataset [ head() ]

    -   Ultimos renglones de un dataset [ tail() ]

    -   Attach/Detach a una variable

    -   Aplicar una funcion a un dataset [ sapply() / tapply() ]

    -   Operaciones estadisticas

        -   Media [ mean() ]

        -   Desviacion estandar [ sd() ]

-   Practica03.R

    -   Generacion de datos

        -   Utilizando rangos

        -   Rangos customizados

        -   Generacion de una secuencia con un patron definido [ seq() ]

        -   Valores especificos

        -   Repeticiones [ rep() ]

        -   Generacion de n secuencias [ sequence() ]

        -   Generador de niveles [ gl() ]

        -   Data Frame

            -   Creacion de un dataframe a partir de combinaciones entre vectores [ expand.grid() ]

            -   Creacion de un dataframe a partir de variables tipo vector [ data.frame() ]

            -   Creacion de un dataframe a partir de union de columnas [ cbind() ]

            -   Agregar renglones nuevos a un dataframe [ rbind() ]

            -   Agregar una nueva columna a un dataframe [ dataframe\$nuevaColumna \<- valores ]

            -   Accesar a datos de un dataframe [ posicion, por columna, por renglon ]

        -   Lista

-   Practica04.R

    -   Funciones

    -   Sentencia de control if, if / else, ifelse

    -   Concatenar variables para mostrar resultados [ paste0() ]

    -   Ejemplo de funcion

    -   Ciclos for

        -   en un vector

        -   en un rango

        -   en una cadena de valores

    -   Ejemplo ciclo for con una distribucion uniforme, con su histograma

    -   Ciclo while

    -   Funcion factorial utilizando if else, con ciclo while

    -   Switch

-   Practica05.R

    -   Descripcion de una base de datos

        -   validacion de datos

    -   Carga de datos (datasets)

    -   Seleccion de datos en dataset mediante filtros directo en el dataset

    -   Seleccion de datos en dataset mediante instruccion subset

    -   Mezcla de datasets ( instruccion merge)

        -   Cuando existe correspondencia entre los valores de las columnas

        -   Cuando no existe correspondencia entre los valores de las columnas

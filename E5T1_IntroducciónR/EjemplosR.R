# Introduccion a R
# DataCLubUy
# 11/Set/2020

# Principio ---------------------------------------------------------------

# "#" indica el principio de un comentario (lineas que no se van a ejecutar)

# IMPORTANTE: setear directorio de trabajo ya que alli se van a buscar y a guardar los archivos por defecto
# puede ser a traves del menu Session > Set Working Directory
# o a traves del comando 
# setwd("escribaAquiElDirectorio")

getwd() #get working directory: dice en que directorio estamos trabajando
setwd("~/Dropbox/DataClubUy/R")

# R como calculadora ------------------------------------------------------

5 + 5 # Suma
5 - 5 # Resta
3 * 5 # Multiplicacion
5 / 2 # Division
2^3 # Potencia
2**3 # Potencia
4 %/% 2 # Cociente entero de una division
4 %% 2 # Resto (o modulo) de la division
(4^2) - (3*2) # Usar parentesis para agrupar
exp(1) # exponencial
sqrt(2) # raiz cuadrada
log(1) # logaritmo
sin(1); cos(1); tan(1) # trigonometricas
asin(1) #arco seno

# Redondeo de un numero
x <- pi
x # 3.141593
round(x, 3) # round(a, d) Redondea a con d decimales
ceiling(x) # ceiling(a) Menor entero mayor que a
floor(x) # floor(a) Mayor entero menor que a
trunc(x) # trunc(a) Elimina los decimales de (a) hacia 0

# Creacion de objetos -----------------------------------------------------

x <- 5
x
x + 10
class(x) # dice que tipo de objeto es x

y <- c(TRUE, FALSE)
y
class(y) 

z <- c("ID_1", "ID_2")
z
class(z)

matriz <- matrix(data = 1:100, nrow = 10, ncol = 10, byrow = TRUE)
matriz
head(matriz) # muestra las primeras 6 filas
View(matriz)
class(matriz)
dim(matriz) # devuelve cantidad de filas y columnas

#Data Frame: Puede contener diferentes tipos de variables, normalmente la mas utilizada.
df <- data.frame(ID = z, # columna con nombre ID y valores en z
                 esHembra = y,
                 edad = x, stringsAsFactors = FALSE)
df
View(df)

cbind(df,df)
rbind(df,df)

lista <- list(x, y, z)
lista

# Indexado ----------------------------------------------------------------

# Indexar vectores
vector <- c(1:20)
vector
vector[2]
vector[18:20]
vector[c(4,10)]
vector[-2]
# el indexado se puede usar para sustituir elementos
vector[2] <- 300
vector
vector[2]

# Indexar matrices
matriz[5,7]
matriz[9:10,]
matriz[1,c(2,4)]
matriz[,-c(1:8)]

# Indexar data frames
df$ # pararse despues del $ y apretar tabulador
df$ID
df[,"ID"]
df[,1]
df[,-1]
df[,2:3]
df[,c(2,3)]
df[,c("esHembra", "edad")]

# Indexar listas
lista[[2]] #devuelve elemento
lista[2] #devuelve lista con elemente

# Operadores logicos ------------------------------------------------------

3 > 2 # TRUE
3 < 2 # FALSE
3 == 2 # FALSE
5 == 5 # TRUE
5 != 5 # FALSE

# Cuando la operacion logica usa un vector, devuelve un valor por cada elemento
a <- 0:5
a
a < 2 # En este caso se compara cada elemento de 'a' con 2
a[a < 2]
a == 2
b <- 5:0
b
a == b  # Compara cada elemento del vector 'a' con el correspondiente de 'b'.
a >= b[1] # Compara cada elemento de 'a' con el primer elemento del vector 'b'.

a %in% c(1,2)
z %in% c("ID_1")
a < 2 | a > 4
a[a < 2 | a > 4]

#Casos particulares: NA, NULL y NaN
#NA : Not Available
#NULL : objeto vacio
#NaN : Not a Number, no es un numero (ej.sqrt(-1))
#Para identificarlos se usan las funciones is.XX. Por ejemplo:
is.na(NA)     # TRUE
is.na(6)      # FALSE
9 == NA       # NA
is.null(NULL) # TRUE
is.nan(NaN)   # TRUE

# Operaciones con vectores ------------------------------------------------

vector
vector*2 + 3
vector + vector

max(vector)
min(vector)
range(vector)
mean(vector)
sum(vector)
cumsum(vector)
sd(vector)
quantile(vector)

?mean
??mean

# Levantado de datos ------------------------------------------------------

read.table(file = "datos.txt", header = TRUE, sep = "\t", stringsAsFactors = FALSE)
read.csv()
read.csv2()

kin <- read.table(file = "datos.txt", header = TRUE)
head(kin)
str(kin)
kin$id <- as.character(kin$id)
kin$id2 <- as.character(kin$id2)

# Loops -------------------------------------------------------------------

nombres <- unique(kin$id)
nombres
length(nombres)
A <- matrix(NA, nrow = length(nombres), ncol = length(nombres))
A

for (i in 1:length(nombres)) {
  for (j in 1:length(nombres)) {
    A[i,j] <- kin[kin$id %in% nombres[i] & kin$id2 %in% nombres[j], "K"]
  }
}

#ejemplos de uso de next
for (i in 1:5) {
  if (i == 3) {
    next
  }
  print(i)
}

#ejemplo de uso de break 
for (i in 1:5) {
  if (i == 3) {
    break
  }
  print(i)
} 

#ifelse
kin$sonParientes <- ifelse(kin$K == 0, "No son parientes", "Son parientes")

kin$sonParientes <- ifelse(kin$K == 0, "No son parientes", 
                           ifelse(kin$id == kin$id2, "Es el mismo individuo", "Son parientes"))

table(kin$sonParientes) #comando util para tener conteo de datos que tienen cada valor

# Funciones apply ---------------------------------------------------------

m <- data.frame(matriz[1:3,1:3]); m #el ";" hace que se ejecuten los dos comandos
colnames(m) <- c("uno", "dos", "tres"); m
rownames(m) <- c("uno", "dos", "tres"); m
m$media <- apply(m, 1, mean); m
m[4,] <- apply(m, 2, mean); m

lapply(lista, length)

sapply(lista, length)

?tapply
n <- 17
fac <- factor(rep_len(1:3, n), levels = 1:5)
tapply(1:n, fac, sum)

?mapply
?vapply

# Funciones ---------------------------------------------------------------

#definir la funcion
cuales <- function(columna, valor) {
  cat("Los individuos que tienen en la columna", columna, "el valor", valor, "son:\n")
  cat(df[df[,columna] %in% valor, c("ID")])
}

#usarla
cuales("edad", 5)
cuales("esHembra", TRUE)

cuales2 <- function(columna = "edad", valor = 5) {
  cumplen <- df[df[,columna] %in% valor, c("ID")]
  if(length(cumplen) == 1) { 
    cat("El individuo que tiene en la columna", columna, "el valor", valor, "es:\n", cumplen)
  } else {
    cat("Los individuos que tienen en la columna", columna, "el valor", valor, "son:\n", cumplen)
  }
} 

cuales2() #usa todos los argumentos por defecto
cuales2("esHembra", TRUE)

# Instalar y cargar paquetes ----------------------------------------------

# Instalar paquetes
install.packages("tidyverse")

select()

# Cargar paquetes
library(tidyverse)
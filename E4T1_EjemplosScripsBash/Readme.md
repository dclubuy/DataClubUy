Abajo les dejo un script para repasar algunas de las cosas que vieron la presentación pasada y ver alguna cosa más. 

El mismo script lo tienen en los archivos junto a los datos que vamos a usar. Si quieren pueden correrlo e ir viendo que hace (si corre, jeje). 
No olviden que para para hacerlo ejecutable al script deben usar `chmod u+x ejemplo.sh`

---
```Bash

#!/bin/bash

rm log.log

# Lectura de argumentos 
datafile=$1

# Valores de variables en el output 
echo "Valores de los argumentos" 
echo "Data file = $datafile"

echo "########################################################"

# cantidad de individuos en los datos
ni=$(wc -l $datafile | awk '{print $1}') 

echo "Cantidad total de individuos en los datos es $ni"

echo "########################################################"

# Cantidad de machos y hembras columna nº 6 

echo "Total de machos (1) y hembras (2)"

awk '{print $6}' $datafile | sort | uniq -c 

echo "########################################################"


# saco el promedio de columnas de datos (columnas 2 3 4 y 5) 
echo "promedios de las columnas características" 

awk '{ for (i=2;i<=5;i++) sum[i]+=$i } END { for (i in sum) print i, sum[i]/NR }' $datafile | sort 

echo "########################################################"

# Saco el promedio de datos para machos

echo "Promedio de las 4 características según sexo"

for sex in 1 2 
do 
   
   if [ $sex -eq 1 ] 
      then
	 echo "Promedio para machos" 
      else 
	 echo "Promedio para hembras"
   fi 

   awk -v sex=$sex '$6==sex' $datafile | awk '{ for (i=2;i<=5;i++) sum[i]+=$i } END { for (i in sum) print i, sum[i]/NR }' | sort

done 
echo "########################################################"
echo "#########################"
echo "# Empiezo la validación #"
echo "#########################"

# Tenemos que hacer una validación cruzada Oo!!!! En bash!!!! Joder!!!!
# Atención esto es solo un simulacro...
# simularemos para la caracteristica de la columna 2 por lo que nos separamos solo lo que nos interesa 
awk '{print $1,$2}' $datafile > datana

# Se puede hacer usando un loop 

# nueva variable necesaria ya veremos por que
echo 0 > filtro

for runs in $(seq 1 4) 
do 
   echo "########################################################"
   echo Corrida numero $runs
   awk 'FNR==NR { a[$1]; next } !($1 in a)' filtro datana | shuf -n 2500 > tmpv
   awk 'FNR==NR { a[$1]; next } {if ($1 in a) print $1,$2=0; else print $1,$2}' tmpv datana > tmp
   echo "El encabezado del archivo que estamos usando" 
   head tmp
   
   echo Supongan que acá corrieramos el modelo con datos suprimidos. Pero solo vamos a sacar la cantidad de lineas 
   ceros=$(awk '$2==0' tmp | wc -l | awk '{print $1}') 
   noceros=$(awk '$2!=0' tmp | wc -l | awk '{print $1}')

   echo corrida numero $runs >> log.log
   echo ceros = $ceros | tee -a log.log
   echo noceros = $noceros | tee -a log.log 

   awk 'FNR==NR { a[$1]; next } ($1 in a)' tmpv datana > tmp1
   cat filtro tmp1 > tmp2
   mv tmp2 filtro
done

echo "########################################################"
echo Al final el archivo para filtar queda
wc -l filtro 
rm tmp* datana
```
---

Otra forma de hacer grupos de individuos: 

```bash
seq 1 1000 | awk -v seed=$RANDOM 'BEGIN{srand(seed);}{ print  $0, 1  + rand() }'
```

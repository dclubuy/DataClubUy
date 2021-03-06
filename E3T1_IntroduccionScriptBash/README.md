# Introducción al script en Bash

## ¿Qué es un script?
Un script es un archivo de texto plano con código y comentarios que tienen las instrucciones que quieres que la computadora realice. 
Cuando desarrollas un script en Bash es importante tener en cuenta una serie de buenas prácticas: 
- Escribe el código (comandos) lo más limpio y comprensible posible, organizado por bloques y con nombre descriptivo de las variables y funciones. 
- ¡Coméntalo! Los comentario son anotación legible para humanos (del presente y del futuro), donde describes paso a paso las operaciones a realizar por el script bash.

Un script luce algo así.
```

#Frutas test
#Brenda, Agosto 2020

#Le pido al usuario que tipee una fruta 
echo "Escribe una fruta"
read fruta

#Si la fruta es manzana imprimirá mensajes
if [ $fruta = manzana ]
        then echo "yummie, me gustan las manzanas"
        else echo "iuuugh, asco!"
fi
```

## ¿Cómo hago un script en Bash?
1. Entra a la terminal. 
2. Crea un archivo de texto en tu directorio de trabajo. Puedes usar el comando ``$ touch``. 
3. Para editar el archivo, puedes hacerlo usando los editores `vim` o `nano`. Aquí podrás encontrar los manuales de [vim](https://vimhelp.org/usr_toc.txt.html) y [nano](https://www.nano-editor.org/dist/v2.1/nano.html) para saber como usarlos.  
4. Indica al sistema operativo de tu computadora con que lenguaje quieres que se interpreten los comandos, puedes hacerlo llamando a bash antes del nombre del script ``$ bash miScript.sh`` o usando el [shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)) ``#!/bin/bash``en la primer linea del script. 

```

#!/bin/bash
echo "Escribe una fruta"
read fruta
if [ $fruta = manzana ]
        then echo "yummie, me gustan las manzanas"
        else echo "iuuugh, asco!"
fi
```
5. Haz ejecutable el archivo, esto consiste en darle los permisos, así ``$ chmod u+x miScript.sh`` al archivo que acabas de crear para que pueda ser ejecutado por Shell. 

## Controles de flujo en los scripts 
Existen diferentes controles de flujo que permiten que el programa responda de un modo u otro dependiendo de las cirscunstancias. 

![tipos](tipos.png)

## Ejecución linea a linea 

Ejemplo: 

```
#!/bin/bash
echo -n "Introduzca un número:"; read x
echo -n "Introduzca un segundo número:"; read y
suma=$(($x + $y))
resta=$(($x - $y))
mul=$(($x * $y))
# imprimimos las respuestas:
echo "La suma de los numeros es:" $suma
echo "La resta de los numeros es:" $resta
echo "La multiplicación de los numeros es:" $mul
sleep 5
echo "Gracias por usar este programa"

```

## Bucles (for) 

Ejemplo 1

```
for nombresPerros in Boby Firulais "El toby" Chipotle; do
echo Mi mejor amigo es $nombresPerros; done
```
Ejemplo 2

```
ladrido=guau
for i in perro perrito perrote perrototote ; do
echo El $i hace $ladrido
done
```
También se puede hacer con arreglos. 

```
p=(perro perrito perrote perrototote)
for i in ${p[@]}; do 
echo El $i hace guau; done
```
Ejemplo 3

```
#!/bin/bash
for (( c=1; c<=20; c++ ))
do  
  echo "animal $c"
done
```

## Condicionales (if) 

Ejemplo 1

```
#!/bin/bash

touch directorio_prueba # touch crea un fichero en blanco

if [ -f directorio_prueba ];
then
        echo "El fichero existe"
fi
```
Ejemplo 2
Condición binaria
```

#!/bin/bash
echo "Escribe una fruta"
read fruta
if [ $fruta = manzana ]
        then echo "yummie, me gustan las manzanas"
        else echo "iuuugh, asco!"
fi
```


Ejemplo 3 
Condición multiple 
```
#!/bin/bash
#TestIF_ELSE_pies

echo ' ¿Cuántos cm tien un pie?'
read P

if [ $P = 30.48 ];
then
echo 'Has acertado'
elif [ $P = 30.5 ];
then
echo 'Estuviste cerca'
else
echo 'Que burro, pónganle cero'
fi

```

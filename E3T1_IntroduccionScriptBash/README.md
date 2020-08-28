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
3. Para editar el archivo, puedes hacerlo usando los editores `vim` o `nano`. Aquí podrás encontrar los manuales de [vim]:(https://vimhelp.org/usr_toc.txt.html)
 y nano para que aprendas a usarlos.  
Escribir los comandos a un archivo de texto (escribir el script).
Indicarle al sistema operativo (computadora) que programa (lenguaje) debe utilizar para interpretar los comandos
Darle al archivo los permisos que necesita para poder ser ejecutado por Shell.
![tipos](tipos.png)

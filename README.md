# cuidAR kikat
Modificación del la app cuidAR (Covid19-AR) para dispositivos con android kitkat (v4.4.2)

![Screenshot_2020-12-18-00-37-47](https://user-images.githubusercontent.com/16857233/102573098-6b249e00-40cc-11eb-90cb-a8981d9a3367.png)

## Compilación de kitkat-wrapper
  1. tener instalado android studio + sdk + ndk
  2. decarga el repositorio
  3. haz una copia del archivo `dlfcn.h` dentro de la carpeta del ndk con el nombre `dlfcn-nodladdr.h`
  4. edita el archivo `dlfcn-nodladdr.h` y borra la funcion __dladdr__
  5. proceda a compilar
  
## Aplicando el kitkat-wrapper a la aplicación
  1. decompile la app cuidAR (use apk tool)
  2. abra el apk previamente compilado y copie la carpeta __lib__
  3. pegue la capeta adentro de los archivos de la app cuidAR
  4. abra la carpeta lib (de cuidAR) y con un editor hexadecimal cambie 2 cadenas de texto presente en todos los archivos __libnative-lib.so__
  5. reemplaze `LIBC` por `LIBK` (solo aparece una vez)
  6. reemplaze `libc.so` por `libk.so` (solo aparece una vez)
  7.Listo
  
## Tareas finales
  . editar los recursos (temas, layouts, drawables) imcompatibles
  . quitar apis imcopatibles con kikat editando los archivos __.smali__
  . es un quilombo, hasta alli nomas explico
  
  
## Descargas
desde la pestaña de releases. usenlo bajo su propio riesgo

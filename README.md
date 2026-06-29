# DisneyAppSwift
Aplicación swiftt acerca de personajes de disney

La aplicación consume la API pública de Disney para mostrar personajes lo que permite consultar su información, marcar favoritos y acceder a ellos incluso sin conexión debido a que el proyyecto cuenta con persistencia local.

# Características
Lista de personajes de disney, puedes consultar su información, agregar a favoritos para verlo en un apartado diferente 

# Arquitectura

El proyecto usa MVVM y clean architecture

# API

Se utiliza la API pública de Disney:

[https://api.disneyapi.dev/character
](https://api.disneyapi.dev/character)
---

# Guardado de información 

Los personajes se almacenan en Core Data
Primero se consultan los datos locales, luego se intenta obtener información desde la API
Si la consulta es exitosa se actualiza Core Data, si no se refresca la interfaz
Cuando no hay conexión se muestran los datos almacenados

# Lista de favoritos

Los favoritos se almacenan localmente mediante Core Data, permite conservar el estado incluso después de cerrar la aplicación (aunque falta un metodo de accion para realizar en caso de darle en el corazón, por el momento solo imprime un valor en consola)

# Mejoras

Existen varias mejoras a futuro, como usar skeleton View para previsualizar celdas que ayuden al usuario a esperar en lo que baja la información 

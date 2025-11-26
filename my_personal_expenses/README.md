# 📘 README — Control de Gastos (Flutter + Clean Architecture + go_router)

## 📌 Descripción del proyecto

Esta es una aplicación móvil básica desarrollada en Flutter, cuyo objetivo es practicar:

* Maquetación (UI)
* Manejo de rutas con go_router
* Formularios
* Clean Architecture
* Widgets básicos (ListView, DataTable, Drawer, Cards)
* Manejo de estado mínimo con Provider
* Uso de repositorios in-memory
* Navegación entre pantallas

La aplicación permite:

* Registrar gastos
* Listarlos
* Ver estadísticas básicas en forma de tabla
* Navegar mediante un menú lateral (Drawer)

**Nota:** No utiliza backend ni bases de datos, por lo que los datos se almacenan solo en memoria temporal.

.

 # 📱 Características principales

* Formulario para agregar gastos (descripción, monto, categoría, fecha)
* Listado de gastos con diseño limpio
* Navegación en toda la app con go_router
* Menú lateral (Drawer)
* Estadísticas en formato de tabla (DataTable)
* Arquitectura limpia separada en:
domain/, data/, features/, app/
* Repositorio en memoria para simular almacenamiento
* Código organizado y escalable

# 🧰 Tecnologías usadas

* Flutter 3.x
* Dart 3.x
* go_router
* provider
* uuid
* Clean Architecture
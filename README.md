# Administrador de roles

Implementación básica de struct para aplicación web para el control de roles de usuario

## Configuraciones y requisitos

* IDE NetBeans 8.1
* Instalación Plugin [Struts2 NeatBeans](http://plugins.netbeans.org/plugin/39218)
* Tomcat 8.x^
* Java SE
* mySQL
* Hibernate
* ANT 1.8 

## Modificaciones de build.xml
* Renombrar archivo ___build.xml por build.xml
* Realizar cambios en el PATH de catalina
```xml
    <property   name="catalina.home"    
                value="{ Tu\Directorio\bin }"/>
```
* Cambiar las credenciales del proyecto
```xml
    <property name="manager.username" value="{ Nombre de usuario }"/>
    <property name="manager.password" value="{ Contraseña de usuario }"/>
```

## Creación de base de datos por mySQL
Query de creación de tablas en archivo:
```
esquema.sql
```

## Creación de usuario para inicio de sesión
* Contar con la base de datos .
* Acceder a la tabla Usuarios para agregar nuevos datos de acceso.
* ! Importante : Los datos de usuario [contraseña y nombre de usuario] deben contar con 6 caracteres minimo.

## Instrucciones básicas <Last development>
* Instrucción maestra: Crear WAR y Montar aplicación en el servidor
```
ant start
```
* Limpiar proyecto
```
ant clean
```
* Crear el proyecto
```
ant build
```
* Crear war para instalación
```
ant dist
```
* Instalación del proyecto en Tomcat
```
ant install
```

* Remover la instalación
```
ant remove
```

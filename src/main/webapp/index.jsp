<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<br>
<a href="listadoSocios.jsp">Listado de Socios</a>
<br>
<a href="formularioSocio.jsp">Fomulario de Socio Nuevo</a>
<br>
<a href="pideNumeroSocio.jsp">Pide de Socios</a>
<br>
<a href="TablaEjercicios.jsp">Tabla de ejercicios</a>
<br>
<a href="mostrarEntrenamientos.jsp">Mostrar Todos los Entrenamientos</a>


<form action="buscarEntrenamientoUsuario.jsp">
    Mostrar la info del Usuario de su entrenamiento
    <input type="text" name="socioIDEntrenamiento">
    <input type="submit" value="Enviar">
</form>


<form action="detalleSocio.jsp">
    Cargar socio con ID:
    <input type="text" name="socioID">
    <input type="submit" value="Enviar">
</form>
</body>
</html>
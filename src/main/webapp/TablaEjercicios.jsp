<%--
  Created by IntelliJ IDEA.
  User: 34691
  Date: 09/12/2024
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ejercicios</title>
</head>
<body>
<div>
    <h2>Crear Un Entrenamiento</h2>
    <form action="crearTablaEjercicios.jsp" method="post">
        <label>Tipo de Entrenamiento</label>
        <select name="tipoEntrenamiento">
            <option>fisico</option>
            <option>tecnico</option>
        </select>
        <br>
        <label>Ubicacion</label>
        <input type="text" name="ubicacion" >
        <label>Fecha</label>
        <input type="date" name="fecha" >
        <br>
        <label>Id del socio</label>
        <input type="text" name="idSocio" >
        <br>
        <button type="submit" value="crear">Crear</button>
    </form>
</div>

</body>
</html>

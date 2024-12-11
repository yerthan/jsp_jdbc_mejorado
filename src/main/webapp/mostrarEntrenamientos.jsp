<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 34691
  Date: 09/12/2024
  Time: 20:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mostrar Entrenamientos</title>
</head>
<body>
<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3307/baloncesto","root", "secret");

    //UTILIZAR STATEMENT SÓLO EN QUERIES NO PARAMETRIZADAS.
    Statement s = conexion.createStatement();
    ResultSet listado = s.executeQuery ("SELECT * FROM entrenamiento");

    while (listado.next()) {
        out.println(listado.getString("socioID") + " " + listado.getString ("idEntrenamiento") + " " + listado.getString("tipoEntrenamiento")
                + " " + listado.getString("ubicacion") + " "+ listado.getString("fecha") + "<br>");
    }
    listado.close();
    s.close();
    conexion.close();
%>


</body>
</html>

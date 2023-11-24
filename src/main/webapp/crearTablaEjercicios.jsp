<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: 34691
  Date: 09/12/2024
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //VAriables
    String tipoEntrenamiento = null;
    String ubicacion = null;
    Date fecha = null;
    boolean valida = true;

    try{

    }

    //Conexion con la BBDD
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3307/baloncesto", "root", "secret");

    if(valida){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

       String sql = "INSERT INTO entrenamiento VALUES ( " +
                "?, " + //tipo entrenamiento
                "?, " + // ubicacion
                "?, " + //fecha
                "?)"; //socioID
        ;

        ps = conn.prepareStatement(sql);

        int idx = 1;
        ps.setInt(idx++, numero);
        ps.setString(idx++, nombre);
        ps.setInt(idx++, estatura);
        ps.setInt(idx++, edad);
        ps.setString(idx++, localidad);

        int filasAfectadas = ps.executeUpdate();
        System.out.println("SOCIOS GRABADOS:  " + filasAfectadas);
    }

%>
</body>
</html>

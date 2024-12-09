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
    int idSocio = -1;
    boolean valida = true;
    String mensajeError ="";

    try{
        tipoEntrenamiento = request.getParameter("tipoEntrenamiento");
        ubicacion = request.getParameter("ubicacion");
        fecha = Date.valueOf(request.getParameter("fecha"));
        idSocio = Integer.parseInt(request.getParameter("idSocio"));

        if (tipoEntrenamiento == null) {
            valida = false;
            mensajeError = "El tipo de entrenamiento es obligatorio.";
        }
        if (ubicacion == null || ubicacion.isEmpty()) {
            valida = false;
            mensajeError = "La ubicación es obligatoria.";
        }
        if (fecha == null) {
            valida = false;
            mensajeError = "La fecha es obligatoria.";
        }

    } catch (Exception ex) {
        valida = false;
        mensajeError = "Error en los datos ingresados. Verifica los valores.";
    }

    if (valida) {
        Connection conn = null;
        PreparedStatement ps = null;
        try{
            //Conexion con la BBDD
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/baloncesto", "root", "secret");

            String sql = "INSERT INTO entrenamiento (tipoEntrenamiento, ubicacion, fecha, socioID) VALUES (?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);

            // Configuramos los parámetros de la consulta
            ps.setString(1, tipoEntrenamiento);
            ps.setString(2, ubicacion);
            ps.setDate(3, fecha);
            ps.setInt(4, idSocio);

            int filasAfectadas = ps.executeUpdate();
            if (filasAfectadas > 0) {
                out.println("<p>Entrenamiento registrado con éxito.</p>");
            } else {
                out.println("<p>No se pudo registrar el entrenamiento.</p>");
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }finally{
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }
    }else{
        out.println("<p style='color:red;'>" + mensajeError + "</p>");
    };
%>
</body>
</html>

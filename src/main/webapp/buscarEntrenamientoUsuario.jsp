<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: 34691
  Date: 10/12/2024
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>BuscarEntrenamientoUsuario</title>
</head>
<body>
<div>
<%
    boolean valida = true;
    int socioID = -1;
    try {
        socioID = Integer.parseInt(request.getParameter("socioIDEntrenamiento"));
    } catch (Exception ex) {
        ex.printStackTrace();
        valida = false;
    }
    //FIN CÓDIGO DE VALIDACIÓN

    if (valida) {

        //CARGA DEL DRIVER Y PREPARACIÓN DE LA CONEXIÓN CON LA BBDD
        //						v---------UTILIZAMOS LA VERSIÓN MODERNA DE LLAMADA AL DRIVER, no deprecado
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            //CARGA DEL DRIVER Y PREPARACIÓN DE LA CONEXIÓN CON LA BBDD
            //						v---------UTILIZAMOS LA VERSIÓN MODERNA DE LLAMADA AL DRIVER, no deprecado
            Class.forName("com.mysql.cj.jdbc.Driver");
             conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/baloncesto","root", "secret");


//>>>>>>NO UTILIZAR STATEMENT EN QUERIES PARAMETRIZADAS
//       Statement s = conexion.createStatement();
//       String insercion = "INSERT INTO socio VALUES (" + Integer.valueOf(request.getParameter("numero"))
//                          + ", '" + request.getParameter("nombre")
//                          + "', " + Integer.valueOf(request.getParameter("estatura"))
//                          + ", " + Integer.valueOf(request.getParameter("edad"))
//                          + ", '" + request.getParameter("localidad") + "')";
//       s.execute(insercion);
//<<<<<<

            //
            String sql = "SELECT * FROM entrenamiento WHERE socioID = ?"; //socioID

            ps = conn.prepareStatement(sql);
            //int idx = 1;
            //ps.setInt(idx++, socioID);
            ps.setInt(1, socioID);
            System.out.println(sql);

            boolean hasResults= false;

            rs = ps.executeQuery();out.println("<table border='1'>");
            out.println("<tr>");
            out.println("<th>ID Entrenamiento</th>");
            out.println("<th>Tipo Entrenamiento</th>");
            out.println("<th>Ubicacion</th>");
            out.println("<th>Fecha</th>");
            out.println("<th>Socio ID</th>");
            out.println("</tr>");

            while (rs.next()) {
                hasResults = true;
                out.println("<tr>");
                out.println("<td>" + rs.getInt("idEntrenamiento") + "</td>");
                out.println("<td>" + rs.getString("tipoEntrenamiento") + "</td>");
                out.println("<td>" + rs.getString("ubicacion") + "</td>");
                out.println("<td>" + rs.getDate("fecha") + "</td>");
                out.println("<td>" + rs.getInt("socioID") + "</td>");
                out.println("<td><form method='post' action='eliminarEntrenamiento.jsp'>");
                out.println("<input type='hidden' name='idEntrenamiento' value='" + rs.getInt("idEntrenamiento") + "' />");
                out.println("<button type='submit'>Eliminar</button>");
                out.println("</form></td>");
                out.println("</tr>");
            }

            if (!hasResults) {
                out.println("<tr><td colspan='5'>No existen entrenamientos para el socio con ID " + socioID + "</td></tr>");
            }

            out.println("</table>");

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { /* Ignored */ }
            try { if (ps != null) ps.close(); } catch (Exception e) { /* Ignored */ }
            try { if (conn != null) conn.close(); } catch (Exception e) { /* Ignored */ }
        }

    } else {
        out.println("Error de validación!");
    }
%>
</div>
</body>
</html>

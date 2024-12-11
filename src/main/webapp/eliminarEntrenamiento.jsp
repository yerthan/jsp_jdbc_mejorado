<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: 34691
  Date: 11/12/2024
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EliminarEntrenamientoUsuario</title>
</head>
<body>
<h2>Eliminar Usuario</h2>
<%

  boolean valida = true;
  int idEntrenamiento = -1;

  try {
    idEntrenamiento = Integer.parseInt(request.getParameter("idEntrenamiento"));
  } catch (Exception ex) {
    ex.printStackTrace();
    valida = false;
  }

  if(valida){
    Class.forName("com.mysql.cj.jdbc.Driver");

      Connection con = null;
      PreparedStatement pst = null;

      try{
        con = DriverManager.getConnection("jdbc:mysql://localhost:3307/baloncesto", "root", "secret");
        String sql = "DELETE FROM entrenamiento WHERE idEntrenamiento = ?";
        pst = con.prepareStatement(sql);
        pst.setInt(1, idEntrenamiento);

        int rowsAffected = pst.executeUpdate();

        if (rowsAffected > 0) {
          out.println("<p>Entrenamiento con ID " + idEntrenamiento + " eliminado exitosamente.</p>");
        } else {
          out.println("<p>No se encontró ningún entrenamiento con ID " + idEntrenamiento + ".</p>");
        }
      }catch (Exception e){
        e.printStackTrace();
        out.println("<p>Ocurrió un error al intentar eliminar el entrenamiento.</p>");
      } finally {
        try { if (pst != null) pst.close(); } catch (Exception e) { /* Ignored */ }
        try { if (con != null) con.close(); } catch (Exception e) { /* Ignored */ }
      }

  } else {
    out.println("<p>Error de validación: ID de entrenamiento no válido.</p>");
  }
%>

<form action="index.jsp">
  <button>Volver al inicio</button>
</form>

</body>
</html>

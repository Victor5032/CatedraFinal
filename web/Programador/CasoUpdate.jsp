<%-- 
    Document   : CasoUpdate
    Created on : 05-13-2021, 06:44:35 PM
    Author     : Kevin Otero
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="sv.edu.udb.database.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            Conexion con1 =  new Conexion();
            String sql = "UPDATE caso SET estado = 2 WHERE caso_id = " + request.getParameter("id");
                        con1.setRs(sql);
                        ResultSet rs = con1.getRs();
        %>
        <form action="CasosAsignados.jsp" method="POST">
        <h1>Caso Enviado a revisión del área solicitante</h1>
        <input value="Regresar a Casos Asignados" size="45" type="submit">
        </form>
    </body>
</html>

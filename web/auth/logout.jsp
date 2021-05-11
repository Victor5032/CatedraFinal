<%-- 
    Document   : login.jsp
    Created on : 05-10-2021, 02:42:27 PM
    Author     : Victor López
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="sv.edu.udb.database.Conexion" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%           
            session.invalidate();
        %>
        <jsp:forward page="../index.jsp">
            <jsp:param name="mensaje" value="Cierre de sesión exitoso" />
        </jsp:forward> 
    </body>
</html>

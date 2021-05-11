<%-- 
    Document   : nueva_area
    Created on : 05-10-2021, 07:59:15 PM
    Author     : Victor López
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String usuario = request.getParameter("usuario");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String estado = request.getParameter("estado");

    String route = "", mensaje = "", tipo = "success";

    if (nombre.equals("") || apellido.equals("") || usuario.equals("") || email.equals("") || password.equals("") || estado.equals("")) {
        mensaje = "Complete los campos correctamente";
        route = "/admin/jefe_area/nuevo.jsp";
        tipo = "danger";
    } else {
        int status = Integer.parseInt(estado);
        
        if (password.length() < 8) {
            mensaje = "La contraseña debe poseer un minimo de 8 caracteres";
            route = "/admin/jefe_area/nuevo.jsp";
            tipo = "danger";
        } else {
            route = "/admin/jefes_areas.jsp";
%>

    <jsp:useBean id="usuarios" class="sv.edu.udb.beans.UsuarioBean"/>

    <jsp:setProperty name="usuarios" property="nombres" value="<%= nombre %>" />
    <jsp:setProperty name="usuarios" property="apellidos" value="<%= apellido %>" />
    <jsp:setProperty name="usuarios" property="usuario" value="<%= usuario %>" />
    <jsp:setProperty name="usuarios" property="email" value="<%= email %>" />
    <jsp:setProperty name="usuarios" property="password" value="<%= password %>" />
    <jsp:setProperty name="usuarios" property="tipo" value="2" />
    <jsp:setProperty name="usuarios" property="estado" value="<%= status %>" />

<%  
        }
    } 
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">        
        <title>Confirmacion de nuevo jefe ingresado</title>
    </head>
    <body>

        <jsp:include page="../../components/navbar_admin.jsp"></jsp:include>

        <section class="py-4">
            <div class="container">
                <div class="row">
                    <div class="jumbotron">
                        <h1 class="display-4 py-3">Nuevo jefe de área funcional ingresado.</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="alert alert-<%= tipo %>" role="alert">
                        <p><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                            <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                            </svg> 
                                <% if (mensaje.equals("")) { %>
                                    <jsp:getProperty name="usuarios" property="agregarUsuario" />
                                <% } else { 
                                    out.println(mensaje);
                                } %> 
                            </p>
                    </div>
                </div>
                <div class="d-grid gap-2">
                    <a href="${pageContext.request.contextPath}<%= route %>" class="btn btn-info">
                        <img src="${pageContext.request.contextPath}/img/return.svg" alt="">
                    </a>
                </div>
            </div>
        </section>
    </body>
</html>




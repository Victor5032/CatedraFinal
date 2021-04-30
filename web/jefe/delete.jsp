<%-- 
    Document   : delete
    Created on : 14/04/2021, 06:39:34 PM
    Author     : Edwin Orellana
--%>
<%@page  import="java.sql.*" %>
<%@page  import="sv.edu.udb.db.jefe.ConexionBase" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String tituloSolicitud = "";
    ConexionBase conexion = new ConexionBase();
    ResultSet rs = null;
    conexion.setRs("SELECT * FROM solicitud WHERE solicitud_id = " + id + "");
    rs = conexion.getRs();
    if (rs.next()) {
        tituloSolicitud = rs.getString(4);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">        
        <title>Eliminar solicitud</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark  bg-dark ">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Universidad Don Bosco</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-link active" aria-current="page" href="Index.jsp">Inicio</a>
                        <a class="nav-link" href="Ingresar_nueva_solicitud.jsp">Ingresar nueva solicitud</a>
                    </div>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="row">
                <div class="jumbotron">
                    <h1 class="display-4">Eliminar solicitud</h1>
                    <p class="lead">Proceda con precaucion, si elimina una solicitud esta no se podra recuperar!.</p>
                </div>
            </div>
            <div class="row">
                <form method="POST" action="delete_exitoso.jsp" >
                    <input hidden="" name="id_solicitud" value="<%= id %>">   
                <div class="alert alert-danger" role="alert">
                    <p class="fw-bolder"> <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="grey" class="bi bi-bookmark" viewBox="0 0 16 16">
                        <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
                        </svg> Su solicitud : </p>
                    <p><%= tituloSolicitud%></p>

                </div>
            </div>
            <div class="row">
                <button type="submit" class="btn btn-outline-danger"><svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                    <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                    </svg></button>
                </form>
            </div>
        </div>
    </body>
</html>

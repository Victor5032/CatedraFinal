<%-- 
    Document   : delete
    Created on : 14/04/2021, 06:39:34 PM
    Author     : Victor López
--%>

<%@ page  import="java.sql.*" %>
<%@ page  import="sv.edu.udb.database.Conexion" %>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%
    int id = Integer.parseInt(request.getParameter("user"));

    String usuario = "";

    Conexion conex = new Conexion();

    ResultSet rs = null;

    conex.setRs("SELECT * FROM usuarios WHERE usuario_id = " + id + "");

    rs = conex.getRs();

    if (rs.next()) {
        usuario = rs.getString(3);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">        
        <title>Eliminar Jefe de desarrollo</title>
    </head>
    <body>
        
        <jsp:include page="../../components/navbar_admin.jsp"></jsp:include>

        <section class="py-4">
            <div class="container">
                <div class="row">
                    <div class="jumbotron">
                        <h1 class="display-4">Eliminar jefe de desarrollo</h1>
                        <p class="lead">Proceda con precaución, si elimina este usuario esta no se podra recuperar!.</p>
                    </div>
                </div>
                <div class="row">
                    <form method="POST" action="eliminar_jefe.jsp" >
                        <input type="hidden" name="id_usuario" value="<%= id %>">   
                        <div class="alert alert-danger" role="alert">
                            <p class="fw-bolder">
                                <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="grey" class="bi bi-bookmark" viewBox="0 0 16 16">
                                    <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
                                </svg> 
                                Usuario : 
                            </p>
                            <p><%= usuario %></p>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="d-grid gap-2">
                                    <a href="../jefes_desarrollo.jsp" class="btn btn-info">
                                        <img src="${pageContext.request.contextPath}/img/return.svg" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="d-grid gap-2">
                                    <button type="submit" class="btn btn-outline-danger">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                            <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </body>
</html>

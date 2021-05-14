<%-- 
    Document   : index.jsp
    Created on : 05-12-2021, 11:36:31 PM
    Author     : emer2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="sv.edu.udb.db.jefe.ConexionBase" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <title>Inicio</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp">Proyectos</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="index.jsp">Inicio</a>
                        </li>
                    </ul>
                    <div class="d-flex">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <span class="nav-link active">${user}&nbsp;</span>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/auth/logout.jsp">Logout</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <section class="py-4">
            <div class="container">
                <% if (request.getParameter("mensaje") != null) { %>
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <strong>Bienvenido</strong> <%= request.getParameter("mensaje") %>!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <% } %>
                <% 
                    String estado = request.getParameter("estado");
                    if (request.getParameter("estado") != null) { 
                        if(estado.equals("Aprobado")){ %>
                            <div class="alert alert-success alert-dismissible fade show mt-3" role="alert">
                                <strong>Caso aprobado con exito</strong>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div><%
                        }else if(estado.equals("Rechazado")){ %>
                            <div class="alert alert-success alert-dismissible fade show mt-3" role="alert">
                                <strong>Caso rechazado con exito</strong>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div><%
                        }
                    } 
                %>
                <div class="row">
                    <div class="jumbotron">
                        <h3 class="text-center font-weight-bold">Casos</h3>
                        <div class="py-3 text-center">
                            <p class="lead">Presione el icono <i class="fas fa-info-circle"></i> para ver los detalles del caso</p> 
                        </div>
                    </div>
                </div>
                <div class="row">
                    <table class="table table-dark">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Caso</th>
                                <th scope="col">Descripcion</th>
                                <th scope="col">Fecha de entrega</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ConexionBase con1 = new ConexionBase();
                                ResultSet rs1 = null;
                                con1.setRs("SELECT caso.codigo, solicitud.caso, solicitud.descripcion, caso.fecha_limite, caso.caso_id, caso.solicitud_id FROM caso INNER JOIN solicitud ON caso.solicitud_id = solicitud.solicitud_id INNER JOIN usuarios ON caso.programador = usuarios.usuario_id WHERE caso.tester = " + session.getAttribute("id") + " AND caso.estado = 2");
                                rs1 = con1.getRs();
                                while (rs1.next()) {
                            %>
                            <tr>
                                <th><%= rs1.getString(1)%></th>
                                <th
                                    <%
                                        String caso = "";
                                        caso = rs1.getString(2);
                                    %> 
                                    ><%= caso%>
                                </th>
                                <th><%= rs1.getString(3)%></th>
                                <th><%= rs1.getString(4)%></th>
                                <th> <a href="${pageContext.request.contextPath}/empleado/detallesCaso.jsp?id=<%= rs1.getString(1)%>" class="btn btn-info"><i class="fas fa-info-circle"></i></a></th>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    </body>
</html>

<%-- 
    Document   : index
    Created on : 05-11-2021, 02:37:20 PM
    Author     : Kevin
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>
<%@ page import="sv.edu.udb.database.Conexion" %>

<% 
    int id = Integer.parseInt(request.getParameter("caso"));

    Conexion conex = new Conexion();

    String query = "SELECT usuarios.usuario_id, CONCAT(usuarios.nombres, ' ', usuarios.apellidos) AS programador FROM usuarios WHERE usuario_id = " + id;

    conex.setRs(query);

    ResultSet rs = conex.getRs();

    rs.last();

    String user = rs.getString(2);
%>

<!DOCTYPE html>
<html lang="es" dir="ltr">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Jefe de Desarrollo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    </head>
    <body>
        <jsp:include page="../../components/navbar_desarrollo.jsp"></jsp:include>
        <section class="py-4">
            <div class="container">
                <div class="container-fluid">
                    <div class="py-3">
                        <h3 class="text-center">Casos del Programador</h3>
                    </div>
                    <div class="mb-3">
                        <h5 class="text-center">Programador: <span class="text-primary"><%= user %></span></h5>
                    </div>
                    <div class="mb-3">
                        <a href="${pageContext.request.contextPath}/desarrollo/monitoreo.jsp" class="btn btn-info">Regresar&nbsp;<i class="zmdi zmdi-long-arrow-return"></i></a>
                    </div>
                    <div class="text-center">
                        <%
                            String sql = "SELECT caso.caso_id, caso.codigo, departamento.departamento, solicitud.caso, caso.fecha_limite, estado_caso.estado FROM caso INNER JOIN solicitud ON caso.solicitud_id = solicitud.solicitud_id INNER JOIN departamento ON solicitud.departamento_id = departamento.departamento_id INNER JOIN estado_caso ON caso.estado = estado_caso.estado_caso_id WHERE caso.programador = " + id;

                            conex.setRs(sql);

                            ResultSet resultado = conex.getRs();

                            resultado.last();
                        %>
                        <div class="table-responsive">
                            <table id="myTable" class="table table-bordered">
                                <thead class="table-dark">
                                    <tr>
                                        <th scope="col">Código</th>
                                        <th scope="col">Departamento</th>
                                        <th scope="col">Caso</th>
                                        <th scope="col">Entrega</th>
                                        <th scope="col">Estado</th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% if (resultado.getRow() < 1) { %>
                                        <tr>
                                            <th scope="row" colspan="8">Sin Casos</th>
                                        </tr>
                                    <% 
                                        } else {
                                            resultado.beforeFirst();

                                            while (resultado.next()) { 
                                    %>
                                        <tr>
                                            <th scope="row"><%= resultado.getString(2) %></th>
                                            <td><%= resultado.getString(3) %></td>
                                            <td><%= resultado.getString(4) %></td>
                                            <td><%= resultado.getString(5) %></td>
                                            <td><%= resultado.getString(6) %></td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/desarrollo/monitoreo/caso_bitacora.jsp?caso=<%= resultado.getInt(1) %>" class="btn btn-outline-success" data-bs-toggle="tooltip" data-bs-placement="right" title="Ver bitacora">
                                                    <i class="zmdi zmdi-format-subject"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    <%
                                            } 
                                        } 
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/table.js"></script>
    </body>
</html>


<%-- 
    Document   : index
    Created on : 05-11-2021, 02:37:20 PM
    Author     : Kevin
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>
<%@ page import="sv.edu.udb.database.Conexion" %>

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
        <jsp:include page="../components/navbar_desarrollo.jsp"></jsp:include>
        <section class="py-4">
            <div class="container">
                <% if (request.getParameter("mensaje") != null) { %>
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <strong>Bienvenido</strong> <%= request.getParameter("mensaje") %>!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <br>
                <% } %>
                <div class="container-fluid">
                    <div class="py-3">
                        <h3 class="text-center">Solicitudes</h3>
                    </div>
                    <div class="text-center">
                        <%
                            Conexion conex = new Conexion();

                            String sql = "SELECT solicitud.solicitud_id, tipo_solicitud.tipo, departamento.departamento, solicitud.caso, solicitud.descripcion, date(solicitud.fecha_registro), solicitud.departamento_id FROM solicitud INNER JOIN tipo_solicitud ON solicitud.tipo_solicitud = tipo_solicitud.tipo_solicitud_id INNER JOIN departamento ON solicitud.departamento_id = departamento.departamento_id WHERE solicitud.estado = 3 ORDER BY solicitud.fecha_registro DESC";

                            conex.setRs(sql);

                            ResultSet resultado = conex.getRs();

                            resultado.last();
                        %>
                        <div class="table-responsive">
                            <table id="myTable" class="table table-dark">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Tipo</th>
                                        <th scope="col">Departamento</th>
                                        <th scope="col">Caso</th>
                                        <th scope="col">Registro</th>
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
                                            <th scope="row"><%= resultado.getInt(1) %></th>
                                            <td><%= resultado.getString(2) %></td>
                                            <td><%= resultado.getString(3) %></td>
                                            <td><%= resultado.getString(4) %></td>
                                            <td><%= resultado.getString(6) %></td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/desarrollo/casos/ver.jsp?caso=<%= resultado.getInt(1) %>" class="btn btn-info" data-bs-toggle="tooltip" data-bs-placement="top" title="Ver">
                                                    <i class="zmdi zmdi-eye"></i>
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


<%-- 
    Document   : ver_caso
    Created on : 05-11-2021, 09:47:44 PM
    Author     : Victor López
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>
<%@ page import="sv.edu.udb.database.Conexion" %>

<%
    int id = Integer.parseInt(request.getParameter("caso"));

    Conexion conex = new Conexion();

    String sql = "SELECT caso.caso_id, caso.codigo, tipo_solicitud.tipo, departamento.departamento, solicitud.caso, solicitud.descripcion AS requerimientos, caso.caso_descripcion AS datos, CONCAT(usuarios.nombres, ' ', usuarios.apellidos) AS programador, CONCAT(user.nombres, ' ', user.apellidos) AS tester, caso.fecha_limite AS entrega, estado_caso.estado, DATE(caso.fecha_registro) AS fecha_registro FROM caso INNER JOIN solicitud ON solicitud.solicitud_id = caso.solicitud_id INNER JOIN usuarios ON usuarios.usuario_id = caso.programador INNER JOIN usuarios AS user ON user.usuario_id = caso.tester INNER JOIN estado_caso ON estado_caso.estado_caso_id = caso.estado INNER JOIN tipo_solicitud ON solicitud.tipo_solicitud = tipo_solicitud.tipo_solicitud_id INNER JOIN departamento ON solicitud.departamento_id = departamento.departamento_id WHERE caso.caso_id = " + id + " ORDER BY caso.caso_id DESC";

    conex.setRs(sql);

    ResultSet rs = conex.getRs();

    rs.last();
%>

<!DOCTYPE html>
<html lang="es" dir="ltr">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ver Caso</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    </head>
    <body>
        <jsp:include page="../../components/navbar_desarrollo.jsp"></jsp:include>
        <section class="py-4">
            <div class="container">
                <div class="pb-3">
                    <h3 class="text-center">Detalles del caso</h3>
                </div>
                <div class="pb-3">
                    <a href="${pageContext.request.contextPath}/desarrollo/informe.jsp" class="btn btn-info"><i class="zmdi zmdi-long-arrow-return"></i>&nbsp;Regresar</a>
                </div>
                <div class="container-fluid">
                    <div class="card">
                        <div class="card-header"><%= rs.getString(2) %></div>
                        <div class="card-body">
                            <h5 class="card-title text-center mb-5"><%= rs.getString(5) %></h5>
                            <div class="text-left">
                                <div class="mb-3">
                                    <div class="row">
                                        <div class="col-4">
                                            <p class="card-text">
                                                <strong>Departamento:</strong>&nbsp;<%= rs.getString(4) %>
                                            </p>
                                        </div>
                                        <div class="col-4">
                                            <p class="card-text">
                                                <strong>Tipo:</strong>&nbsp;<%= rs.getString(3) %>
                                            </p>
                                        </div>
                                        <div class="col-4">
                                            <p class="card-text">
                                                <strong>Estado:</strong>&nbsp;<span class="text-primary"><%= rs.getString(11) %></span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <div class="row">
                                        <div class="col-6">
                                            <p class="card-text">
                                                <strong>Programador:</strong>&nbsp;<span><%= rs.getString(8) %></span>
                                            </p>
                                        </div>
                                        <div class="col-6">
                                            <p class="card-text">
                                                <strong>Tester:</strong>&nbsp;<span><%= rs.getString(9) %></span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <div class="row">
                                        <div class="col-6">
                                            <p class="card-text">
                                                <strong>Requerimientos:</strong>&nbsp;<span><%= rs.getString(6) %></span>
                                            </p>
                                        </div>
                                        <div class="col-6">
                                            <p class="card-text">
                                                <strong>Datos adicionales:</strong>&nbsp;<span><%= rs.getString(7) %></span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer text-muted">
                            <center>Registrada: <%= rs.getString(12) %></center>
                        </div>
                      </div>
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    </body>
</html>

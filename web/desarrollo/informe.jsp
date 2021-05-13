<%-- 
    Document   : index
    Created on : 05-11-2021, 02:37:20 PM
    Author     : Kevin
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="sv.edu.udb.database.Conexion" %>

<%
    Conexion conex = new Conexion();

    String sql = "", query = "";

    String desde = request.getParameter("desde");
    String hasta = request.getParameter("hasta");

    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

    Date fechaActual = new Date();
    String actual = format.format(fechaActual);
    
    if (desde != null && hasta != null) {
        sql = "SELECT estado_caso.estado, COUNT(caso.estado) AS Total FROM estado_caso LEFT JOIN caso ON caso.estado = estado_caso.estado_caso_id WHERE DATE(caso.fecha_registro) BETWEEN '" + desde + "' AND '" + hasta + "' GROUP BY estado_caso.estado";

        query = "SELECT caso.caso_id, caso.codigo, tipo_solicitud.tipo, departamento.departamento, solicitud.caso, solicitud.descripcion AS requerimientos, caso.caso_descripcion AS datos, CONCAT(usuarios.nombres, ' ', usuarios.apellidos) AS programador, caso.fecha_limite AS entrega, estado_caso.estado FROM caso INNER JOIN solicitud ON solicitud.solicitud_id = caso.solicitud_id INNER JOIN usuarios ON usuarios.usuario_id = caso.programador INNER JOIN estado_caso ON estado_caso.estado_caso_id = caso.estado INNER JOIN tipo_solicitud ON solicitud.tipo_solicitud = tipo_solicitud.tipo_solicitud_id INNER JOIN departamento ON solicitud.departamento_id = departamento.departamento_id WHERE DATE(caso.fecha_registro) BETWEEN '" + desde + "' AND '" + hasta + "' ORDER BY caso.caso_id DESC";
    } else {
        sql = "SELECT estado_caso.estado, COUNT(caso.estado) AS Total FROM estado_caso LEFT JOIN caso ON caso.estado = estado_caso.estado_caso_id GROUP BY estado_caso.estado"; 

        query = "SELECT caso.caso_id, caso.codigo, tipo_solicitud.tipo, departamento.departamento, solicitud.caso, solicitud.descripcion AS requerimientos, caso.caso_descripcion AS datos, CONCAT(usuarios.nombres, ' ', usuarios.apellidos) AS programador, caso.fecha_limite AS entrega, estado_caso.estado FROM caso INNER JOIN solicitud ON solicitud.solicitud_id = caso.solicitud_id INNER JOIN usuarios ON usuarios.usuario_id = caso.programador INNER JOIN estado_caso ON estado_caso.estado_caso_id = caso.estado INNER JOIN tipo_solicitud ON solicitud.tipo_solicitud = tipo_solicitud.tipo_solicitud_id INNER JOIN departamento ON solicitud.departamento_id = departamento.departamento_id ORDER BY caso.caso_id DESC";
    }
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
        <jsp:include page="../components/navbar_desarrollo.jsp"></jsp:include>
        <section class="py-4">
            <div class="container">
                <div class="container-fluid">
                    <div class="py-3">
                        <h3 class="text-center">Informe de Casos</h3>
                    </div>
                    <%
                        int aprobados = 0, rechazados = 0, espera = 0, asignados = 0;                      

                        conex.setRs(sql);

                        ResultSet rs = conex.getRs();

                        while (rs.next()) {
                            switch (rs.getString(1)) {
                                case "Aprobado":
                                    aprobados = rs.getInt(2);
                                    break;

                                case "Asignado":
                                    asignados = rs.getInt(2);
                                    break;

                                case "Devuelto con observaciones":
                                    rechazados = rs.getInt(2);
                                    break;

                                case "Esperando aprobación del área solicitante":
                                    espera = rs.getInt(2);
                                    break;
                            }
                        }
                    %>
                    <div class="pb-3">
                        <div class="mb-3">
                            <form method="POST">
                                <div class="row">
                                    <div class="col-4">
                                        <label for="desde_label" class="form-label">Desde:</label>
                                        <input type="date" name="desde" id="desde" class="form-control" max="<%= actual %>" required>
                                    </div>
                                    <div class="col-4">
                                        <label for="desde_label" class="form-label">Hasta:</label>
                                        <input type="date" name="hasta" id="hasta" class="form-control" max="<%= actual %>" required>
                                    </div>
                                    <div class="col-2 align-items-center">
                                        <div class="d-block">
                                            <div class="d-grid gap-2">
                                                <button type="submit" class="btn btn-primary btn-lg mt-4">Buscar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">Conteo general</h5>
                                        <br>
                                        <div class="row">
                                            <div class="col-6">
                                                <p class="card-text">Asignados: <strong class="text-primary"><%= asignados %></strong></p>
                                            </div>
                                            <div class="col-6">
                                                <p class="card-text">Rechazados: <strong class="text-danger"><%= rechazados %></strong></p>
                                            </div>
                                            <div class="col-6">
                                                <p class="card-text">Aprobados: <strong class="text-success"><%= aprobados %></strong></p>
                                            </div>
                                            <div class="col-6">
                                                <p class="card-text">En espera: <strong class="text-warning"><%= espera %></strong></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-center">
                        <div class="table-responsive">
                            <%
                                conex.setRs(query);
        
                                ResultSet resultado = conex.getRs();
                            %>
                            <table id="myTable" class="table table-bordered">
                                <thead class="table-dark">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Tipo</th>
                                        <th scope="col">Departamento</th>
                                        <th scope="col">Caso</th>
                                        <th scope="col">Entrega</th>
                                        <th scope="col">Estado</th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% while (resultado.next()) { %>
                                        <tr>
                                            <th scope="row"><%= resultado.getInt(1) %></th>
                                            <td><%= resultado.getString(3) %></td>
                                            <td><%= resultado.getString(4) %></td>
                                            <td><%= resultado.getString(5) %></td>
                                            <td><%= resultado.getString(9) %></td>
                                            <td><%= resultado.getString(10) %></td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/desarrollo/casos/ver_caso.jsp?caso=<%= resultado.getInt(1) %>" class="btn btn-info" data-bs-toggle="tooltip" data-bs-placement="top" title="Ver">
                                                    <i class="zmdi zmdi-eye"></i>
                                                </a>
                                            </td>
                                        </tr>
                                   <% } %>
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



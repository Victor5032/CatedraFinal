<%-- 
    Document   : ver
    Created on : 05-11-2021, 03:15:39 PM
    Author     : Kevin
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="sv.edu.udb.database.Conexion" %>

<jsp:useBean id="solicitudes" class="sv.edu.udb.beans.SolicitudBean" />

<%
    Conexion conex = new Conexion();

    int id = Integer.parseInt(request.getParameter("caso"));

    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

    Date fechaActual = new Date();
    Date tomorrow = new Date(fechaActual.getTime() + (1000 * 60 * 60 * 24));

    String actual = format.format(fechaActual);
    String minima = format.format(tomorrow);

    String consulta = "SELECT departamento_id FROM solicitud WHERE solicitud_id = " + id;
    
    conex.setRs(consulta);

    ResultSet res = conex.getRs();

    res.last();

    int departamento = res.getInt(1);
%>

<jsp:setProperty name="solicitudes" property="solicitud_id" value="<%= id %>" />

<jsp:getProperty name="solicitudes" property="infoSolicitud" /> 

<!DOCTYPE html>
<html lang="es" dir="ltr">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Aprobar solicitud</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    </head>
    <body>
        <jsp:include page="../../components/navbar_desarrollo.jsp"></jsp:include>
        <section class="py-4">
            <div class="container">
                <h3>Aprobar</h3>
                <div class="py-3">
                    <a href="${pageContext.request.contextPath}/desarrollo/casos/ver.jsp?caso=<%= id %>" class="btn btn-info">
                        <i class="zmdi zmdi-long-arrow-return"></i>&nbsp;Regresar
                    </a>
                </div>
                <div class="container-fluid">
                    <form action="${pageContext.request.contextPath}/desarrollo/casos/completar.jsp" method="post">
                        <input type="hidden" name="solicitud_id" id="solicitud_id" value="<%= id %>">
                        <input type="hidden" name="action" id="action" value="aprobar">
                        <div class="card">
                            <h5 class="card-header">Caso:&nbsp;<jsp:getProperty name="solicitudes" property="caso" /></h5>
                            <div class="card-body">
                                <div class="mb-3">
                                    <div class="row">
                                        <div class="col-6">
                                            <label for="label_programador" class="form-label">Programador</label>
                                            <%
                                                String sql = "SELECT * FROM usuarios WHERE tipo_usuario = 5 AND estado = 1";

                                                conex.setRs(sql);

                                                ResultSet resultado = conex.getRs();
                                            %>
                                            <select name="programador" id="programador" class="form-control">
                                                <% while (resultado.next()) { %>
                                                    <option value="<%= resultado.getInt(1) %>"><%= resultado.getString(4) %>&nbsp;<%= resultado.getString(5) %></option>
                                                <% } %>
                                            </select>
                                        </div>
                                        <div class="col-6">
                                            <label for="label_tester" class="form-label">Tester</label>
                                            <%
                                                String query = "SELECT usuarios.usuario_id, usuarios.nombres, usuarios.apellidos FROM departamento_empleados INNER JOIN usuarios ON usuarios.usuario_id = departamento_empleados.empleado WHERE departamento_empleados.departamento = " + departamento + " AND usuarios.estado = 1";
                                                
                                                conex.setRs(query);

                                                ResultSet rs = conex.getRs();
                                            %>
                                            <select name="tester" id="tester" class="form-control">
                                                <% while (rs.next()) { %>
                                                    <option value="<%= rs.getInt(1) %>"><%= rs.getString(2) %>&nbsp;<%= rs.getString(3) %></option>
                                                <% } %>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <div class="row">
                                        <div class="col-6">
                                            <label for="label_inicio" class="form-label">Fecha de inicio</label>
                                            <input type="date" name="inicio" id="inicio" class="form-control" min="<%= actual %>">
                                        </div>
                                        <div class="col-6">
                                            <label for="label_fin" class="form-label">Fecha limite</label>
                                            <input type="date" name="fin" id="fin" class="form-control" min="<%= minima %>">
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="label_notas" class="form-label">Notas adicionales para el desarrollador</label>
                                    <textarea name="notas" id="notas" cols="30" rows="10" class="form-control" required></textarea>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12">
                                    <div class="d-grid gap-2">
                                        <button type="submit" class="btn btn-success" id="enviar">Aprobar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    </body>
</html>

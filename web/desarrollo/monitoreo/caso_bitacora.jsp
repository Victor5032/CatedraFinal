<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>
<%@ page import="sv.edu.udb.database.Conexion" %>

<%
    Conexion conex = new Conexion();

    int caso = Integer.parseInt(request.getParameter("caso"));
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
        <%
            String sql = "SELECT caso.caso_id, solicitud.caso, IF(SUM(bitacora.progreso) != 'null', SUM(bitacora.progreso), 0) AS progreso, usuarios.usuario_id FROM caso INNER JOIN bitacora ON bitacora.caso_id = caso.caso_id INNER JOIN solicitud ON solicitud.solicitud_id = caso.solicitud_id INNER JOIN usuarios ON usuarios.usuario_id = caso.programador WHERE caso.caso_id = " + caso;

            conex.setRs(sql);

            ResultSet rs = conex.getRs();

            rs.last();
        %>
        <jsp:include page="../../components/navbar_desarrollo.jsp"></jsp:include>
        <section class="py-4">
            <div class="container">
                <div class="mb-3">
                    <h3 class="text-center"><%= rs.getString(2) %></h3>
                </div>
                <div class="mb-3">
                    <a href="${pageContext.request.contextPath}/desarrollo/monitoreo/ver_casos.jsp?caso=<%= rs.getInt(4) %>" class="btn btn-info">Regresar&nbsp;<i class="zmdi zmdi-long-arrow-return"></i></a>
                </div>
                <div class="mb-5">
                    <label class="label-form mb-3">Porcentaje de progreso para este caso: <span class="text-primary"><strong><%= rs.getString(3) %>%</strong></span></label>
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped progress-bar-animated " role="progressbar" style="width: <%= rs.getString(3) %>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"><%= rs.getString(3) %>%</div>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="table-responsive text-center">
                        <%
                            String query = "SELECT descripcion, progreso, DATE(fecha_registro) AS registro FROM bitacora WHERE caso_id = " + caso;

                            conex.setRs(query);

                            ResultSet resultado = conex.getRs();

                            resultado.last();
                        %>
                        <table class="table table-bordered">
                            <thead class="table-dark">
                                <tr>
                                    <th scope="col">Bitacora</th>
                                    <th scope="col">Porcentaje de progreso</th>
                                    <th scope="col">Fecha de registro</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if (resultado.getRow() < 1) { %>
                                    <tr>
                                        <th scope="row" colspan="3">No se han adjuntado bitacoras</th>
                                    </tr>
                                <% 
                                    } else { 
                                        resultado.beforeFirst();

                                        while (resultado.next()) {
                                %>
                                            <tr>
                                                <th scope="row"><%= resultado.getString(1) %></th>
                                                <td><%= resultado.getString(2) %></td>
                                                <td><%= resultado.getString(3) %></td>
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
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/table.js"></script>
    </body>
</html>
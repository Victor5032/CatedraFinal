<%-- 
    Document   : nuevo
    Created on : 05-10-2021, 07:58:59 PM
    Author     : Victor López
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
        <title>Editar jefe área</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="../../components/navbar_admin.jsp"></jsp:include>
        <section class="py-4">
            <div class="container">
                <h3 class="text-center">Editar jefe área funcional</h3>
                <% if (request.getParameter("mensaje") != null) { %>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Error</strong> <%= request.getParameter("mensaje") %>!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <% } %>
                <div class="py-3">
                    <a href="${pageContext.request.contextPath}/admin/jefes_areas.jsp" class="btn btn-info">Regresar</a>
                </div>
                <%
                        int id = Integer.parseInt(request.getParameter("user"));

                        Conexion conex = new Conexion();

                        String query = "SELECT * FROM usuarios WHERE usuario_id = " + id;

                        conex.setRs(query);
            
                        ResultSet rs = conex.getRs();

                        rs.last();

                        int estado = rs.getInt(9);
                    %>
                <div class="container-fluid">
                    <form action="${pageContext.request.contextPath}/admin/jefe_area/editar_jefe.jsp" method="POST">
                        <input type="hidden" name="id" id="id" value="<%= rs.getInt(1) %>">
                        <div class="mb-3">
                            <div class="row">
                                <div class="col-4">
                                    <label for="label_nombre" class="form-label">Nombres:</label>
                                    <input type="text" class="form-control" id="nombre" name="nombre" value="<%= rs.getString(4) %>">
                                </div>
                                <div class="col-4">
                                    <label for="label_apellido" class="form-label">Apellidos:</label>
                                    <input type="text" class="form-control" id="apellido" name="apellido" value="<%= rs.getString(5) %>">
                                </div>
                                <div class="col-4">
                                    <label for="label_usuario" class="form-label">Usuario:</label>
                                    <input type="text" class="form-control" id="usuario" name="usuario" value="<%= rs.getString(3) %>">
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <div class="row">
                                <div class="col-12">
                                    <label for="label_email" class="form-label">Correo:</label>
                                    <input type="email" class="form-control" id="email" name="email" value="<%= rs.getString(6) %>">
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <div class="row">
                                <div class="col-12">
                                    <label for="label_password" class="form-label">Contraseña:</label>
                                    <input type="password" class="form-control" id="password" name="password" aria-describedby="passwordHelp">
                                    <div id="passwordHelp" class="form-text">Si desea cambiar la contraseña digitarla, de lo contrario dejar vacío.</div>
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <%
                                String sql = "SELECT * FROM `estado_usuario`";

                                conex.setRs(sql);

                                ResultSet resultado = conex.getRs();
                            %>
                            <div class="row">
                                <div class="col-12">
                                    <label for="estado_password" class="form-label">Estado:</label>
                                    <select class="form-control" name="estado" id="estado">
                                        <option value="">[Seleccion un estado]</option>
                                        <% 
                                            while (resultado.next()) {
                                                if (resultado.getInt(1) == estado) { 
                                        %>
                                            <option value="<%= resultado.getInt(1) %>" selected><%= resultado.getString(2) %></option>
                                        <% 
                                                } else {
                                        %>
                                            <option value="<%= resultado.getInt(1) %>"><%= resultado.getString(2) %></option>
                                        <%            
                                                }
                                            } 
                                        %>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-info" type="submit">Actualizar</button>
                    </form>
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    </body>
</html>



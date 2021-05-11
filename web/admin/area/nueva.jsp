<%-- 
    Document   : nueva
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
        <title>Nueva área</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="../../components/navbar_admin.jsp"></jsp:include>
        <section class="py-4">
            <div class="container">
                <h3 class="text-center">Nueva área funcional</h3>
                <% if (request.getParameter("mensaje") != null) { %>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Error</strong> <%= request.getParameter("mensaje") %>!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <% } %>
                <div class="py-3">
                    <a href="${pageContext.request.contextPath}/admin/index.jsp" class="btn btn-info">Regresar</a>
                </div>
                <div class="container-fluid">
                    <%
                        Conexion conex = new Conexion();

                        String sql = "SELECT DISTINCT usuarios.usuario_id, usuarios.nombres, usuarios.apellidos FROM departamento RIGHT JOIN usuarios ON usuarios.usuario_id = departamento.jefe WHERE usuarios.tipo_usuario = 2 AND usuarios.estado = 1";

                        conex.setRs(sql);

                        ResultSet resultado = conex.getRs();
                    %>
                    <form action="${pageContext.request.contextPath}/admin/area/nueva_area.jsp" method="POST">
                        <div class="mb-3">
                            <div class="row">
                                <div class="col-6">
                                    <label for="label_departamento" class="form-label">Departamento:</label>
                                    <input type="text" class="form-control" id="departamento" name="departamento">
                                </div>
                                <div class="col-6">
                                    <label for="label_codigo" class="form-label">Código:</label>
                                    <input type="text" class="form-control" id="codigo" name="codigo" maxlength="4">
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="label_encargado" class="form-label">Encargados disponibles:</label>
                            <select class="form-control" name="encargado" id="encargado">
                                <option value="">[Seleccione un encargado]</option>
                                <% while (resultado.next()) { %>
                                    <option value="<%= resultado.getInt(1) %>"><%= resultado.getString(2) %>&nbsp;<%= resultado.getString(3) %></option>
                                <% } %>
                            </select>
                        </div>
                        <button class="btn btn-info" type="submit">Ingresar</button>
                    </form>
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    </body>
</html>

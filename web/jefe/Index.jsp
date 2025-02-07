<%-- 
    Document   : Index
    Created on : 13/04/2021, 03:09:20 PM
    Author     : Edwin Orellana
--%>

<%@page import="java.sql.*"%>
<%@page import="sv.edu.udb.db.jefe.ConexionBase" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <title>Inicio</title>
    </head>
    <body>
        <jsp:include page="../components/navbar_funcional.jsp"></jsp:include>
        <section class="py-4">
            <div class="container">
                <% if (request.getParameter("mensaje") != null) { %>
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <strong>Bienvenido</strong> <%= request.getParameter("mensaje") %>!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <br>
                <% } %>
                <div class="row">
                    <div class="jumbotron">
                        <h3 class="text-center font-weight-bold">Registro actual de solicitudes</h3>
                        <div class="py-3">
                            <p class="lead">Aqui puede modificar <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                </svg> o eliminar <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="red" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                </svg> las solicitudes que vaya ingresando</p> 
                        </div>
                    </div>
                </div>
                <div class="row">
                    <table class="table table-dark">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">ID</th>
                                <th scope="col">Departamento</th>
                                <th scope="col">Tipo</th>
                                <th scope="col">Solicitud</th>
                                <th scope="col">Descripción</th>
                                <th scope="col">Observaciones</th>
                                <th scope="col">Fecha de registro</th>
                                <th scope="col">Estado</th>
                                <th scope="col"></th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int contador = 0;
                                ConexionBase con1 = new ConexionBase();
                                ResultSet rs1 = null;
                                con1.setRs("SELECT * FROM solicitud INNER JOIN departamento ON departamento.departamento_id = solicitud.departamento_id WHERE departamento.jefe = " + session.getAttribute("id"));
                                rs1 = con1.getRs();
                                while (rs1.next()) {
                                    contador++;
                            %>
                            <tr >
                                <th scope="row" ><%= contador%></th>
                                <th><%= rs1.getInt(1)%></th>
                                <th
                                    <%
                                        String departamento = "";
                                        ConexionBase con2 = new ConexionBase();
                                        ResultSet rs2 = null;
                                        con2.setRs("SELECT * FROM departamento WHERE departamento_id = " + rs1.getInt(2) + "");
                                        rs2 = con2.getRs();
                                        if (rs2.next()) {
                                            departamento = rs2.getString(3);
                                        }
                                    %> 
                                    ><%= departamento%></th>
                                <th
                                    <%
                                        String tipoSolicitud = "";
                                        int solicitudId = rs1.getInt(3);
                                        if (solicitudId == 1) {
                                            tipoSolicitud = "Sistema nuevo";
                                        } else {
                                            tipoSolicitud = "Cambio a sistema actual";
                                        }
                                    %>
    
                                    ><%= tipoSolicitud%></th>
                                <th><%= rs1.getString(4)%></th>
                                <th><%= rs1.getString(5)%></th>
                                <th
                                    <%
                                        String observaciones = rs1.getString(6);
                                        if (observaciones != null && !observaciones.equals("")) {
    
                                        } else {
                                            observaciones = "Pendiente de revision";
                                        }
    
                                    %>    
    
                                    ><%= observaciones %></th>
                                <th><%= rs1.getString(7)%></th>
                                <th
                                    <%
                                        String estado = "";
                                        switch (rs1.getInt(8)) {
                                            case 1:
                                                estado = "Aceptada";
                                                break;
                                            case 2:
                                                estado = "Rechazada";
                                                break;
                                            case 3:
                                                estado = "En espera";
                                                break;
                                            
                                            case 4:
                                                estado = "Completada";
                                                break;
                                        }
                                    %>
                                    ><%= estado%></th>
                                <th> <a  href="${pageContext.request.contextPath}/jefe/editar.jsp?id=<%= rs1.getInt(1)%>"  class="btn btn-info"> <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                        </svg></a></th>
                                <th> <a href="${pageContext.request.contextPath}/jefe/delete.jsp?id=<%= rs1.getInt(1)%>" type="submit" class="btn btn-danger"><svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="white" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                        <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                        </svg></a> </th>
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

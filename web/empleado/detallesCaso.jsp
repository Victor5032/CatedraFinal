<%-- 
    Document   : detallesCaso
    Created on : 05-13-2021, 12:48:32 AM
    Author     : emer2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="sv.edu.udb.db.jefe.ConexionBase" %>

<%
    ConexionBase con = new ConexionBase();
    ResultSet rs = null;
    con.setRs("SELECT caso_id, codigo, solicitud_id, caso_descripcion, fecha_limite FROM caso WHERE codigo = '" + request.getParameter("id") + "'");
    rs = con.getRs();
    while (rs.next()) {
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalles del caso</title>
    </head>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
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
        <div class="container">
            <div class="row align-items-center justify-content-center d-flex">
                <div class="col-12 w-50">
                    <form action="ingresaForm.jsp" method="POST" class="mt-5" id="form" name="form">
                        <div class="container">
                            <h3 class="text-center mt-5 mb-5">Informacion del caso</h3>
                            <div class="row">
                                <div class="col-4">
                                    <div class="mb-3">
                                        <label for="idcaso" class="form-label">ID:</label>
                                        <input type="text" class="form-control d-none" id="idcaso" name="idcaso" value="<%= rs.getInt(1)%>">
                                        <input type="text" class="form-control" value="<%= rs.getInt(1)%>" disabled>
                                    </div>
                                </div>
                                <div class="col-8">
                                    <div class="mb-3">
                                        <label for="codigo" class="form-label">Codigo:</label>
                                        <input type="text" class="form-control d-none" id="codigo" name="codigo" value="<%= rs.getString(2)%>">
                                        <input type="text" class="form-control" value="<%= rs.getString(2)%>" disabled>
                                    </div>
                                </div>
                                <%
                                    ConexionBase con1 = new ConexionBase();
                                    ResultSet rs1 = null;
                                    con1.setRs("SELECT caso FROM solicitud WHERE solicitud_id = '" + rs.getInt(3) + "'");
                                    rs1 = con1.getRs();
                                    while (rs1.next()) {
                                %>
                                <div class="col-12">
                                    <div class="mb-3">
                                        <label for="codigo" class="form-label">Caso:</label>
                                        <input type="text" class="form-control d-none" id="caso" name="caso" value="<%= rs1.getString(1)%>">
                                        <input type="text" class="form-control" value="<%= rs1.getString(1)%>" disabled>
                                    </div>
                                </div>
                                <%
                                    }
                                %>
                                <div class="col-12">
                                    <div class="mb-3">
                                        <label for="codigo" class="form-label">Descripcion:</label>
                                        <textarea type="text" class="form-control d-none" id="descripcion" name="descripcion" placeholder="<%= rs.getString(4)%>"></textarea>
                                        <textarea type="text" class="form-control" placeholder="<%= rs.getString(4)%>" rows="3" disabled></textarea>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="mb-3">
                                        <label for="codigo" class="form-label">Fecha de entrega:</label>
                                        <input type="text" class="form-control d-none" id="fechaEntrega" name="fechaEntrega" value="<%= rs.getString(5)%>">
                                        <input type="text" class="form-control" value="<%= rs.getString(5)%>" disabled>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="mb-3">
                                        <label for="codigo" class="form-label">Estado de solicitud:</label>
                                        <select class="form-control" id="estadoSolicitud" name="estadoSolicitud">
                                            <option selected>Aprobar</option>
                                            <option>Rechazar</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 d-none" id="bloqueObservacion">
                                    <div class="mb-3">
                                        <label for="codigo" class="form-label">Observacion:</label>
                                        <textarea type="text" class="form-control" id="observacion" name="observacion"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                      </form>
                </div>
                <div class="container">
                    <h3 class="text-center mt-5 mb-3">Bitacora</h3>
                    <div class="row">
                        <div class="col-12 align-items-center justify-content-center d-flex">
                            <table class="table w-50 table-bordered">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">Descripcion</th>
                                        <th scope="col">Progreso</th>
                                        <th scope="col">Fecha de registro</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        ConexionBase con2 = new ConexionBase();
                                        ResultSet rs2 = null;
                                        con2.setRs("SELECT bitacora.descripcion, bitacora.progreso, bitacora.fecha_registro FROM bitacora WHERE bitacora.caso_id = " + rs.getInt(1));
                                        rs2 = con2.getRs();
                                        while (rs2.next()) {
                                    %>
                                    <tr>
                                        <th><%= rs2.getString(1)%></th>
                                        <th><%= rs2.getString(2)%></th>
                                        <th><%= rs2.getString(3)%></th>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="container text-center mt-3 mb-5">
                        <button type="button" id="btnEnviar" class="btn btn-primary">Enviar</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        //Select
        var select = document.getElementById("estadoSolicitud");

        //Bloque Textarea observacion
        var observacion = document.getElementById("bloqueObservacion");
        var txtObservacion = document.getElementById("observacion");

        //Boton enviar
        var enviar = document.getElementById("btnEnviar");
        select.onchange = function(){
            if(select.value == "Aprobar"){
                observacion.classList.remove("d-block");
                observacion.classList.add("d-none");
            }else if(select.value == "Rechazar"){
                observacion.classList.add("d-block");
                observacion.classList.remove("d-none");
            }
        }

        enviar.onclick = function(){
            if(select.value == "Rechazar" && txtObservacion.value == ""){
                alert("El campo observacion no puede quedar vacio");
            }else{
                document.form.submit();
            }
        }
    </script>
</html>
<%
    }
%>

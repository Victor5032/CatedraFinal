<%-- 
    Document   : editar.jsp
    Created on : 14/04/2021, 04:15:02 PM
    Author     : Edwin Orellana
--%>

<%@page import="sv.edu.udb.db.jefe.ConexionBase"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String observacionesString = "";
    String tituString = "";
    String descrString = "";

    ConexionBase conexion = new ConexionBase();
    ResultSet rs3 = null;
    conexion.setRs("SELECT * FROM solicitud WHERE solicitud_id = " + id + "");
    rs3 = conexion.getRs();
    if (rs3.next()) {
        observacionesString = rs3.getString(6);
        tituString = rs3.getString(4);
        descrString = rs3.getString(5);
    }
    if (observacionesString != null && !observacionesString.equals("")) {
        
    } else {
        observacionesString = "Pendiente de revision";
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">        
        <title>Actualizar</title>
    </head>
    <body>
        <jsp:include page="../components/navbar_funcional.jsp"></jsp:include>
        <div class="container">
            <div class="row">
                <div class="jumbotron">
                    <h1 class="display-4">Puede editar su solicitud, asi como argumentar su estado</h1>
                </div>
            </div>
            <div class="row">
                <form role="form" action="editar_exitoso.jsp" method="POST">
                    <div class="row">
                        <div class="col-sm">
                            <div class="mb-3" >
                                <label class="form-label" >Titulo actual de su solicitud</label>
                                <input hidden="" name="id_solicitud" value="<%= id%>">
                                <input type="text" class="form-control" name="titulo_solicitud" placeholder="<%= tituString%>" required="" > 
                            </div>
                            <div class="mb-3">
                                <label class="form-label" > Descripcion de su solicitud (puede argumentar si su solicitud fue rechazada)</label>
                                <textarea class="form-control" placeholder="<%= descrString%>" name="descripcion_solicitud" style="height: 100px" required=""></textarea>
                            </div>
                            <div class="mb-3">
                                <label class="form-label"> Observaciones hacia su solicitud  :</label>

                                <textarea class="form-control" style="height:100px" readonly="" ><%= observacionesString%></textarea>
                            </div>
                        </div>                       
                        <div class="col-sm">
                            <div class="mb-3">
                                <label class="form-label">Seleccione un departamento</label>
                                <select class="form-select" name="departamento_id" >
                                    <%                                        ConexionBase con = new ConexionBase();
                                        ResultSet rs = null;

                                        con.setRs("SELECT * FROM departamento WHERE jefe = " + session.getAttribute("id"));
                                        rs = con.getRs();
                                        while (rs.next()) {
                                    %>
                                    <option value="<%= rs.getInt(1)%>"><%= rs.getString(3)%></option>
                                    <%
                                        }
                                    %>     

                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Seleccione un tipo de solicitud</label>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="tipo_solicitud" id="exampleRadios1" value="2" checked>
                                    <label class="form-check-label" for="exampleRadios1">
                                        Cambio a sistema actual
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="tipo_solicitud" id="exampleRadios2" value="1">
                                    <label class="form-check-label" for="exampleRadios2">
                                        Sistema nuevo 
                                    </label>
                                </div>
                            </div>
                            <div class="mb-3" >
                                <p class="fw-bolder">Estado de su solicitud: </p>
                                <%
                                    int Estado = 0;
                                    String estiloEstado = "";
                                    String estadoText = "";
                                    con.setRs("SELECT * FROM solicitud WHERE solicitud_id = " + id + "");
                                    rs = con.getRs();

                                    if (rs.next()) {
                                        Estado = rs.getInt(8);
                                    }
                                    if (Estado == 1) {
                                        estiloEstado = "alert alert-success";
                                        estadoText = "Aceptada !";
                                    } else if (Estado == 2) {
                                        estiloEstado = "alert alert-danger";
                                        estadoText = "Rechazada !";
                                    } else {
                                        estiloEstado = "alert alert-warning";
                                        estadoText = "En espera de revision";
                                    }

                                %>
                                <div class="<%= estiloEstado%>" role="alert">
                                    <p class="fw-bolder"><%= estadoText%></p> 
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <button class="btn btn-success" ><svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-arrow-right-square-fill" viewBox="0 0 16 16">
                            <path d="M0 14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v12zm4.5-6.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5a.5.5 0 0 1 0-1z"/>
                            </svg></button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>

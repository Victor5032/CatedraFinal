<%-- 
    Document   : Ingresar_nueva_solicitud
    Created on : 13/04/2021, 03:39:58 PM
    Author     : Edwin Orellana
--%>

<%@page import="java.sql.*"%>
<%@page import="sv.edu.udb.db.jefe.ConexionBase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
        <title>Nueva solicitud</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark  bg-dark ">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Universidad Don Bosco</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-link active" aria-current="page" href="Index.jsp">Inicio</a>
                        <a class="nav-link" href="#">Ingresar nueva solicitud</a>
                    </div>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="row">
                <div class="jumbotron">
                    <h1 class="display-4">Ingreso de solicitudes</h1>
                    <p class="lead">Aqui puede ingresar una nueva solicitud para aperturar casos</p> 
                </div>
            </div>
            <form role="form" action="ingreso_exitoso.jsp" method="POST">
                <div class="row">
                    <div class="col-sm">
                        <div class="mb-3" >
                            <label class="form-label" >Ingrese el titulo para su solicitud</label>
                            <input type="text" class="form-control" name="titulo_solicitud" placeholder="Ingrese el titulo" required="" > 
                        </div>
                        <div class="mb-3">
                            <label class="form-label" > Descripcion de su solicitud</label>
                            <textarea class="form-control" name="descripcion_solicitud" style="height: 100px" required=""></textarea>
                        </div>
                    </div>                       
                    <div class="col-sm">
                        <div class="mb-3">
                            <label class="form-label">Seleccione un departamento</label>
                            <select class="form-select" name="departamento_id" >
                                <% 
                                ConexionBase con = new ConexionBase();
                                ResultSet rs = null;
                                
                                con.setRs("SELECT * FROM departamento");
                                rs = con.getRs();
                                while(rs.next()){
                                    %>
                                    <option value="<%= rs.getInt(1)%>"><%= rs.getString(3) %></option>
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
                            <p>Estado de su solicitud: (Por defecto se mostrara como en espera)</p>
                            <p class="fw-bolder">Espere revision de su solicitud !</p>
                            <div class="alert alert-primary" role="alert">
                                En espera
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
    </body>
</html>

<%-- 
    Document   : ver
    Created on : 05-11-2021, 03:15:39 PM
    Author     : Kevin
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<jsp:useBean id="solicitudes" class="sv.edu.udb.beans.SolicitudBean" />

<%
    int id = Integer.parseInt(request.getParameter("caso"));
%>

<jsp:setProperty name="solicitudes" property="solicitud_id" value="<%= id %>" />

<jsp:getProperty name="solicitudes" property="infoSolicitud" /> 

<!DOCTYPE html>
<html lang="es" dir="ltr">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ver solicitud</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    </head>
    <body>
        <jsp:include page="../../components/navbar_desarrollo.jsp"></jsp:include>
        <section class="py-4">
            <div class="container">
                <h3>Detalles</h3>
                <div class="py-3">
                    <a href="${pageContext.request.contextPath}/desarrollo/index.jsp" class="btn btn-info">
                        <i class="zmdi zmdi-long-arrow-return"></i>&nbsp;Regresar
                    </a>
                </div>
                <div class="container-fluid">
                    <div class="card">
                        <h5 class="card-header"><jsp:getProperty name="solicitudes" property="caso" /></h5>
                        <div class="card-body">
                            <h5 class="card-title"><strong>Tipo:</strong>&nbsp;<jsp:getProperty name="solicitudes" property="tipo" /></h5>
                            <br>
                            <p class="card-text"><strong>Departamento:</strong>&nbsp;<jsp:getProperty name="solicitudes" property="departamento" /></p>
                            <p class="card-text"><strong>Descripción:</strong>&nbsp;<jsp:getProperty name="solicitudes" property="descripcion" /></p>
                            <p class="card-text"><strong>Registrada:</strong>&nbsp;<jsp:getProperty name="solicitudes" property="registro" /></p>
                        </div>
                    </div>
                    <br>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-6">
                                <div class="d-grid gap-2">
                                    <a href="${pageContext.request.contextPath}/desarrollo/casos/aprobar.jsp?caso=<%= id %>" class="btn btn-success"><i class="zmdi zmdi-check-circle"></i>&nbsp;Aprobar</a>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="d-grid gap-2">
                                    <a href="${pageContext.request.contextPath}/desarrollo/casos/rechazar.jsp?caso=<%= id %>" class="btn btn-outline-danger"><i class="zmdi zmdi-alert-circle-o"></i>&nbsp;Rechazar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    </body>
</html>

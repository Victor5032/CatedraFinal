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
        <title>Rechazar solicitud</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    </head>
    <body>
        <jsp:include page="../../components/navbar_desarrollo.jsp"></jsp:include>
        <section class="py-4">
            <div class="container">
                <h3>Rechazar</h3>
                <div class="py-3">
                    <a href="${pageContext.request.contextPath}/desarrollo/casos/ver.jsp?caso=<%= id %>" class="btn btn-info">
                        <i class="zmdi zmdi-long-arrow-return"></i>&nbsp;Regresar
                    </a>
                </div>
                <div class="container-fluid">
                    <form action="${pageContext.request.contextPath}/desarrollo/casos/completar.jsp" method="post">
                        <input type="hidden" name="solicitud_id" id="solicitud_id" value="<%= id %>">
                        <input type="hidden" name="action" id="action" value="rechazar">
                        <div class="card">
                            <h5 class="card-header"><jsp:getProperty name="solicitudes" property="caso" /></h5>
                            <div class="card-body">
                                <div class="mb-3">
                                    <label for="label_observaciones" class="form-label">Detalle las observaciones del porque rechazo esta solicitud.</label>
                                    <textarea name="observaciones" id="observaciones" cols="30" rows="10" class="form-control observaciones" required></textarea>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12">
                                    <div class="d-grid gap-2">
                                        <button type="submit" class="btn btn-warning" id="enviar">Rechazar</button>
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

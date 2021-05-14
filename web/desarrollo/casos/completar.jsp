<%-- 
    Document   : completar
    Created on : 05-10-2021, 07:59:15 PM
    Author     : Kevin
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%
    String action = request.getParameter("action");
    int solicitud_id = Integer.parseInt(request.getParameter("solicitud_id"));

    String title = "";

    if (action.equals("rechazar")) {
        String observaciones = request.getParameter("observaciones");

        title = "Solicitud rechazada";
%>
        <jsp:useBean id="solicitudes" class="sv.edu.udb.beans.SolicitudBean" />

        <jsp:setProperty name="solicitudes" property="solicitud_id" value="<%= solicitud_id %>" />
        <jsp:setProperty name="solicitudes" property="observaciones" value="<%= observaciones %>" />
<%
    }

    if (action.equals("aprobar")) {
        title = "Solicitud aprobada";

        int programador = Integer.parseInt(request.getParameter("programador"));
        int tester = Integer.parseInt(request.getParameter("tester"));
        String inicio = request.getParameter("inicio");
        String fin = request.getParameter("fin");
        String notas = request.getParameter("notas");
%>
        <jsp:useBean id="casos" class="sv.edu.udb.beans.CasoBean" />

        <jsp:setProperty name="casos" property="solicitudId" value="<%= solicitud_id %>" />       
        <jsp:setProperty name="casos" property="descripcion" value="<%= notas %>" />       
        <jsp:setProperty name="casos" property="programador" value="<%= programador %>" />       
        <jsp:setProperty name="casos" property="tester" value="<%= tester %>" />       
        <jsp:setProperty name="casos" property="fechaInicio" value="<%= inicio %>" />       
        <jsp:setProperty name="casos" property="fechaLimite" value="<%= fin %>" />       
<% } %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">        
        <title><%= title %></title>
    </head>
    <body>
        <jsp:include page="../../components/navbar_desarrollo.jsp"></jsp:include>
        <section class="py-4">
            <div class="container">
                <div class="row">
                    <div class="jumbotron py-3">
                        <h1 class="text-center"><%= title %>.</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="alert alert-warning" role="alert">
                        <p><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                            <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                            </svg> 
                                <% if (action.equals("rechazar")) { %>
                                    <jsp:getProperty name="solicitudes" property="rechazarSolicitud" />
                                <% 
                                    } 

                                    if (action.equals("aprobar")) {
                                %> 
                                    <jsp:getProperty name="casos" property="nuevoCaso" />
                                <% } %>
                            </p>
                    </div>
                </div>
                <div class="d-grid gap-2">
                    <a href="${pageContext.request.contextPath}/desarrollo/index.jsp" class="btn btn-info">
                        <i class="zmdi zmdi-long-arrow-return"></i>&nbsp;Volver al listado
                    </a>
                </div>
            </div>
        </section>
    </body>
</html>


<%-- 
    Document   : areas
    Created on : 05-10-2021, 04:43:32 PM
    Author     : Victor López
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<jsp:useBean id="departamento" class="sv.edu.udb.beans.DepartamentoBean"/>

<% 
    int id = Integer.parseInt(request.getParameter("id_departamento"));
%>

<jsp:setProperty name="departamento" property="departamento_id" value="<%= id %>" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">        
        <title>Confirmacion de departamento eliminada</title>
    </head>
    <body>

        <jsp:include page="../../components/navbar_admin.jsp"></jsp:include>

        <section class="py-4">
            <div class="container">
                <div class="row">
                    <div class="jumbotron">
                        <h1 class="display-4">Departamento eliminado.</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="alert alert-success" role="alert">
                        <p><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                            <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                            </svg> 
                            <jsp:getProperty name="departamento" property="borrarDepartamento" /> 
                            </p>
                    </div>
                </div>
                <div class="d-grid gap-2">
                    <a href="../index.jsp" class="btn btn-info">
                        <img src="${pageContext.request.contextPath}/img/return.svg" alt="">
                    </a>
                </div>
            </div>
        </section>
    </body>
</html>

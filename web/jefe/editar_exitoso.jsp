<%-- 
    Document   : editar_exitoso
    Created on : 14/04/2021, 05:01:14 PM
    Author     : Edwin Orellana
--%>
<jsp:useBean id="Ingresar" scope="page" class="sv.edu.udb.db.jefe.Ingresar"/>
<jsp:setProperty name="Ingresar" property="*"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">        
        <title>Actualziacion solicitud</title>
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
                    </div>
                </div>
            </div>
        </nav>
        <div class="container" >
            <div class="row">
                <div class="jumbotron">
                    <h1 class="display-4">Informacion actualizada correctamente!, espere revision</h1>
                    <p class="lead">Acontinuacion, se detalla su actualizacion de la solicitud: </p>
                </div>
            </div>
            <div class="row">
                <div class="alert alert-success" role="alert">
                    <p><jsp:getProperty name="Ingresar" property="updateDatos"/></p>
                </div>
            </div>
        </div>
    </body>
</html>

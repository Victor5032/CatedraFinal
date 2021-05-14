<%-- 
    Document   : ingresaForm
    Created on : 05-13-2021, 03:27:49 PM
    Author     : emer2
--%>

<%@page import="sv.edu.udb.db.jefe.ConexionBase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            String codigo = request.getParameter("codigo");
            String estadoSolicitud = request.getParameter("estadoSolicitud");
            String observacion = request.getParameter("observacion");
            int idcaso = Integer.parseInt(request.getParameter("idcaso"));
            if (request.getParameter("idcaso") != null) {
                request.getParameter("estadoSolicitud");
                if(estadoSolicitud.equals("Aprobar")){

                    String query = "UPDATE caso SET estado = 3 WHERE codigo = '" + codigo + "'";
                    ConexionBase con = new ConexionBase();
                    con.setQuery(query);

                    response.sendRedirect("index.jsp?estado=Aprobado");

                }else if(estadoSolicitud.equals("Rechazar")){

                    String query = "UPDATE caso SET estado = 1 WHERE codigo = '" + codigo + "'";
                    String obs = "INSERT INTO observaciones (caso, observacion) VALUES (" + idcaso + ", '" + observacion + "')";
                    ConexionBase con = new ConexionBase();
                    con.setQuery(query);
                    con.setQuery(obs);

                    response.sendRedirect("index.jsp?estado=Rechazado");

                }
            }
        %>
    </body>
</html>

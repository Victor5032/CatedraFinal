<%-- 
    Document   : BitacoraCasos
    Created on : 05-12-2021, 04:30:22 PM
    Author     : Kevin Otero
--%>

<%@page import="sv.edu.udb.database.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
        <title>Bitacora de Casos</title>
    </head>
    <body>
        <div>
            <table>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Codigo</th>
                        <th>Caso</th>
                        <th>Descripción</th>
                        <th>Fecha de entrega</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Conexion con1 =  new Conexion();
                        int contar=0;
                        ResultSet rs1 =  null ;                    
                        con1.setRs("SELECT caso.codigo, solicitud.caso, solicitud.descripcion, caso.fecha_limite, caso.caso_id, caso.solicitud_id, caso.caso_descripcion FROM caso INNER JOIN solicitud ON caso.solicitud_id = solicitud.solicitud_id INNER JOIN usuarios ON caso.programador = usuarios.usuario_id WHERE caso.programador = " + session.getAttribute("id") + " AND (caso.estado = 1 OR caso.estado = 5)");
                        rs1 = con1.getRs();
                        while(rs1.next()){
                            contar ++;
                            
                    %>
                    <tr>
                        <th> <%=contar %></th>
                        <th> <%= rs1.getString(1)%></th>
                        <th> <%= rs1.getString(2)%></th>
                        <th> <%= rs1.getString(3)%></th>
                        <th> <%= rs1.getString(4)%></th>
                        <th> <%=rs1.getString(5)%></th>
                        <th> <%=rs1.getString(6)%></th>
                        <th> <%=rs1.getString(7)%></th>
                        <th><input > </th>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
                <div>
                    <table>
                        
                    </table>
                </div>
        </div>
    </body>
</html>

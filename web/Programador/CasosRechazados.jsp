<%-- 
    Document   : CasosRechazados
    Created on : 05-12-2021, 08:28:40 PM
    Author     : Kevin Otero
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="sv.edu.udb.database.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
        <title>Casos Rechazados</title>
    </head>
    <body>
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
                        con1.setRs("SELECT caso.codigo, solicitud.caso, solicitud.descripcion, caso.fecha_limite, caso.caso_id, caso.solicitud_id, caso.caso_descripcion FROM caso INNER JOIN solicitud ON caso.solicitud_id = solicitud.solicitud_id INNER JOIN usuarios ON caso.programador = usuarios.usuario_id WHERE caso.programador = " +session.getAttribute("id")+ " AND caso.estado = 1");
                        rs1 = con1.getRs();
                        while(rs1.next()){
                            contar ++;
                            
                    %>
                    <tr>
                        <th> <%=contar %></th>
                        <th> <%= rs1.getString(1)%></th>
                        <th> <%= rs1.getString(2)%>/th>
                        <th> <%= rs1.getString(3)%></th>
                        <th> <%= rs1.getString(4)%></th>
                        <th> <%=rs1.getString(5)%></th>
                        <th> <%=rs1.getString(6)%></th>
                        <th> <%=rs1.getString(7)%></th>          
                        <th><input value="boton" size="20" type="submit" href="InfoCasos.jsp?rs<%=rs1.getString(1)%>"></th>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
           <div>
               <h1>Datos del caso y sus observaciones</h1>
            <table>
                <thead>
                    <tr>
                        <th>Observación</th>
                        <th>Fecha</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Conexion con2 =  new Conexion();
                        int contador=0;
                        ResultSet rs2 =  null ;                    
                        con2.setRs("SELECT observacion, fecha_registro FROM observaciones WHERE observaciones.caso = " + session.getAttribute("id"));
                        rs2 = con1.getRs();
                        while(rs1.next()){
                            contar ++;
                            
                    %>
                    <tr>
                        <th> <%=contar %></th>
                        <th> <%= rs1.getString(1)%></th>
                        <th> <%= rs1.getString(2)%></th>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
           </div>
    </body>
</html>

<%-- 
    Document   : navbar
    Created on : 05-10-2021, 12:44:50 PM
    Author     : Victor López
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String url = (request.getRequestURL()).toString();

    if (session.getAttribute("user") == null) {
%>
    <jsp:forward page="../index.jsp">
        <jsp:param name="mensaje" value="Debe iniciar sesión" />
    </jsp:forward> 
<%
    }
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/jefe/Index.jsp">Proyectos</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/jefe/Index.jsp">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/jefe/Ingresar_nueva_solicitud.jsp">Ingresar nueva solicutd</a>
                </li>
            </ul>
            <div class="d-flex">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <span class="nav-link active">${user}&nbsp;</span>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/auth/logout.jsp">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>

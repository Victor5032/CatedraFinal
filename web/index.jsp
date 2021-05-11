<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="es" dir="ltr">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Iniciar sesión</title>
        <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signin.css">
        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }
      
            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
          </style>
    </head>
    <body>
        <main class="form-signin">
            <% if (request.getParameter("mensaje") != null) { %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong><%= request.getParameter("mensaje") %>.</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% } %>
            <form action="${pageContext.request.contextPath}/auth/login.jsp" method="POST">
                <h1 class="text-center h2 mb-3 fw-bold font-weight-700">Iniciar sesión</h1>
                <div class="form-floating">
                    <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Usuario">
                    <label for="usuario_label">Usuario</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                    <label for="password_label">Contraseña</label>
                </div>
                <button class="w-100 btn btn-lg btn-primary" type="submit">Iniciar sesión</button>
                <p class="d-block text-center mt-5 mb-3 text-muted">&copy; UDB 2021</p>
            </form>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    </body>
</html>


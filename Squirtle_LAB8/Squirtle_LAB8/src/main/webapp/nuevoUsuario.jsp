<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Crear Usuario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
          crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h2 class='mb-3'>Crear nuevo Usuario</h2>
    <form method="POST" action="<%=request.getContextPath()%>/UsuariosServlet?action=guardar">
        <div class="mb-3">
            <label for="nombre">Nombre</label>
            <input type="text" class="form-control" name="nombre" id="nombre">
        </div>
        <div class="mb-3">
            <label for="apellido">Apellido</label>
            <input type="text" class="form-control" name="apellido" id="apellido">
        </div>
        <div class="mb-3">
            <label for="edad">Edad</label>
            <input type="text" class="form-control" name="edad" id="edad">
        </div>
        <div class="mb-3">
            <label for="codigoPucp">Codigo Pucp</label>
            <input type="text" class="form-control" name="codigoPucp" id="codigoPucp">
        </div>
        <div class="mb-3">
            <label for="correoPucp">Correo Pucp</label>
            <input type="text" class="form-control" name="correoPucp" id="correoPucp">
        </div>
        <div class="mb-3">
            <label for="especialidad">Especialidad</label>
            <input type="text" class="form-control" name="especialidad" id="especialidad">
        </div>
        <div class="mb-3">
            <label for="estatus">Status</label>
            <input type="text" class="form-control" name="estatus" id="estatus">
        </div>
        <div class="mb-3">
            <label for="idUsuarios">idUsuario</label>
            <input type="text" class="form-control" name="idUsuarios" id="idUsuarios">
        </div>
        <div class="mb-3">
            <label for="nombreUsuario">Nombre Usuario registrar </label>
            <input type="text" class="form-control" name="nombreUsuario" id="nombreUsuario">
        </div>
        <div class="mb-3">
            <label for="passwordHashed">Contraseña</label>
            <input type="text" class="form-control" name="passwordHashed" id="passwordHashed">
        </div>

        <a class="btn btn-danger" href="<%=request.getContextPath()%>/login">Cancelar</a>
        <button type="submit" class="btn btn-primary">Guardar</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Imagen en pantalla completa con cuadrado negro y formulario</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            overflow: hidden;
        }

        #fullscreen-image {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }

        #overlay {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 500px;
            height: 400px;
            background-color: black;
            z-index: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            padding: 20px;
        }

        #overlay h2 {
            color: white;
            margin-bottom: 20px;
        }

        #overlay form {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 100%;
            margin-bottom: 20px;
        }

        #overlay input {
            margin-bottom: 10px;
            width: 100%;
        }

        #overlay button {
            width: 100%;
            margin-bottom: 10px;
        }

        #overlay a {
            color: white;
            text-decoration: underline;
            margin-top: 10px;
        }

        #overlay-image {
            display: block;
            width: 100%;
            height: auto;
            object-fit: contain;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<img id="fullscreen-image" src="fondo.jpg" alt="Imagen en pantalla completa">
<div id="overlay">
    <div style="width: 50%; height: 50%;">
        <img id="overlay-image" src="logo.png" alt="Imagen en el cuadrado negro">
    </div>
    <h2>Bienvenido Televiajero</h2>
    <form>
        <input type="text" placeholder="Usuario" required>
        <input type="password" placeholder="Contraseña" required>
        <a class="btn btn-primary" href="<%=request.getContextPath()%>/login?action=verUsuario">Ingresar</a>
        <a href="#">Soy nuevo y quiero registrarme</a>
    </form>
</div>
</body>
</html>



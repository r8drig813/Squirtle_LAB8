<%--
  Created by IntelliJ IDEA.
  User: Julio César
  Date: 17/06/2023
  Time: 01:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Imagen de pantalla completa con barra superior de estado de estudiante</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            overflow: hidden;
        }

        #fullscreen-image {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }

        #top-bar {
            background-color: gold;
            color: white;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        #top-bar h1 {
            margin: 0;
        }

        #logout-btn {
            background-color: red;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }

        .silver {
            background-color: silver;
        }

        .gold {
            background-color: gold;
        }

        .platinum {
            background-color: black;
        }
    </style>
</head>
<body>
<img id="fullscreen-image" src="fondo.jpg" alt="Imagen de pantalla completa">
<div id="top-bar">
    <h1>Julio César</h1>
    <button id="logout-btn">Cerrar sesión</button>
</div>
</body>
</html>

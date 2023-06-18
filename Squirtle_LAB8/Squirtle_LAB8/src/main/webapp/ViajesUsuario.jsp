<%@ page import="com.example.squirtle_lab8.Beans.Viajes" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.math.BigDecimal" %><%--
<%@ page import="java.math.BigDecimal" %>
  Created by IntelliJ IDEA.
  User: Julio César
  Date: 17/06/2023
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  ArrayList<Viajes> listaViajes = (ArrayList<Viajes>) request.getAttribute("lista");
%>
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
      <%int gastos=0;
        String tipoSocio="blue";
      for (Viajes viajeGastos : listaViajes) {
        int value= viajeGastos.getCostoTotal().intValue();
      gastos=gastos+value;
      }%>

      <%if (gastos <= 100){
        tipoSocio="Cliente Blue: Nos alegra que estes con nosotros";%>
      background-color: blue;
      color: white;
      padding: 10px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      <%}%>
    <%if (gastos>100 && gastos<=1000 ){
      tipoSocio="SILVER: Eres un cliente excepcional";%>
      background-color: silver;
      color: white;
      padding: 10px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    <%}%>
    <%if (gastos>1000 && gastos<=10000 ){
      tipoSocio="GOLD: Brillas como ningun otro";%>
      background-color: gold;
      color: white;
      padding: 10px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    <%}%>
    <%if (gastos>10000 ){
      tipoSocio="BLACK: Eres la cara de la empresa";%>
      background-color: black;
      color: white;
      padding: 10px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    <%}%>
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
  <div class="d-flex justify-content-end align-items-center">
  <span style="background-color: #ff0000; color: #ffffff; padding: 5px 10px; border-radius: 5px;">
    <%= listaViajes.get(0).getNombreUsuario() %>
  </span>
    <a href="<%=request.getContextPath()%>/login?action=logout"
       style="background-color: #ff0000; color: #ffffff; padding: 5px 10px; border-radius: 5px; text-decoration: none;">
      Cerrar Sesión
    </a>
    <span color: #ffffff; padding: 5px 10px; border-radius: 5px;">
    <%=tipoSocio%>
    </span>

    <a class="navbar-brand" href="<%=request.getContextPath()%>/Viajes?action=agregar"  style="background-color: #ff0000; color: white; padding: 10px 20px; border-radius: 5px; text-decoration: none; font-weight: bold;">
      Añadir un nuevo Viaje
    </a>

  </div>
</div>
<div class="card-body" style="display: flex; justify-content: center; align-items: center; height: 100vh;">
  <div class="table-responsive" style="width: 90%; background-color: white; color: black;">
    <table class="table table-bordered" id="dataTable" style="font-size: 18px; border-spacing: 20px;">
      <thead>
      <tr>
        <th>ID VIAJE</th>
        <th>FECHA RESERVA</th>
        <th>FECHA VIAJE</th>
        <th>CIUDAD ORIGEN</th>
        <th>CIUDAD DESTINO</th>
        <th>NOMBRE SEGURO</th>
        <th>NUMERO BOLETOS</th>
        <th>COSTO TOTAL</th>
        <th></th>
      </tr>
      </thead>
      <tbody>
      <% for (Viajes viaje : listaViajes) { %>
      <tr>
        <td><%=viaje.getIdViaje()%></td>
        <td><%=viaje.getFechaReserva()%></td>
        <td><%=viaje.getFechaViaje()%></td>
        <td><%=viaje.getCiudadOrigen()%></td>
        <td><%=viaje.getCiudadDestino()%></td>
        <td><%=viaje.getNombreSeguro()%></td>
        <td><%=viaje.getNumeroBoletos()%></td>
        <td><%=viaje.getCostoTotal()%></td>
      </tr>
      <% } %>
      </tbody>
    </table>
  </div>
</div>












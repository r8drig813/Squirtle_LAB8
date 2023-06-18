package com.example.squirtle_lab8.Servlet;

import java.io.*;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

import com.example.squirtle_lab8.Beans.Seguros;
import com.example.squirtle_lab8.Beans.Usuarios;
import com.example.squirtle_lab8.Beans.Viajes;
import com.example.squirtle_lab8.Daos.SeguroDaos;
import com.example.squirtle_lab8.Daos.UsuarioDaos;
import com.example.squirtle_lab8.Daos.ViajeDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
@WebServlet(name = "ViajesServlet",value = {"/Viajes"})
public class ViajesServlet extends HttpServlet {

    @Override
    protected  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        RequestDispatcher view;
        UsuarioDaos usuarioDaos = new UsuarioDaos();
        SeguroDaos seguroDaos = new SeguroDaos();
        //JobDao jobDao = new JobDao();
        //DepartmentDao departmentDao = new DepartmentDao();

        switch (action) {
            case "lista":
                view = request.getRequestDispatcher("/lista.jsp");
                view.forward(request, response);
                break;
            case "listaTodo":
                String NombreUsuario = request.getParameter("nombre");
                UsuarioDaos nuevoDao = new UsuarioDaos();
                ArrayList<Viajes> listaViajes = nuevoDao.mostrarViajesUsuario(NombreUsuario);
                request.setAttribute("lista", listaViajes);
                view = request.getRequestDispatcher("/ViajesUsuario.jsp");
                view.forward(request, response);
                break;
            case "agregar":
                request.setAttribute("listaSeguros", seguroDaos.lista());
                view = request.getRequestDispatcher("/nuevoViaje.jsp");
                view.forward(request, response);
                break;
        }

    }
    @Override
    protected  void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        String action = request.getParameter("action") == null ? "guardar" : request.getParameter("action");
        ViajeDao viajeDao = new ViajeDao();

        switch (action) {
            case"guardar":

                Viajes viajes= new Viajes();
                viajes.setFechaViaje(Date.valueOf(request.getParameter("fechaViaje")));
                viajes.setFechaReserva(Date.valueOf(request.getParameter("fechaReserva")));
                viajes.setNumeroBoletos(Integer.parseInt(request.getParameter("numeroBoletos")));
                //viajes.setCostoTotal(request.getParameter("costoTotal"));

                Seguros seguros = new Seguros();
                seguros.setIdSeguros(Integer.parseInt(request.getParameter("idSeguros")));
                viajes.setSeguros(seguros);

                try {
                    viajeDao.añadirViaje(viajes);
                    response.sendRedirect("/Viajes");

                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

                break;
        }

    }
}
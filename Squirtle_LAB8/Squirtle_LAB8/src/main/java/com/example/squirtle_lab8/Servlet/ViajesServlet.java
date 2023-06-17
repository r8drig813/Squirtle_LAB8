package com.example.squirtle_lab8.Servlet;

import java.io.*;
import java.util.ArrayList;

import com.example.squirtle_lab8.Beans.Usuarios;
import com.example.squirtle_lab8.Beans.Viajes;
import com.example.squirtle_lab8.Daos.UsuarioDaos;
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
        }

    }
    @Override
    protected  void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

    }
}
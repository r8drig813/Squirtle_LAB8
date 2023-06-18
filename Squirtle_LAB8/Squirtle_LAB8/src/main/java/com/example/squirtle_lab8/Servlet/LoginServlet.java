package com.example.squirtle_lab8.Servlet;

import com.example.squirtle_lab8.Beans.Usuarios;
import com.example.squirtle_lab8.Daos.UsuarioDaos;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action") != null ? req.getParameter("action") : "login";

        if (action.equals("login")) {

            HttpSession session = req.getSession();

            if(session != null && session.getAttribute("usuarioLog") != null){

                Usuarios usuarios = (Usuarios) session.getAttribute("usuarioLog");

                if(usuarios.getIdUsuarios()>0){ //estoy loggedIn
                    resp.sendRedirect(req.getContextPath() + "/lista");
                }else{ // no estoy loggedId
                    RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
                    dispatcher.forward(req, resp);
                }
            }
        }else{ //logout
            req.getSession().invalidate();
            resp.sendRedirect(req.getContextPath());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String correo = req.getParameter("inputCorreo");
        String pass = req.getParameter("inputPassword");

        UsuarioDaos usuarioDaos = new UsuarioDaos();
        Usuarios usuarios = usuarioDaos.validateUsernameAndPassword(correo, pass);


        if (usuarios != null) { //usuario y password correctos
            HttpSession session = req.getSession();
            session.setAttribute("usuarioLog", usuarios);

            session.setMaxInactiveInterval(300);//en segundos

            resp.sendRedirect(req.getContextPath()+"/Viajes");
        } else { //usuario o password incorrectos
            req.setAttribute("error", "Usuario o password incorrectos");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }
}
    package com.example.squirtle_lab8.Servlet;

    import java.io.*;
    import java.sql.SQLException;

    import com.example.squirtle_lab8.Beans.Credenciales;
    import com.example.squirtle_lab8.Beans.Usuarios;
    import com.example.squirtle_lab8.Daos.UsuarioDaos;
    import jakarta.servlet.RequestDispatcher;
    import jakarta.servlet.ServletException;
    import jakarta.servlet.http.*;
    import jakarta.servlet.annotation.*;

    @WebServlet(name = "UsuariosServlet", value = "/UsuariosServlet")
    public class UsuariosServlet extends HttpServlet {

        @Override
        protected  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

            String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
            RequestDispatcher view;
            UsuarioDaos usuarioDaos = new UsuarioDaos();

            switch (action){
                case "agregar":
                    view = request.getRequestDispatcher("/nuevoUsuario.jsp");
                    view.forward(request, response);

            }


        }
        @Override
        protected  void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

            String action = request.getParameter("action") == null ? "guardar" : request.getParameter("action");
            UsuarioDaos usuarioDaos = new UsuarioDaos();

            switch (action) {
                case"guardar":

                    Usuarios usuarios= new Usuarios();
                    usuarios.setNombre(request.getParameter("nombre"));
                    usuarios.setApellido(request.getParameter("apellido"));
                    usuarios.setEdad(Integer.parseInt(request.getParameter("edad")));
                    usuarios.setCodigoPucp(request.getParameter("codigoPucp"));
                    usuarios.setCorreoPucp(request.getParameter("correoPucp"));
                    usuarios.setEspecialidad(request.getParameter("especialidad"));
                    usuarios.setPassword(request.getParameter("passwordHashed"));

                    try {
                        usuarioDaos.guardarUsuario(usuarios);
                        response.sendRedirect("/login");

                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }

                    break;
            }

        }
    }
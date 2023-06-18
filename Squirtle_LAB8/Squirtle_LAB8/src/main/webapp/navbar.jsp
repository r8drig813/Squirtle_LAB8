<%String currentPage = request.getParameter("currentPage"); %>
<jsp:useBean id="usuarioLog" scope="session" type="com.example.squirtle_lab8.Beans.Usuarios"
             class="com.example.squirtle_lab8.Beans.Usuarios"/>

<nav class="navbar navbar-expand-md navbar-light bg-light">
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
                background-color: palegoldenrod;
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

            #image-container {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-wrap: wrap;
            }

            #image-container img {
                margin: 10px;
                width: 30%;
            }

            #image-container table {
                margin-top: 20px;
                text-align: center;
                width: 30%;
                background-color: white;
            }

            .blue {
                background-color: blue;
                color: white;
            }

            table td {
                color: black;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
    <img id="fullscreen-image" src="fondo.jpg" alt="Imagen de pantalla completa">
    <div class="container-fluid">
        <div id="top-bar" class="gold"> <!-- Aplicar la clase "gold" aquí -->
            <a class="navbar-brand" href="<%=request.getContextPath()%>/Viajes?action=listaTodo&nombre=<%=usuarioLog.getNombre()%>"
               style="background-color: #ff0000; color: #ffffff; padding: 10px 20px; border-radius: 5px; text-decoration: none; font-weight: bold;">
                Mostrar tus viajes
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                <ul class="navbar-nav">
                    <!---<li class="nav-item">
                    <a class="nav-link <%=currentPage.equals("emp") ? "active" : ""%>"
                       href="<%=request.getContextPath()%>/ViajesServlet">
                        Viajes
                    </a>
                </li>--->
                    <div class="form-inline font-italic my-2 my-lg-0">
                        <% if (usuarioLog.getIdUsuarios() > 0) { // Esto logueado %>
                        <span style="background-color: #ff0000; color: #ffffff; padding: 5px 10px; border-radius: 5px;">
                    <%=usuarioLog.getNombre() + " " + usuarioLog.getApellido()%>
                </span>
                        <a href="<%=request.getContextPath()%>/login?action=logout"
                           style="background-color: #ff0000; color: #ffffff; padding: 5px 10px; border-radius: 5px; text-decoration: none;">
                            Cerrar Sesion
                        </a>
                        <% } else { // No estoy loggedIn %>
                        <a class="nav-link" href="<%=request.getContextPath()%>/login"
                           style="background-color: #007bff; color: #ffffff; padding: 5px 10px; border-radius: 5px; text-decoration: none;">
                            (Iniciar Sesión)
                        </a>
                        <% } %>
                    </div>
                </ul>
            </div>
        </div>
        <div id="image-container">
            <img src="machuPichu.jpg">
            <img src="Familia.jpg">
            <img src="Iglesia.jpg">
            <table>
                <tr>
                    <td>CLIENTE BLUE</td>
                    <td class="blue"></td>
                </tr>
                <tr>
                    <td>CLIENTE SILVER</td>
                    <td class="silver"></td>
                </tr>
                <tr>
                    <td>CLIENTE GOLD</td>
                    <td class="gold"></td>
                </tr>
                <tr>
                    <td>CLIENTE BLACK</td>
                    <td class="platinum">.........................................</td>
                </tr>
            </table>
        </div>
    </div>
    </body>
</nav>
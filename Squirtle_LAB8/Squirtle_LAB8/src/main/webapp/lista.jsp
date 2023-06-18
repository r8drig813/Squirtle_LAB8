<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuarioLog" scope="session" type="com.example.squirtle_lab8.Beans.Usuarios"
             class="com.example.squirtle_lab8.Beans.Usuarios"/>
<html>
<head>
    <title>Viajes Estudiante</title>
</head>
<body>
  <div>
      <jsp:include page="/navbar.jsp">
          <jsp:param name="currentPage" value="emp"/>
      </jsp:include>
  </div>

</body>
</html>

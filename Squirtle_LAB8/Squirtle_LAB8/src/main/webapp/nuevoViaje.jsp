<%@ page import="com.example.squirtle_lab8.Beans.Seguros" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaSeguros" type="java.util.ArrayList<com.example.squirtle_lab8.Beans.Seguros>" scope="request"/>

<html>
<head>
  <title>Crear Usuario</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
        crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

</head>
<body>
<div class="container">
  <h2 class='mb-3'>Crear nuevo Viaje</h2>
  <form method="POST" action="<%=request.getContextPath()%>/UsuariosServlet?action=guardar"  >
    <div class="mb-3">
      <label for="inputFecha"  >Fecha de Viaje</label>
      <input type="text" class="form-control" name="fechaViaje" id="inputFecha">
      <div class="invalid-feedback">
        Ingrese solo letras.
      </div>
    </div>
    <div class="mb-3">
      <label for="inputFecha1">Fecha de Reserva</label>
      <input type="number" class="form-control" name="fechaReserva" id="inputFecha1" >
    </div>
    <div class="mb-3">
      <label for="numeroBoletos">Numero de Boletos</label>
      <input type="text" class="form-control" name="numeroBoletos" id="numeroBoletos"  maxlength="8" required>
    </div>
    <div class="mb-3">
      <label for="costoTotal">Costo Unitario</label>
      <input type="text" class="form-control" name="costoTotal" id="costoTotal" maxlength="8" required>
    </div>
    <div class="mb-3">
      <label for="idSeguros">Seguros</label>
      <select class="form-select" name="estadio_idEstadio">
        <% for (Seguros seguros : listaSeguros) { %>
        <option value="<%=seguros.getIdSeguros()%>">
          <%=seguros.getNombre()%>
        </option>
        <% } %>
      </select>
    </div>

    <a class="btn btn-danger" href="<%=request.getContextPath()%>/ViajesUsuario.jsp">Cancelar</a>
    <button type="submit" class="btn btn-primary">Guardar</button>
  </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous">
  function validarNumero(input) {
    if (input.value < 18)
      input.value = 18;
    else if (input.value > 30)
      input.value = 30;
  }
</script>
<script>
  document.querySelector('form').addEventListener('submit', function(event) {
    var passwordInput = document.getElementById('passwordHashed');
    var password = passwordInput.value;

    if (!isValidPassword(password)) {
      event.preventDefault();
      alert('La contraseña debe contener al menos un número, una mayúscula y un carácter especial.');
    }
  });

  function isValidPassword(password) {
    // Comprueba si la contraseña contiene al menos un número
    var containsNumber = /\d/.test(password);

    // Comprueba si la contraseña contiene al menos una mayúscula
    var containsUppercase = /[A-Z]/.test(password);

    // Comprueba si la contraseña contiene al menos un carácter especial
    var containsSpecialChar = /[!@#$%^&*()_+\-=[\]{};':"\\|,.<>/?]+/.test(password);

    // Devuelve verdadero solo si la contraseña cumple todas las condiciones
    return containsNumber && containsUppercase && containsSpecialChar;
  }

</script>
<script>
  document.querySelector('form').addEventListener('submit', function(event) {
    var passwordInput = document.getElementById('passwordHashed');
    var confirmPasswordInput = document.getElementById('confirm-password');
    var password = passwordInput.value;
    var confirmPassword = confirmPasswordInput.value;

    if (password !== confirmPassword) {
      event.preventDefault();
      alert('Las contraseñas no coinciden. Por favor, inténtalo de nuevo.');
    }
  });

</script>
<script>
  // Restricción de fechas al formato año-mes-día
  var inputFecha = document.getElementById('inputFecha');
  inputFecha.addEventListener('input', function() {
    var fecha = this.value;
    if (!/^(\d{4})-(\d{2})-(\d{2})$/.test(fecha)) {
      this.setCustomValidity('Ingrese una fecha válida en el formato aaaa-mm-dd');
    } else {
      this.setCustomValidity('');
    }
  });
</script>
<script>
  // Restricción de fechas al formato año-mes-día
  var inputFecha = document.getElementById('inputFecha1');
  inputFecha.addEventListener('input', function() {
    var fecha = this.value;
    if (!/^(\d{4})-(\d{2})-(\d{2})$/.test(fecha)) {
      this.setCustomValidity('Ingrese una fecha válida en el formato aaaa-mm-dd');
    } else {
      this.setCustomValidity('');
    }
  });
</script>

</body>
</html>


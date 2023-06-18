<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
    <h2 class='mb-3'>Crear nuevo Usuario</h2>
    <form method="POST" action="<%=request.getContextPath()%>/UsuariosServlet?action=guardar"  >
        <div class="mb-3">
            <label for="nombre" >Nombre</label>
            <input type="text" class="form-control" name="nombre" id="nombre"  oninput="this.value = this.value.replace(/[0-9]/g, '')" required>
            <div class="invalid-feedback">
                Ingrese solo letras.
            </div>
        </div>
        <div class="mb-3">
            <label for="apellido"  >Apellido</label>
            <input type="text" class="form-control" name="apellido" id="apellido"  oninput="this.value = this.value.replace(/[0-9]/g, '')" required>
            <div class="invalid-feedback">
                Ingrese solo letras.
            </div>
        </div>
        <div class="mb-3">
            <label for="numero">Edad</label>
            <input type="number" class="form-control" name="edad" id="numero" min="18" max="30" oninput="validarNumero(this);" >
        </div>
        <div class="mb-3">
            <label for="codigoPucp">Codigo Pucp</label>
            <input type="text" class="form-control" name="codigoPucp" id="codigoPucp"  maxlength="8" required>
        </div>
        <div class="mb-3">
            <label for="correoPucp">Correo Pucp</label>
            <input type="text" class="form-control" name="correoPucp" id="correoPucp">
        </div>
        <div class="mb-3">
            <label for="especialidad">Especialidad</label>
            <input type="text" class="form-control" name="especialidad" id="especialidad">
        </div>
        <div class="mb-3">
            <label for="passwordHashed">Contraseña</label>
            <input type="text" class="form-control" name="passwordHashed" id="passwordHashed">
        </div>

        <div class="mb-3">
            <label for="confirm-password">Confirmar Contraseña:</label>
            <input type="password" id="confirm-password" required>
        </div>


        <a class="btn btn-danger" href="<%=request.getContextPath()%>/login">Cancelar</a>
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

</body>
</html>


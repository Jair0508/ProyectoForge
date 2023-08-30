<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/baseStyles.css">

  <title>Registro - Usuario</title>
</head>

<body>
  <div>
    <%@ include file="nav.jsp" %>
  </div>
  <div id="formularioLibros">
    <h1>Bienvenido, puede Registrar</h1>
    <div>
      <div>
        <form:form action="/registro" method="post" modelAttribute="usuario">

          <p>
            <form:label path="name">Nombre</form:label>
            <form:input type="text" path="name" placeholder="Ingrese su nombre" />
          <div>
            <strong>
              <form:errors path="name" />
            </strong>
          </div>
          </p>
          <p>
            <form:label path="email">Email</form:label>
            <form:input type="email" path="email" placeholder="Ingrese su Email" />
          <div>
            <strong>
              <form:errors path="email" />
            </strong>
          </div>
          </p>
          <p>
            <form:label path="password">Contraseña</form:label>
            <form:input type="password" path="password" placeholder="Ingrese su Clave" />
          <div>
            <strong>
              <form:errors path="password" />
            </strong>
          </div>
          </p>
          <p>
            <form:label path="passwordConfirmation">Confirme su clave</form:label>
            <form:input path="passwordConfirmation" type="password" placeholder="Confirme Su Clave" />
          <div>
            <strong>
              <form:errors path="passwordConfirmation" />
            </strong>
          </div>
          </p>

          <div>
            <a href="/">Principal</a>
            <button type="submit">Registrar</button>
          </div>

        </form:form>
      </div>
    </div>
  </div>
</body>

</html>
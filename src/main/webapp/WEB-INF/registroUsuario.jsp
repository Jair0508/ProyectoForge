<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/baseStyles.css">
  <link rel="stylesheet" href="/css/formStyle.css">

  <title>Registro - Usuario</title>
</head>

<body>
  <div>
    <%@ include file="nav.jsp" %>
  </div>
  <div class="formulario">
    <h1 class="form-title">Bienvenido, llene sus datos</h1>

    <form:form action="/registro" method="post" modelAttribute="usuario">

      <form:label class="input-label" path="name">Nombre</form:label>
      <form:input class="input-content" type="text" path="name" placeholder="Ingrese su nombre" />
      <form:errors class="errors" path="name" />


      <form:label class="input-label" path="email">Email</form:label>
      <form:input class="input-content" type="email" path="email" placeholder="Ingrese su Email" />
      <form:errors class="errors" path="email" />


      <form:label class="input-label" path="password">Contraseña</form:label>
      <form:input class="input-content" type="password" path="password" placeholder="Ingrese su Contraseña" />
      <form:errors class="errors" path="password" />


      <form:label class="input-label" path="passwordConfirmation">Confirme su Contraseña</form:label>
      <form:input class="input-content" path="passwordConfirmation" type="password" placeholder="Confirme Su Contraseña" />
      <form:errors class="errors" path="passwordConfirmation" />


      <div>
        <a href="/">Principal</a>
        <button type="submit">Registrar</button>
      </div>

    </form:form>
  </div>
</body>

</html>
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
        <link rel="stylesheet" href="/css/VerPasswordStyle.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

        <title>Registro - Usuario</title>
      </head>

      <body>

        <%@ include file="nav.jsp" %>

          <div class="formulario">
            <h1 class="form-title">Bienvenido, registre sus datos</h1>

            <form:form action="/usuario/registro" method="post" modelAttribute="usuario">

              <form:label class="input-label" path="name">Nombre</form:label>
              <form:input class="input-content" type="text" path="name" placeholder="Ingrese su nombre" />
              <form:errors class="errors" path="name" />


              <form:label class="input-label" path="email">Email</form:label>
              <form:input class="input-content" type="email" path="email" placeholder="Ingrese su Email" />
              <form:errors class="errors" path="email" />

              <div id="info" class="input-group">
                <div class="Info">
                  <form:label class="input-label" path="password">Contraseña</form:label>
                </div>
                <div class="Info input-group-prepend">
                  <span class="input-group-text">
                    <i class="fa fa-info-circle icon-info" id="password-tooltip-icon"></i>
                  </span>
                </div>
              </div>
              <div id="icon" class="input-group">
                <form:input class="input-content" type="password" path="password" id="passwordConfirmationInput"
                  placeholder="Ingrese su Contraseña" />
                <div class="input-group-prepend">
                  <span class="input-group-text">
                    <i class="fa fa-eye icon-eye" id="showPasswordIcon"></i>
                  </span>
                </div>
              </div>
              <form:errors class="errors" path="password" />


              <form:label class="input-label" path="passwordConfirmation">Confirme su Contraseña</form:label>
              <div class="icon">
                <form:input class="input-content" path="passwordConfirmation" type="password" id="passwordInput"
                  placeholder="Confirme Su Contraseña" />
              </div>
              <form:errors class="errors" path="passwordConfirmation" />

              <div class="buttons-container">
                <a class="button-link" href="/">Principal</a>
                <button class="button-link" type="submit">Registrar</button>
              </div>

            </form:form>
          </div>
          <%@ include file="footer.jsp" %>
          <script src="/javaScript/showPassword.js"></script>
          <script src="/javaScript/funcionalidadInfo.js"></script>
      </body>

      </html>
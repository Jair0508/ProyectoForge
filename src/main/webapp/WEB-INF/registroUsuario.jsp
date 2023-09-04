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
        <link rel="stylesheet" href="/css/ojoIcono.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

        <title>Registro - Usuario</title>
      </head>

      <body>

        <%@ include file="nav.jsp" %>

          <div class="formulario">
            <h1 class="form-title">Bienvenido, llene sus datos</h1>

            <form:form action="/registro" method="post" modelAttribute="usuario">

              <form:label class="input-label" path="name">Nombre</form:label>
              <form:input class="input-content" type="text" path="name" placeholder="Ingrese su nombre" />
              <form:errors class="errors" path="name" />


              <form:label class="input-label" path="email">Email</form:label>
              <form:input class="input-content" type="email" path="email" placeholder="Ingrese su Email" />
              <form:errors class="errors" path="email" />

              <div id="icon" class="input-group">
                <form:label class="input-label" path="password">Contraseña</form:label>
                <div class="input-group-prepend">
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
              <form:input class="input-content" path="passwordConfirmation" type="password" id="passwordInput"
                placeholder="Confirme Su Contraseña" />
              <form:errors class="errors" path="passwordConfirmation" />

              <div class="buttons-container">
                <a class="button-link" href="/">Principal</a>
                <button class="button-link" type="submit">Registrar</button>
              </div>

            </form:form>
          </div>
          <script>
            document.getElementById('password-tooltip-icon').addEventListener('mouseover', function () {
              var tooltip = document.createElement('div');
              tooltip.className = 'tooltip';
              tooltip.innerHTML = 'Ingrese solo 8 caracteres entre letras y números';


              var iconPosition = this.getBoundingClientRect();
              tooltip.style.top = (iconPosition.top - 30) + 'px';
              tooltip.style.left = (iconPosition.left + 30) + 'px';

              document.body.appendChild(tooltip);

              this.addEventListener('mouseout', function () {
                document.body.removeChild(tooltip);
              });
            });
          </script>
          <script src="/javaScript/showPassword.js"></script>
      </body>

      </html>
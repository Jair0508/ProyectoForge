<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Registrar Genero</title>
                <link rel="stylesheet" href="/css/baseStyles.css">
                <link rel="stylesheet" href="/css/formStyle.css">
            </head>

            <body>
                <div>
                    <%@ include file="nav.jsp" %>
                  </div>
                  <div class="formulario">
                    <h1 class="form-title">Agregar Genero</h1>
                    <form:form action="/generos/anexar/genero" method="post" modelAttribute="genero">
                
                      <form:label class="input-label" path="nombreGenero">Nombre Genero</form:label>
                      <form:input class="input-content" type="text" path="nombreGenero" placeholder="Ingrese nombre Genero" />
                      <form:errors class="errors" path="nombreGenero" />
                      
                      <div class="buttons-container">
                        <c:if test="${not empty realizado}">
                          <a class="button-link" href="/usuario/administrador">Regresar</a>
                          <p class="checked">
                            <c:out value="${realizado}" />
                          </p>
                        </c:if>
                        <c:if test="${empty realizado}">
                          <a class="button-link" href="javascript:history.back()">Cancelar</a>
                        </c:if>
                        <button class="button-link" type="submit">Agregar</button>
                      </div>
                    </form:form>
                  </div>
                  <%@ include file="footer.jsp" %>
            </body>

            </html>
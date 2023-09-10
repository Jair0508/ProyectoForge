<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/css/baseStyles.css">
        <link rel="stylesheet" href="/css/formStyle.css">
        <title>Registro - Libros</title>

      </head>

      <body>

        <%@ include file="nav.jsp" %>

          <div class="formulario">
            <h1 class="form-title">Agregar Libro Ventas</h1>
            <form:form action="/libros/anexar" method="post" modelAttribute="libro">

              <form:label class="input-label" path="nombre">Nombre</form:label>
              <form:input class="input-content" type="text" path="nombre" placeholder="Ingrese nombre del libro" />
              <form:errors class="errors" path="nombre" />

              <form:label class="input-label" path="descripcion">Descripción</form:label>
              <form:textarea class="input-content" type="text" path="descripcion"
                placeholder="Ingrese descripcion del libro" />
              <form:errors class="errors" path="descripcion" />

              <form:label class="input-label" path="precio">Precio</form:label>
              <form:input class="input-content" type="number" min="1" step="0.01" path="precio"
                placeholder="Ingrese precio del libro" />
              <form:errors path="precio" />

              <form:label class="input-label" path="cantidad">cantidad</form:label>
              <form:input class="input-content" type="number" min="1" path="cantidad"
                placeholder="Ingrese cantidad de libros" />
              <form:errors  class="errors" path="cantidad" />

              <form:label class="input-label" path="autor">Autor</form:label>
              <form:select class="input-content" path="autor">
                <form:option value="">Selecione</form:option>
                <c:forEach var="autores" items="${listaAutores}">
                  <form:option value="${autores}">${autores.nombre}</form:option>
                </c:forEach>
              </form:select>
              <form:errors  class="errors" path="autor" />
              <div class="buttons-container">
                <a class="button-link" href="/autores/anexar/autor">Agregar Autor</a>
              </div>

              <form:label class="input-label" path="genero">Genero</form:label>
              <form:select class="input-content" path="genero">
                <form:option value="">Selecione</form:option>
                <c:forEach var="generos" items="${listaGeneros}">
                  <form:option value="${generos}">${generos.nombreGenero}</form:option>
                </c:forEach>
              </form:select>
              <form:errors  class="errors" path="genero" />
              <div class="buttons-container">
                <a class="button-link" href="/generos/anexar/genero">Agregar Genero</a>
              </div>

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
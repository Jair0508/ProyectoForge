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
            <h1 class="form-title">Agregar Libro</h1>
            <form:form action="/libros/anexar" method="post" modelAttribute="libro">

              <form:label class="input-label" path="nombre">Nombre</form:label>
              <form:input class="input-content" type="text" path="nombre" placeholder="Ingrese nombre del libro" />
              <form:errors class="errors" path="nombre" />

              <form:label class="input-label" path="descripcion">descripcion</form:label>
              <form:textarea class="input-content" type="text" path="descripcion"
                placeholder="Ingrese descripcion del libro" />
              <form:errors class="errors" path="descripcion" />

              <form:label class="input-label" path="precio">precio</form:label>
              <form:input class="input-content" type="number" min="1" step="0.01" path="precio"
                placeholder="Ingrese precio del libro" />
              <form:errors path="precio" />

              <form:label class="input-label" path="cantidad">cantidad</form:label>
              <form:input class="input-content" type="number" min="1" path="cantidad"
                placeholder="Ingrese cantidad de libros" />
              <form:errors path="cantidad" />

              <form:label class="input-label" path="autor">autor</form:label>
              <form:select class="input-content" path="autor">
                <form:option value="">selecione</form:option>
                <c:forEach var="autores" items="${listaAutores}">
                  <form:option value="${autores}">${autores.nombre}</form:option>
                </c:forEach>
              </form:select>
              <form:errors path="autor" />
              <div class="buttons-container">
                <a class="button-link" href="/autores/anexar/autor">Agregar Autor</a>
              </div>

              <form:label class="input-label" path="genero.nombreGenero">Genero</form:label>
              <form:input class="input-content" type="text" path="genero.nombreGenero"
                placeholder="Ingrese genero del libro" list="genero" />
              <datalist id="genero">
                <c:forEach var="genero" items="${listaGeneros}">
                  <option>
                    <c:out value="${genero.nombreGenero}" />
                  </option>
                </c:forEach>
              </datalist>
              <form:errors class="errors" path="genero.nombreGenero" />

              <div class="buttons-container">
                <a class="button-link" href="javascript:history.back()">Cancelar</a>
                <button class="button-link" type="submit">Anexar</button>
              </div>
              <p class="checked">
                <c:out value="${realizado}" />
              </p>
            </form:form>
          </div>

      </body>


      </html>
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
      <form:input class="input-content" type="text" path="descripcion" placeholder="Ingrese descripcion del libro" />
      <form:errors path="descripcion" />

      <form:label class="input-label" path="precio">precio</form:label>
      <form:input class="input-content" type="text" path="precio" placeholder="Ingrese precio del libro" />
      <form:errors path="precio" />

      <form:label class="input-label" path="cantidad">cantidad</form:label>
      <form:input class="input-content" type="text" path="cantidad" placeholder="Ingrese cantidad de libros" />
      <form:errors path="cantidad" />

      <form:label class="input-label" path="autor">autor</form:label>
      <form:select class="input-content" path="autor">
        <form:option value="">selecione</form:option>
        <c:forEach var="autores" items="${listaAutores}">
          <form:option value="${autores}">${autores.nombre}</form:option>
        </c:forEach>
      </form:select>

      <form:label class="input-label" path="genero">genero del libro</form:label>
      <form:select class="input-content" path="genero">
        <form:option value="">selecione</form:option>
        <c:forEach var="generos" items="${listaGeneros}">
          <form:option value="${generos}">${generos.nombre}</form:option>
        </c:forEach>
      </form:select>

      <div>
        <a href="">Regresar</a>
        <button type="submit">Anexar</button>
      </div>
      <p>
        <c:out value="${realizado}" />
      </p>
    </form:form>

    <div>
      <div>
        <button type="button" data-bs-toggle="dropdown" aria-expanded="false">
          Agregar Autor
        </button>
        <ul>
          <form:form action="/libros/anexar/autor" method="post" modelAttribute="autor">

              <form:label class="input-label" path="nombre">Nombre</form:label>
              <form:input class="input-content" type="text" path="nombre" placeholder="Ingrese su nombre" />
              <form:errors class="errors" path="nombre" />
              <c:out value="${repetidoAutor}" />

              <form:label class="input-label" path="descripcion">Biografia</form:label>
              <form:input class="input-content" type="text" path="descripcion" placeholder="Ingrese biografia de el autor" />
              <form:errors class="errors" path="descripcion" />

              <form:label class="input-label" path="frase">Frase</form:label>
              <form:input class="input-content" type="text" path="frase" placeholder="Ingrese alguna frase de el autor" />
              <form:errors class="errors" path="frase" />

            <div>
              <a href="">Regresar</a>
              <button type="submit">Anexar</button>
            </div>
              <c:out value="${realizado}" />
          </form:form>
        </ul>
      </div>


      <div>
        <button type="button" data-bs-toggle="dropdown" aria-expanded="false">
          Agregar Genero
        </button>
        <ul>
          <form:form action="/libros/anexar/genero" method="post" modelAttribute="genero">
            <p>
              <form:label class="input-label" path="nombre">Genero</form:label>
              <form:input class="input-content" type="text" path="nombre" placeholder="Ingrese genero " />
            <p>
              <c:out value="${repetidoGenero}" />
            </p>

            <div>
              <a href="">Regresar</a>
              <button type="submit">Anexar</button>
            </div>
            <p>
              <c:out value="${realizado}" />
            </p>
          </form:form>
        </ul>
      </div>
    </div>
  </div>
</body>


</html>
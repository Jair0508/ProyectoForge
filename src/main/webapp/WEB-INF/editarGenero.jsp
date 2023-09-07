<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Editar genero:
    <c:out value="${genero.nombreGenero}" />
  </title>
  <link rel="stylesheet" href="/css/baseStyles.css">
  <link rel="stylesheet" href="/css/formStyle.css">
</head>

<body>
  <%@ include file="nav.jsp" %>
    <div>
      <div class="formulario">
        <h1 class="form-title">Editar Genero:
          <c:out value="${genero.nombreGenero}" />
        </h1>
        <form:form action="/generos/${genero.id}/editar" method="post" modelAttribute="genero">
          <input type="hidden" name="_method" value="put">

          <form:label class="input-label" path="nombreGenero">Nombre Genero</form:label>
          <form:input class="input-content" type="text" path="nombreGenero"
            placeholder="Ingrese nombre del genero" />
          <form:errors class="errors" path="nombreGenero" />

          <div class="buttons-container">
            <a class="button-link" href="/usuario/administrador">Cancelar</a>
            <button class="button-link" type="submit">Agregar</button>
          </div>

          <c:out value="${realizado}" />

        </form:form>
        <a href="/libros/anexar">Agregar mas Autores</a>
      </div>
      <div>
        <div>
          <h4>Lista Libros de
            <c:out value="${genero.nombreGenero}" />
          </h4>
          <table>
            <thead>
              <tr>
                <th>Titulo</th>
                <th>Accion</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="libro" items="${libroNoNull}">
                <tr>
                  <td>
                    <c:out value="${libro.nombre}" />
                  </td>
                  <td>
                    <form action="/generos/${genero.id}/remover/${libro.id}" method="post">
                      <div>
                        <button type="submit">Remover</button>
                      </div>
                    </form>
                  </td>
              </c:forEach>
            </tbody>
          </table>
        </div>
        <div>
          <h4>Lista Libros sin Genero:</h4>
          <form action="/generos/${genero.id}/agregar" method="post">
            <select name="libroId">
              <c:forEach items="${libroNull}" var="libro">
                <option value="${libro.id}">
                  <c:out value="${libro.nombre}" />
                </option>
              </c:forEach>
            </select>
            <c:choose>
              <c:when test="${empty libroNull}">
                <p>No hay Libros para seleccionar</p>
              </c:when>
              <c:otherwise>
                <div>
                  <button type="submit">Agregar</button>
                </div>
              </c:otherwise>
            </c:choose>
          </form>
        </div>
      </div>
      <p>
        <c:out value="${removido}" />
      </p>
      <p>
        <c:out value="${agregado}" />
      </p>
    </div>
    <div>
      <%@ include file="footer.jsp" %>
    </div>
</body>

</html>
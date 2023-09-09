<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Agregar Autores a Libros</title>
</head>

<body>
  <%@ include file="nav.jsp" %>

  <div>
    <h1>Lista de Autores</h1>
    <table>
      <thead>
        <tr>
          <th>Nombre</th>
          <th>Accion</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="autor" items="${listaAutores}">
          <tr>
            <td>
              <c:out value="${autor.nombre}" />
            </td>
            <td>
              <a href="/autores/${autor.id}/editar">Ver</a>
            </td>
        </c:forEach>
      </tbody>
    </table>
  </div>
  <div>
    <h1>Lista de Generos</h1>
    <table>
      <thead>
        <tr>
          <th>Nombre</th>
          <th>Accion</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="genero" items="${listaGeneros}">
          <tr>
            <td>
              <c:out value="${genero.nombreGenero}" />
            </td>
            <td>
              <a href="/generos/${genero.id}/editar">Ver</a>
            </td>
        </c:forEach>
      </tbody>
    </table>
  </div>

  <%@ include file="footer.jsp" %>
</body>

</html>
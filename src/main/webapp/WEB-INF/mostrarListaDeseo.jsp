<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Hola
    <c:out value="${usuarioEmail.name}" />
  </title>
  <link rel="stylesheet" href="/css/baseStyles.css">
  <link rel="stylesheet" href="/css/wishStyle.css">
</head>

<body>
  <%@ include file="nav.jsp" %>

    <div>
      <div>
        <img src="/imagenes/alumno.png" alt="Lector">
        <h1><c:out value="${usuarioEmail.name}" /></h1>
      </div>
      <div>
        <h1>Lista de deseos</h1>
        <c:forEach var="lista_deseos" items="${usuarioEmail.libroVenta}">
          <br>
          <br>
          <br>
          <div>
            <h2>${lista_deseos.nombre}</h2>
            <p>${lista_deseos.genero.nombreGenero}</p>
            <div>${lista_deseos.precio}</div>
            <div>
              <form action="/lista_deseos/quitarLibro/${lista_deseos.id}" method="post">
                <button type="submit">quitar libro </button>
              </form>
              <a href="/orden/confirmar/${lista_deseos.id}">comprar ahora</a>
            </div>

          </div>
        </c:forEach>
      </div>
    </div>
</body>

</html>
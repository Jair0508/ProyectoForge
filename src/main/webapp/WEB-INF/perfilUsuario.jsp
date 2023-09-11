<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/baseStyles.css">
  <link rel="stylesheet" href="/css/tablaStyle.css">
  <title>Document</title>
</head>

<body>
  <%@ include file="nav.jsp" %>

  <div class="main-content">
    <h1>${usuario.name}</h1>
    <form action="/usuario/editar/${usuario.id}" method="post">
      <label>cambiar nombre:</label>
      <input name="nombre" type="text">
      <button class="button" type="submit">enviar</button>
    </form>

    <div class="tables-container">
      <table class="tables">
        <caption>
          <h2>tabla ordenes de compra:</h2>
        </caption>
        <thead>
          <tr>
            <th>detalle</th>
            <th>creado</th>
            <th>producto</th>
            <th>Accion</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="ordenes" items="${listOrdenes}">
            <tr>
              <td>
                <c:out value="${ordenes.createdAt}" />
              </td>
              <td>
                <c:out value="${ordenes.direccion}, ${ordenes.departamento} / ${ordenes.municipio}" />
              </td>
              <td>
                <c:out value="${ordenes.libroVenta.nombre}" />
              </td>
              <td>

                <input type="hidden" name="_method" value="delete" />
                <input class="button" type="submit" value="cancelar" />
                </form>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      
      <table class="tables">
        <caption>
          <h2>tabla libros publicados por ${usuario.name}</h2>
        </caption>
        <thead>
          <tr>
            <th>libro</th>
            <th>descripcion</th>
            <th>creado</th>
            <th>Accion</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="libro" items="${usuario.librosIntercambio}">
            <tr>
              <td>
                <c:out value="${libro.nombre}" />
              </td>
              <td>
                <c:out value="${libro.descripcion}" />
            </td>
            <td>
              <c:out value="${libro.createdAt}" />
            </td>
            <td>
              <a class="button" href="/intercambios/${libro.id}/editar">Editar</a>
              <form action="/orden/cancelar/${ordenes.id}" method="post">
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>

  </div>

</body>

</html>
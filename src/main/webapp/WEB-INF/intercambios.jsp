<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Intercambios</title>
      <link rel="stylesheet" href="/css/baseStyles.css">
      <link rel="stylesheet" href="/css/tablaStyle.css">
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>

    <body>
      <%@ include file="nav.jsp" %>
      <div id="table-trade" class="tables-container">
        <table>
          <caption>
            <h2>Libros Publicados:</h2>
          </caption>
          <thead>
            <tr>
              <th>Titulo</th>
              <th>Usuario</th>
              <th>Detalles</th>
              <th>Accion</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="libro" items="${listalibros}">
              <tr>
                <td>
                  <c:out value="${libro.nombre}" />
                </td>
                <td>
                  <a class="button" href=""><c:out value="${libro.usuario.name}" /></a>
                </td>
                <td>
                  <c:out value="${libro.detallesExtras}" />
                </td>
                <td>
                  <c:if test="${usuarioEmail.id >= 2}">
                  <a class="button" href="">Contactar</a>
                </c:if>
                <c:if test="${usuarioEmail.id == 1}">
                    <p class="errors">Solo puede observar la tabla</p>
                </c:if>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
      <%@ include file="footer.jsp" %>
    </body>

    </html>
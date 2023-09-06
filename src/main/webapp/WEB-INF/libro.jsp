<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Libro - ${libro.nombre}</title>
      <link rel="stylesheet" href="/css/baseStyles.css">
      <link rel="stylesheet" href="/css/indexStyle.css">
      <link rel="stylesheet" href="/css/bookStyle.css">
    </head>

    <body>
      <%@ include file="nav.jsp" %>

        <div class="book-container">
          <div>
            <h1>${libro.nombre}</h1>
            <div>
              <span>Genero:</span>
              <p>${libro.genero.nombreGenero}</p>
            </div>
            <div>
              <span>Autor:</span>
              <p>${libro.autor.nombre}</p>
            </div>
            <div>
              <span>Descripción:</span>
              <p>${libro.descripcion}</p>
            </div>
          </div>
          <div>
            <h2>$ ${libro.precio}</h2>
            <div>
              <span>Stock disponible:</span>
              <p>${libro.cantidad}</p>
            </div>

            <div>
              <c:if test="${not empty usuarioEmail}">
                <a class="button" href="/orden/confirmar/${libro.id}">comprar ahora</a>
                <form action="/lista_deseos/anexar_libro/${libro.id}" method="post">
                  <button class="button" type="submit">agregar a lista de deseos </button>
                </form>
              </c:if>
              <c:if test="${usuarioEmail == null}">
                <a onclick="mostrarAlert()" href="">comprar ahora</a>
                <form action="">
                  <button class="button" onclick="mostrarAlert()">agregar a lista de deseos </button>
                </form>
              </c:if>

            </div>
          </div>
        </div>

        <script src="/javaScript/alerts.js"></script>
        <%@ include file="footer.jsp" %>
    </body>

    </html>
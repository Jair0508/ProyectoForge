<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Libro - ${libro.nombre}</title>
      <link rel="stylesheet" href="/css/baseStyles.css">
      <link rel="stylesheet" href="/css/bookStyle.css">
    </head>

    <body>
      <%@ include file="nav.jsp" %>

        <div class="book-container">
          <div class="block-side">
            <h1>${libro.nombre}</h1>
            <span>Descripción:</span>
            <p>${libro.descripcion}</p>
          </div>
          <div class="main-side">
            <p>
              <span>Genero:</span> <br>              
              ${libro.genero.nombreGenero}
            </p>
            <p>
              <span>Autor:</span> <br>
              ${libro.autor.nombre}
            </p>
            <p>
              <span>Stock disponible:</span> <br>
              ${libro.cantidad}
            </p>
            <p>
              <span>Precio de Libro:</span> <br>
              $ ${libro.precio}
            </p>
          </div>
        </div>

        <div class="buttons-container">
          <c:if test="${usuarioEmail.id >= 2}">
            <a class="button" href="javascript:void(0);" onclick="confirmarCompra(${libro.id})">
              Comprar Ahora
            </a>
            <form action="/lista_deseos/anexar_libro/${libro.id}" method="post">
              <button class="button" type="submit">Agregar a Lista de Deseos</button>
            </form>
          </c:if>
          
          <c:if test="${usuarioEmail == null}">
            <button class="button" onclick="mostrarAlert()">Agregar a Lista de Deseos </button>
          </c:if>

          <c:if test="${usuarioEmail.id == 1}">
            <div>
              <a class="button" href="/usuario/administrador">Administrar</a>
            </div>
          </c:if>
        </div>

        <!-- Este es el error que debe tener condicional -->
        <br>
        <p class="errors">
          <c:out value="${agragadoInvalido}" />
        </p>

        <%@ include file="footer.jsp" %>

        
          <script src="/javaScript/alerts.js"></script>
          <script>
            function confirmarCompra(libroId) {
              var confirmacion = confirm("¿Seguro que quieres comprar este producto?");
              if (confirmacion) {
                // Redireccionar al enlace de compra con el ID del libro
                window.location.href = "/orden/compra/" + libroId;
              }
            }
          </script>
    </body>

    </html>
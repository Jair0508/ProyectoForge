<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Libros de
    <c:out value="${autor.nombre}" />
  </title>
  <link rel="stylesheet" href="/css/baseStyles.css">
  <link rel="stylesheet" href="/css/indexStyle.css">
  <link rel="stylesheet" href="/css/paginacionStyle.css">
</head>

<body>

  <%@ include file="nav.jsp" %>

  <div class="main-content">
    <div id="middle-title">
      <svg class="son-toMiddle" fill="#6fa2dd" width="50" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 964.07 964.07" xml:space="preserve"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g> <path d="M850.662,877.56c-0.77,0.137-4.372,0.782-10.226,1.831c-230.868,41.379-273.337,48.484-278.103,49.037 c-11.37,1.319-19.864,0.651-25.976-2.042c-3.818-1.682-5.886-3.724-6.438-4.623c0.268-1.597,2.299-5.405,3.539-7.73 c1.207-2.263,2.574-4.826,3.772-7.558c7.945-18.13,2.386-36.521-14.51-47.999c-12.599-8.557-29.304-12.03-49.666-10.325 c-12.155,1.019-225.218,36.738-342.253,56.437l-57.445,45.175c133.968-22.612,389.193-65.433,402.622-66.735 c11.996-1.007,21.355,0.517,27.074,4.4c3.321,2.257,2.994,3.003,2.12,4.997c-0.656,1.497-1.599,3.264-2.596,5.135 c-3.835,7.189-9.087,17.034-7.348,29.229c1.907,13.374,11.753,24.901,27.014,31.626c8.58,3.78,18.427,5.654,29.846,5.654 c4.508,0,9.261-0.292,14.276-0.874c9.183-1.065,103.471-17.67,280.244-49.354c5.821-1.043,9.403-1.686,10.169-1.821 c9.516-1.688,15.861-10.772,14.172-20.289S860.183,875.87,850.662,877.56z"></path> <path d="M231.14,707.501L82.479,863.005c-16.373,17.127-27.906,38.294-33.419,61.338l211.087-166.001 c66.081,29.303,118.866,38.637,159.32,38.637c71.073,0,104.065-28.826,104.065-28.826c-66.164-34.43-75.592-98.686-75.592-98.686 c50.675,21.424,156.235,46.678,156.235,46.678c140.186-93.563,213.45-296.138,213.45-296.138 c-14.515,3.99-28.395,5.652-41.475,5.652c-65.795,0-111-42.13-111-42.13l183.144-39.885C909.186,218.71,915.01,0,915.01,0 L358.176,495.258C295.116,551.344,250.776,625.424,231.14,707.501z"></path> </g> </g></svg>
      <h3 class="son-toMiddle"><c:out value="${autor.nombre}" /></h3>
    </div>
    <div class="autor-info">
      <h4>Biografia: </h4>
      <p> <c:out value="${autor.descripcion}"/></p>
    </div>
    <div class="cards-container">
      <c:forEach items="${paginaLibrosPorAutor.content}" var="libro">
        <div class="book-card">
          <svg viewBox="0 0 24 24" width="120" fill="none" xmlns="http://www.w3.org/2000/svg">
            <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
            <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
            <g id="SVGRepo_iconCarrier">
              <path
                d="M7.42598 18H20C19.9965 18.9296 19.9784 19.6228 19.8866 20.1706C19.7773 20.8228 19.5774 21.1682 19.2709 21.4142C18.9643 21.6602 18.5339 21.8206 17.7211 21.9083C16.8844 21.9986 15.7754 22 14.1854 22H9.75461C8.1646 22 7.05566 21.9986 6.21896 21.9083C5.40616 21.8206 4.97573 21.6602 4.66916 21.4142C4.36259 21.1682 4.16271 20.8228 4.05343 20.1706C4.04522 20.1216 4.03761 20.0714 4.03053 20.02C3.99045 19.7288 3.97041 19.5831 4.09696 19.2397C4.22351 18.8964 4.27837 18.8425 4.38811 18.7347C4.71351 18.4151 5.15982 18.1785 5.67321 18.0681C5.96352 18.0057 6.34236 18 7.42598 18Z"
                fill="#6fa2dd"></path>
              <path opacity="0.5"
                d="M4.72718 2.73332C5.03258 2.42535 5.46135 2.22456 6.27103 2.11478C7.10452 2.00177 8.2092 2 9.7931 2H14.2069C15.7908 2 16.8955 2.00177 17.729 2.11478C18.5387 2.22456 18.9674 2.42535 19.2728 2.73332C19.5782 3.0413 19.7773 3.47368 19.8862 4.2902C19.9982 5.13073 20 6.24474 20 7.84202L20 18H7.42598C6.34236 18 5.96352 18.0057 5.67321 18.0681C5.15982 18.1785 4.71351 18.4151 4.38811 18.7347C4.27837 18.8425 4.22351 18.8964 4.09696 19.2397C4.02435 19.4367 4 19.5687 4 19.7003V7.84202C4 6.24474 4.00176 5.13073 4.11382 4.2902C4.22268 3.47368 4.42179 3.0413 4.72718 2.73332Z"
                fill="#6fa2dd"></path>
              <path
                d="M7.25 7C7.25 6.58579 7.58579 6.25 8 6.25H16C16.4142 6.25 16.75 6.58579 16.75 7C16.75 7.41421 16.4142 7.75 16 7.75H8C7.58579 7.75 7.25 7.41421 7.25 7Z"
                fill="#6fa2dd"></path>
              <path
                d="M8 9.75C7.58579 9.75 7.25 10.0858 7.25 10.5C7.25 10.9142 7.58579 11.25 8 11.25H13C13.4142 11.25 13.75 10.9142 13.75 10.5C13.75 10.0858 13.4142 9.75 13 9.75H8Z"
                fill="#6fa2dd"></path>
            </g>
          </svg>
          <div>
            <h3>
              <a href="/libros/${libro.id}/libro">
                <c:out value="${libro.nombre}" />
              </a>
            </h3>
            <h4>Genero:</h4>
            <p>
              <c:out value="${libro.genero.nombreGenero}" />
            </p>
            <h4>Autor:</h4>
            <p>
              <c:out value="${libro.autor.nombre}" />
            </p>
            <c:if test="${usuarioEmail.id >= 2}">
              <form action="/lista_deseos/anexar_libro/${libro.id}" method="post">
                <button type="submit">agregar a lista de deseos </button>
              </form>
              <p class="errors">
                <c:out value="${agragadoInvalido}" />
              </p>
            </c:if>
            <c:if test="${usuarioEmail == null}">
              <button onclick="mostrarAlert()">agregar a lista de deseos </button>
            </c:if>
            <c:if test="${usuarioEmail.id == 1}">
              <div>
                <a class="button" href="/usuario/administrador">Administrar</a>
              </div>
            </c:if>
            <c:out value="${realizado}" />
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
  <div class="pagination">
    <c:choose>
      <c:when test="${paginaLibrosPorAutor.totalPages > 1}">
        <c:if test="${paginaLibrosPorAutor.number > 0}">
          <a class="prev" href="/autores/${autor.id}/libros?page=${paginaLibrosPorAutor.number - 1}">&#8249;
            Anterior</a>
        </c:if>

        <c:forEach begin="1" end="${paginaLibrosPorAutor.totalPages}" var="i">
          <c:choose>
            <c:when test="${i == paginaLibrosPorAutor.number + 1}">
              <a class="active" href="#">${i}</a>
            </c:when>
            <c:otherwise>
              <a href="/autores/${autor.id}/libros?page=${i - 1}">${i}</a>
            </c:otherwise>
          </c:choose>
        </c:forEach>

        <c:if test="${paginaLibrosPorAutor.number < paginaLibrosPorAutor.totalPages - 1}">
          <a class="next" href="/autores/${autor.id}/libros?page=${paginaLibrosPorAutor.number + 1}">Siguiente
            &#8250;</a>
        </c:if>
      </c:when>
    </c:choose>
  </div>

  <%@ include file="footer.jsp" %>

  <script src="/javaScript/alerts.js"></script>
</body>

</html>
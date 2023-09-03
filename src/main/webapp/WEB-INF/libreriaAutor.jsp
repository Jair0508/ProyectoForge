<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Libros del autor
                <c:out value="${autor.nombre}" />
            </title>
            <link rel="stylesheet" href="/css/baseStyles.css">
            <link rel="stylesheet" href="/css/indexStyle.css">
            <link rel="stylesheet" href="/css/paginacionStyle.css">
        </head>

        <body>

            <%@ include file="nav.jsp" %>

                <div class="main-content">
                    <h3 id="middle-title">LO NUEVO EN NUESTRA <span>LIBRERIA</span></h3>
                    <div class="cards-container">
                        <c:forEach items="${paginaLibrosPorAutor.content}" var="libro" begin="0" end="4">
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
                                        <a href="">
                                            <c:out value="${libro.genero.nombreGenero}" />
                                        </a>
                                    </p>
                                    <h4>Autor:</h4>
                                    <p>
                                        <a href="">
                                            <c:out value="${libro.autor.nombre}" />
                                        </a>
                                    </p>
                                    <c:if test="${usuarioEmail.id >= 2}">
                                        <form action="/lista_deseos/anexar_libro/${libro.id}" method="post">
                                            <button type="submit">agregar a lista de deseos </button>
                                        </form>
                                    </c:if>
                                    <c:if test="${usuarioEmail == null}">
                                        <button onclick="mostrarAlert()">agregar a lista de deseos </button>
                                    </c:if>
                                    <c:if test="${usuarioEmail.id == 1}">
                                        <div>
                                            <a href="/libros/${libro.id}/editar">Editar</a>
                                            <a href="/libros/${libro.id}/borrar">Borrar</a>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="pagination">
                    <c:choose>
                        <c:when test="${paginaLibrosPorAutor.totalPages > 1}">
                            <c:forEach begin="1" end="${paginaLibrosPorAutor.totalPages}" var="i">
                                <c:choose>
                                    <c:when test="${i == paginaLibrosPorAutor.number + 1}">
                                        <span>${i}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/autores/${autor.id}/libros?page=${i - 1}">${i}</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                </div>
                <div>
                    <%@ include file="footer.jsp" %>
                </div>
                <script src="/javaScript/alerts.js"></script>
        </body>

        </html>
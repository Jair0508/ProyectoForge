<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Generos</title>
            <link rel="stylesheet" href="/css/baseStyles.css">
            <link rel="stylesheet" href="/css/indexStyle.css">
            <link rel="stylesheet" href="/css/paginacionStyle.css">
        </head>

        <body>

            <%@ include file="nav.jsp" %>

                <div class="main-content">
                    <h3 id="middle-title">LO NUEVO EN NUESTRA <span>LIBRERIA</span></h3>
                    <div class="cards-container">
                        <c:forEach var="autor" items="${paginaAutor.content}" begin="0" end="3">
                            <div>
                                <a href="/autores/${autor.id}/libros?page=0">${autor.nombre}</a>
                            </div>

                        </c:forEach>
                    </div>
                </div>
                <div class="pagination">
                    <c:forEach begin="1" end="${totalPages}" var="index">
                        <a href="/autores/${index}">${index}</a>
                    </c:forEach>
                </div>
                <div>
                    <%@ include file="footer.jsp" %>
                </div>
                <script src="/javaScript/alerts.js"></script>
        </body>

        </html>
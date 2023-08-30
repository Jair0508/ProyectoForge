<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>libros</title>
</head>
<body>
    <h1>Libros</h1>
    <table>
        <thead>
            <tr>
                <th>Nombre</th>
                <th>descripcion</th>
                <th>Autor</th>
                <th>Genero</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${libroPage.content}" var="libro">
                <tr>
                    <td>${libro.nombre}</td>
                    <td>${libro.descripcion}</td>
                    <td>${libro.autor.nombre}</td>
                    <td>${libro.genero.nombre}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="pagination">
        <c:if test="${libroPage.totalPages > 1}">
            <c:forEach begin="0" end="${libroPage.totalPages - 1}" varStatus="i">
                <c:url value="/libros" var="pageUrl">
                    <c:param name="page" value="${i.index}" />
                </c:url>
                <a href="${pageUrl}">${i.index + 1}</a>
            </c:forEach>
        </c:if>
    </div>
</body>
</html>
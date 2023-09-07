<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>

    <body>
        <c:forEach var="ordenes" items="${listOrdenes}">
            <div>
                <p>${ordenes.detalle_De_orden}</p>
            </div>
        </c:forEach>
    </body>

    </html>
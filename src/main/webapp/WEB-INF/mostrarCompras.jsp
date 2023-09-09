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
    <link rel="stylesheet" href="css/styleCompras.css">
</head>

<body>
    <div>
        <%@ include file="nav.jsp" %>
    </div>
    <div id="contenedor">
        <img src="/imagenes/lector.png" alt="Lector">
        <h1>
            <c:out value="${usuarioEmail.name}" />
        </h1>
    </div>
    <%@ include file="footer.jsp" %>
</body>

</html>
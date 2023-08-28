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
    <link rel="stylesheet" href="/css/baseStyles.css">
    <link rel="stylesheet" href="/css/styleListaDeseo.css">
</head>

<body>
    <%@ include file="nav.jsp" %>

    <div id="contenedor">
        <img id="imgListDeseos" src="/imagenes/alumno.png" alt="Lector">
        <h1>
          <c:out value="${usuarioEmail.name}" />
        </h1>
    </div>
</body>

</html>
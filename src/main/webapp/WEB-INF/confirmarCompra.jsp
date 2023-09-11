<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/baseStyles.css">
    <link rel="stylesheet" href="/css/indexStyle.css">
    <title>Confirmar Compra</title>
</head>

<body>
  <%@ include file="nav.jsp" %>

  <h1>¿Seguro que quieres comprar este producto?</h1>
  <h3>${libro.nombre}</h3>
  <div>
    <a href="/orden/compra/${libro.id}">Si</a>
    <a href="/principal">No</a>
  </div>
  
  <%@ include file="footer.jsp" %>
</body>

</html>
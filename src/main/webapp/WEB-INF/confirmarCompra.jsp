<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/baseStyles.css">
    <link rel="stylesheet" href="/css/indexStyle.css">
    <title>Document</title>
</head>

<body>

  <%@ include file="nav.jsp" %>

    <h1>¿seguro que quieres comprar este producto? ${libro.nombre}</h1>
    <div>
        <a href="/orden/compra/${libro.id}">Si</a>
        <a href="/principal">No</a>
    </div>
  <%@ include file="footer.jsp" %>
</body>

</html>
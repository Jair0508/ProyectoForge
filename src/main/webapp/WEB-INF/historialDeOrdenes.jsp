<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <h2>${ordenes.libro.nombre}</h2>
                <p>genero: ${ordenes.libro.genero.nombre} autor: ${ordenes.libro.autor.nombre}</p>
                <p>precio: ${ordenes.libro.precio}</p>
                <label for="">domicilio :</label>
                <p>nombre: ${ordenes.nombre}, ubicacion: ${ordenes.departamento}/ ${ordenes.municipio}
                    /${ordenes.direccion}, detalles del lugar: ${ordenes.detalle}</p>
            </div>
        </c:forEach>
    </body>

    </html>
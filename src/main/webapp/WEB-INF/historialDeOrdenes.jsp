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
                <h2>${ordenes.libroVenta.nombre}</h2>
                <p>Genero: ${ordenes.libroVenta.genero.nombreGenero}</p>
                <p>Autor: ${ordenes.libroVenta.autor.nombre}</p>
                <p>cantidad: ${ordenes.cantidad}</p>
                <p>direccion: ${ordenes.departamento}/${ordenes.municipio}, ${ordenes.direccion}</p>
                <p>precio total: ${ordenes.precioTotal}</p>
                <div>
                    <form action="/orden/cancelar/${ordenes.id}" method="post">
                        <input type="hidden" name="_method" value="delete" />
                        <input type="submit" value="Delete" />
                    </form>
                </div>
            </div>
        </c:forEach>
    </body>

    </html>
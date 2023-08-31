<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>

    <body>
        <form:form action="" method="post" modelAttribute="detalleOrden">
            <p>
                <form:label path="nombre">Nombre</form:label>
                <form:input type="text" path="nombre" />
                <form:errors path="nombre" />
            </p>
            <p>
                <form:label path="departamento">departamento</form:label>
                <form:input type="text" path="departamento" />
                <form:errors path="departamento" />
            </p>
            <p>
                <form:label path="municipio">municipio</form:label>
                <form:input type="text" path="municipio" />
                <form:errors path="municipio" />
            </p>
            <p>
                <form:label path="direccion">direccion</form:label>
                <form:input type="text" path="direccion" />
                <form:errors path="direccion" />
            </p>
            <p>
                <form:label path="detalle">detalle</form:label>
                <form:input type="text" path="detalle" />
                <form:errors path="detalle" />
            </p>

            <div>
                <button type="submit">Anexar</button>
                <a href="/principal">cancelar</a>
            </div>
        </form:form>
    </body>

    </html>
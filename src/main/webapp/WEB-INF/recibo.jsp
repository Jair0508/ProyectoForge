<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recivo</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
        }

        .recibo {
            max-width: 400px;
            margin: 0 auto;
            border: 2px solid #333;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .titulo {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        .info-cliente {
            font-size: 18px;
            margin-bottom: 15px;
        }

        .detalle {
            font-size: 16px;
            margin-bottom: 10px;
        }

        .total {
            font-size: 20px;
            font-weight: bold;
            text-align: right;
            margin-top: 20px;
        }
    </style>
</head>

<body>
    <div>
        <%@ include file="nav.jsp" %>

    </div>
    <br>
    <br>
    <div class="recibo">
        <div class="titulo">Recibo de Compra</div>
        <div class="info-cliente">
            <p><strong>Nombre del Cliente:</strong> ${orden.usuario.name}</p>
            <p><strong>Departamento:</strong> ${orden.departamento}</p>
            <p><strong>Municipio:</strong> ${orden.municipio}</p>
            <p><strong>Dirección:</strong> ${orden.direccion}</p>
        </div>
        <hr>
        <div class="detalle">
            <p><strong>Título del Libro:</strong> ${orden.libroVenta.nombre}</p>
            <p><strong>Cantidad:</strong> ${orden.cantidad}</p>
            <p><strong>Precio Unitario:</strong> $${orden.precioUnitario}</p>
            <p><strong>Precio Total:</strong> $${orden.precioTotal}</p>
        </div>
        <hr>
        <div class="total">
            <p><strong>Total a Pagar:</strong> $${orden.precioTotal}</p>
        </div>
    </div>
    <div>
        <a href="/principal">regresar</a>
        <a href="javascript:window.print();">Imprimir</a>
    </div>
</body>

</html>
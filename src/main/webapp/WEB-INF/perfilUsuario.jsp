<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
            </head>

            <body>
                <div>
                    <%@ include file="nav.jsp" %>
                </div>

                <div>
                    <h1>${usuario.name}</h1>
                    <form action="/usuario/editar/${usuario.id}" method="post">
                        <label>cambiar nombre:</label>
                        <input name="nombre" type="text">
                        <button type="submit">enviar</button>
                    </form>

                    <div>
                        <table>
                            <caption>
                                <h2>tabla ordenes de compra:</h2>
                            </caption>
                            <thead>
                                <tr>
                                    <th>detalle</th>
                                    <th>creado</th>
                                    <th>producto</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="ordenes" items="${listOrdenes}">
                                    <tr>
                                        <td>
                                            <c:out value="${ordenes.createdAt}" />
                                        </td>
                                        <td>
                                            <c:out
                                                value="${ordenes.direccion}, ${ordenes.departamento} / ${ordenes.municipio}" />
                                        </td>
                                        <td>
                                            <c:out value="${ordenes.libroVenta.nombre}" />
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <div>
                        <table>
                            <caption>
                                <h2>tabla libros publicados por ${usuario.name}</h2>
                            </caption>
                            <thead>
                                <tr>
                                    <th>libro</th>
                                    <th>descripcion</th>
                                    <th>creado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="libro" items="${usuario.librosIntercambio}">
                                    <tr>
                                        <td>
                                            <c:out value="${libro.nombre}" />
                                        </td>
                                        <td>
                                            <c:out value="${libro.descripcion}" />
                                        </td>
                                        <td>
                                            <c:out value="${libro.createdAt}" />
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

            </body>

            </html>
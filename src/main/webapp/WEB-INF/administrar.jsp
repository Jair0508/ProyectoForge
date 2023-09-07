<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Usuario</title>
        </head>

        <body>
            <h1>Panel de administracion</h1>
            <div>
                <h4>Lista Libros:</h4>
                <table>
                    <thead>
                        <tr>
                            <th>Titulo</th>
                            <th>Precio</th>
                            <th>Cantidad</th>
                            <th>Accion</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="libro" items="${listaLibro}">
                            <tr>
                                <td>
                                    <c:out value="${libro.nombre}" />
                                </td>
                                <td>
                                    <c:out value="${libro.precio}" />
                                </td>
                                <td>
                                    <c:out value="${libro.cantidad}" />
                                </td>
                                <td>
                                    <c:if test="${libro.autor != null && libro.genero != null}">
                                        <a href="/libros/${libro.id}/editar">Editar Libro</a>
                                    </c:if>
                                    <c:if test="${libro.autor == null}">
                                        <p> Su Libro no dispone de autor
                                            <a href="/libros/lista/autores-generos">Agregar Autor</a>
                                        </p>
                                    </c:if>
                                    <c:if test="${libro.genero == null}">
                                        <p> Su Libro no dispone de genero
                                            <a href="/libros/lista/autores-generos">Agregar genero</a>
                                        </p>
                                    </c:if>
                                </td>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div>
                <h4>Lista Usuarios:</h4>
                <table>
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Email</th>
                            <th>fecha de Registro</th>
                            <th>Accion</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="usuario" items="${listaUsuario}">
                            <tr>
                                <td>
                                    <c:out value="${usuario.name}" />
                                </td>
                                <td>
                                    <c:out value="${usuario.email}" />
                                </td>
                                <td>
                                    <c:out value="${usuario.createdAt}" />
                                </td>
                                <td>
                                    <a href="">Ver</a>
                                </td>
                        </c:forEach>
                    </tbody>
            </div>
        </body>

        </html>
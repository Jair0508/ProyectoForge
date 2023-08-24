<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Registro - Libros</title>
                <link rel="stylesheet" href="/css/styleRegistro.css">
            </head>

            <body>
                <div>
                    <%@ include file="nav.jsp" %>
                </div>
                <div id="formularioLibros" class="border border-5">
                    <h1 class="text-center mb-2 bg-success">Anexar Libros</h1>
                    <div class="container text-center">
                        <div class="d-flex justify-content-center">
                            <form:form action="/libros/anexar/libro" method="post" modelAttribute="formLibro">
                                <p>
                                    <form:label path="nombreLibro">Nombre Libro</form:label>
                                    <form:input type="text" path="nombreLibro" class="form-control"
                                        placeholder="Ingrese el nombre del libro" />
                                <div id="errors" class="container mt-2 text-center bg-danger text-warning">
                                    <form:errors path="nombreLibro" />
                                </div>
                                </p>
                                <p>
                                    <form:label path="descripcionLibro">Descripcion</form:label>
                                    <form:textarea type="text" path="descripcionLibro"
                                        placeholder="Ingrese la descripcion del libro" class="form-control" />
                                <div id="errors" class="container mt-2 text-center bg-danger text-warning">
                                    <form:errors path="descripcionLibro" />
                                </div>
                                </p>
                                <p>
                                    <form:label path="precioLibro">Precio</form:label>
                                    <form:input type="text" path="precioLibro" class="form-control"
                                        placeholder="Ingrese el precio del libro" />
                                <div id="errors" class="container mt-2 text-center bg-danger text-warning">
                                    <form:errors path="precioLibro" />
                                </div>
                                </p>
                                <p>
                                    <form:label path="cantidadLibro">cantidad</form:label>
                                    <form:input type="text" class="form-control" path="cantidadLibro"
                                        placeholder="Stock disponible del libro" />
                                <div id="errors" class="container mt-2 text-center bg-danger text-warning">
                                    <form:errors path="cantidadLibro" />
                                </div>
                                </p>
                                <p>
                                    <form:label path="nombreGenero">Genero</form:label>
                                    <form:input type="text" path="nombreGenero" class="form-control"
                                        placeholder="Ingrese Genero del libro" />
                                <div id="errors" class="container mt-2 text-center bg-danger text-warning">
                                    <form:errors path="nombreGenero" />
                                </div>
                                </p>
                                <p>
                                    <form:label path="nombreAutor">Nombre Autor</form:label>
                                    <form:input type="text" path="nombreAutor" class="form-control"
                                        placeholder="Ingrese el nombre de el autor" />
                                <div id="errors" class="container mt-2 text-center bg-danger text-warning">
                                    <form:errors path="nombreAutor" />
                                </div>
                                </p>
                                <p>
                                    <form:label path="descripcionAutor">Biografia</form:label>
                                    <form:textarea type="text" path="descripcionAutor"
                                        placeholder="Ingrese la biografia de el autor" class="form-control" />
                                <div id="errors" class="container mt-2 text-center bg-danger text-warning">
                                    <form:errors path="descripcionAutor" />
                                </div>
                                </p>
                                <p>
                                    <form:label path="fraseAutor">Frase Celebre</form:label>
                                    <form:textarea type="text" path="fraseAutor"
                                        placeholder="Ingrese una frase de el autor" class="form-control" />
                                <div id="errors" class="container mt-2 text-center bg-danger text-warning">
                                    <form:errors path="fraseAutor" />
                                </div>
                                </p>
                                <div class="d-flex justify-content-around mt-4 mb-2">
                                    <a href="" class="badge text-success p-3">Regresar</a>
                                    <button class="btn btn-success p-2" type="submit">Anexar</button>
                                </div>
                                <p class="container mt-2 text-center bg-success text-warning">
                                    <c:out value="${realizado}" />
                                </p>
                            </form:form>
                        </div>
                    </div>
                </div>
            </body>

            </html>
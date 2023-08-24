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
                            <form:form action="/libros/anexar/libro" method="post" modelAttribute="libro">
                                <p>
                                    <form:label path="nombre">Nombre</form:label>
                                    <form:input type="text" path="nombre" class="form-control" placeholder="Ingrese el nombre del libro"/>
                                </p>
                                <p>
                                    <form:label path="descripcion">Descripcion</form:label>
                                    <form:textarea type="text" path="descripcion" placeholder="Ingrese la descripcion del libro" class="form-control"/>
                                </p>
                                <p>
                                    <form:label path="precio">Precio</form:label>
                                    <form:input type="text" path="precio" class="form-control" placeholder="Ingrese el precio del libro" />
                                </p>
                                <p>
                                    <form:label path="cantidad">cantidad</form:label>
                                    <form:input type="text" class="form-control" path="cantidad" placeholder="Stock disponible del libro"/>
                                </p>
                                <p>
                                    <form:label path="genero.nombre">Genero</form:label>
                                    <form:input type="text" path="genero.nombre" class="form-control" placeholder="Ingrese Genero del libro"/>
                                </p>
                                <p>Autor:
                                    <form:select class="form-control text-center"  path="autor">
                                        <form:option  value="" label="--Seleccione--" />
                                        <c:forEach items="${listAutor}" var="autor">
                                            <form:option value="${autor}" label="${autor.nombre}" />
                                        </c:forEach>
                                    </form:select>
                                </p>
                                <div class="d-flex justify-content-around mt-4 mb-2">
                                    <a href="" class="badge text-success p-3">Regresar</a>
                                    <button class="btn btn-success p-2" type="submit">Anexar</button>
                                </div>
                                <p id="errors" class="container mt-2 text-center bg-danger text-warning">
                                    <form:errors path="libro.*" />
                                </p>
                                <p class="container mt-2 text-center bg-success text-warning">
                                    <c:out value="${realizadoLibro}" />
                                </p>
                            </form:form>
                        </div>
                    </div>
                </div>
                <div class="border border-5">
                    <h1 class="text-center mb-2 bg-success">Anexar Autor</h1>
                    <div class="container text-center">
                        <div class="d-flex justify-content-center">
                            <form:form action="/libros/anexar/autor" method="post" modelAttribute="autor">
                                <p>
                                    <form:label path="nombre">Nombre</form:label>
                                    <form:input type="text" path="nombre" class="form-control" placeholder="Ingrese el nombre de el autor"/>
                                </p>
                                <p>
                                    <form:label path="descripcion">Descripcion</form:label>
                                    <form:textarea type="text" path="descripcion" placeholder="Ingrese la descripcion de el autor" class="form-control"/>
                                </p>
                                <p>
                                    <form:label path="frase">Frase</form:label>
                                    <form:input type="text" path="frase" class="form-control" placeholder="Ingrese alguna frase celebre"/>
                                </p>
                                <div class="d-flex justify-content-around mt-4 mb-2">
                                    <a href="" class="badge text-success p-3">Regresar</a>
                                    <button class="btn btn-success p-2" type="submit">Anexar</button>
                                </div>
                                <p id="errors" class="container mt-2 text-center bg-danger text-warning">
                                    <form:errors path="autor.*" />
                                </p>
                                <p class="container mt-2 text-center bg-success text-warning">
                                    <c:out value="${realizadoAutor}" />
                                </p>
                            </form:form>
                        </div>
                    </div>
                </div>
            </body>

            </html>
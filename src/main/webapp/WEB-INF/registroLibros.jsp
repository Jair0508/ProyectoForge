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
                <div id="formularioLibros">
                    <h4>Agregar Libro</h4>
                    <form:form action="/libros/anexar" method="post" modelAttribute="libro">
                        <p>
                            <form:label path="nombre">Nombre</form:label>
                            <form:input type="text" path="nombre" placeholder="Ingrese nombre del libro" />
                            <form:errors path="nombre" />
                        </p>
                        <p>
                            <form:label path="descripcion">descripcion</form:label>
                            <form:input type="text" path="descripcion" placeholder="Ingrese descripcion del libro"/>
                            <form:errors path="descripcion" />
                        </p>
                        <p>
                            <form:label path="precio">precio</form:label>
                            <form:input type="text" path="precio" placeholder="Ingrese precio del libro"/>
                            <form:errors path="precio" />
                        </p>
                        <p>
                            <form:label path="cantidad">cantidad</form:label>
                            <form:input type="text" path="cantidad" placeholder="Ingrese cantidad de libros"/>
                            <form:errors path="cantidad" />
                        </p>
                        <p>
                            <form:label path="autor">autor</form:label>
                            <form:select path="autor">
                                <form:option value="">selecione</form:option>
                                <c:forEach var="autores" items="${listaAutores}">
                                    <form:option value="${autores}">${autores.nombre}</form:option>

                                </c:forEach>
                            </form:select>
                        </p>
                        <p>
                            <form:label path="genero">genero del libro</form:label>
                            <form:select path="genero">
                                <form:option value="">selecione</form:option>
                                <c:forEach var="generos" items="${listaGeneros}">
                                    <form:option value="${generos}">${generos.nombre}</form:option>

                                </c:forEach>
                            </form:select>
                        </p>
                        <div class="mt-4 mb-2">
                            <a href="" class="badge text-success p-3">Regresar</a>
                            <button class="btn btn-success p-2" type="submit">Anexar</button>
                        </div>
                        <p class="container mt-2 text-center bg-success text-warning">
                            <c:out value="${realizado}" />
                        </p>
                    </form:form>
                    <div class="d-flex justify-content-around">
                        <div class="btn-group dropend contenedor">
                            <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown"
                                aria-expanded="false">
                                Agregar Autor
                            </button>
                            <ul class="dropdown-menu">
                                <form:form action="/libros/anexar/autor" method="post" modelAttribute="autor">
                                    <p>
                                        <form:label path="nombre">Nombre</form:label>
                                        <form:input type="text" path="nombre" placeholder="Ingrese su nombre" />
                                        <form:errors path="nombre" />
                                        <p>
                                            <c:out value="${repetidoAutor}" />
                                        </p>
                                    </p>
                                    <p>
                                        <form:label path="descripcion">Biografia</form:label>
                                        <form:input type="text" path="descripcion" placeholder="Ingrese biografia de el autor"/>
                                        <form:errors path="descripcion" />
                                    </p>
                                    <p>
                                        <form:label path="frase">Frase</form:label>
                                        <form:input type="text" path="frase" placeholder="Ingrese alguna frase de el autor"/>
                                        <form:errors path="frase" />
                                    </p>
                                    <div class="mt-4 mb-2">
                                        <a href="" class="badge text-success p-3">Regresar</a>
                                        <button class="btn btn-success p-2" type="submit">Anexar</button>
                                    </div>
                                    <p class="container mt-2 text-center bg-success text-warning">
                                        <c:out value="${realizado}" />
                                    </p>
                                    
                                </form:form>
                            </ul>
                        </div>
                        <div class="btn-group dropstart contenedor">
                            <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown"
                                aria-expanded="false">
                                Agregar Genero
                            </button>
                            <ul class="dropdown-menu">
                                <form:form action="/libros/anexar/genero" method="post" modelAttribute="genero">
                                    <p>
                                        <form:label path="nombre">Genero</form:label>
                                        <form:input type="text" path="nombre" placeholder="Ingrese genero " />
                                        <p>
                                            <c:out value="${repetidoGenero}" />
                                        </p>
                                    </p>
                                    <div class="mt-4 mb-2">
                                        <a href="" class="badge text-success p-3">Regresar</a>
                                        <button class="btn btn-success p-2" type="submit">Anexar</button>
                                    </div>
                                    <p class="container mt-2 text-center bg-success text-warning">
                                        <c:out value="${realizado}" />
                                    </p>
                                </form:form>
                            </ul>
                        </div>
                    </div>
                </div>
            </body>


            </html>
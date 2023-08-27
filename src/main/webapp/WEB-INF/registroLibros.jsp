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
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
                    crossorigin="anonymous">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
                    crossorigin="anonymous"></script>
            </head>

            <body>
                <div>

                </div>
                <form:form action="" method="post" modelAttribute="libro">
                    <p>
                        <form:label path="nombre">Nombre</form:label>
                        <form:input type="text" path="nombre" placeholder="Ingrese su nombre" />
                        <form:errors path="nombre" />
                    </p>
                    <p>
                        <form:label path="descripcion">descripcion</form:label>
                        <form:input type="text" path="descripcion" />
                        <form:errors path="descripcion" />
                    </p>
                    <p>
                        <form:label path="precio">precio</form:label>
                        <form:input type="text" path="precio" />
                        <form:errors path="precio" />
                    </p>
                    <p>
                        <form:label path="cantidad">cantidad</form:label>
                        <form:input type="text" path="cantidad" />
                        <form:errors path="cantidad" />
                    </p>
                    <p>
                        <form:label path="genero">genero del libro</form:label>
                        <form:select path="genero">
                            <form:option value="">selecione</form:option>
                            <c:forEach var="generos" items="${listaGeneros}">
                                <form:option value="${generos}">${generos.nombre}</form:option>

                            </c:forEach>
                        </form:select>
                        <form:errors path="genero" />
                    </p>
                    <p>
                        <form:label path="autor">autor</form:label>
                        <form:select path="autor">
                            <form:option value="">selecione</form:option>
                            <c:forEach var="autores" items="${listaAutores}">
                                <form:option value="${autores}">${autores.nombre}</form:option>

                            </c:forEach>
                        </form:select>
                        <form:errors path="autor" />
                    </p>
                    <div class="d-flex justify-content-around mt-4 mb-2">
                        <a href="" class="badge text-success p-3">Regresar</a>
                        <button class="btn btn-success p-2" type="submit">Anexar</button>
                    </div>
                    <p class="container mt-2 text-center bg-success text-warning">
                        <c:out value="${realizado}" />
                    </p>
                </form:form>
                <div class="btn-group dropend">
                    <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown"
                        aria-expanded="false">
                        agragar autor
                    </button>
                    <ul class="dropdown-menu">
                        <div class="border border-5">
                            <h1 class="text-center fs-6 mb-2 bg-success">Inicio Sesion</h1>
                            <div class="container text-center">
                                <div class="d-flex justify-content-center">
                                    <form action="/anexar/autor" method="post">
                                        <p class="mb-2 ">
                                            <label name="nombre">Nombre</label>
                                            <input type="text" name="nombre" class="form-control"
                                                placeholder="Ingrese Email" />
                                        </p>
                                        <br>
                                        <p class="mb-2">
                                            <label name="descripcion">descripcion</label>
                                            <textarea type="text" name="descripcion" class="form-control"></textarea>

                                        </p>
                                        <p class="mb-2">
                                            <label name="frase">frase</label>
                                            <input type="text" name="frase" class="form-control">
                                        </p>

                                        <div class="d-flex justify-content-around mt-4">
                                            <button class="btn btn-success p-2" type="submit">agregar autor</button>
                                        </div>
                                        <p id="errors" class="mt-2 bg-danger text-warning">
                                            <c:out value="${error}" />
                                        </p>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </ul>
                </div>
                <div class="btn-group dropend">
                    <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown"
                        aria-expanded="false">
                        agragar genero
                    </button>
                    <ul class="dropdown-menu">
                        <div class="border border-5">
                            <h1 class="text-center fs-6 mb-2 bg-success">crear genero</h1>
                            <div class="container text-center">
                                <div class="d-flex justify-content-center">
                                    <form action="/anexar/genero" method="post">
                                        <p class="mb-2 ">
                                            <label name="nombre">Nombre</label>
                                            <input type="text" name="nombre" class="form-control" />
                                        </p>

                                        <div class="d-flex justify-content-around mt-4">
                                            <button class="btn btn-success p-2" type="submit">agregar genero</button>
                                        </div>

                                        <p id="errors" class="mt-2 bg-danger text-warning">
                                            <c:out value="${error}" />
                                        </p>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </ul>
                </div>

            </body>


            </html>
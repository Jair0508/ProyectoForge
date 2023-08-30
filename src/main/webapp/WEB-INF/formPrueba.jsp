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
                    <form:form action="/libros/anexar" method="post" modelAttribute="libro">
                        <p>
                            <form:label path="nombre">Nombre Libro</form:label>
                            <form:input type="text" path="nombre" placeholder="Ingrese nombre del libro" />
                            <form:errors path="nombre" />
                        </p>
                        <p>
                            <form:label path="descripcion">Descripcion Libro</form:label>
                            <form:textarea type="text" path="descripcion" placeholder="Ingrese descripcion del libro" />
                            <form:errors path="descripcion" />
                        </p>
                        <p>
                            <form:label path="precio">Precio Libro</form:label>
                            <form:input type="text" path="precio" placeholder="Ingrese precio del libro"/>
                            <form:errors path="precio" />
                        </p>
                        <p>
                            <form:label path="cantidad">Cantidad Libros</form:label>
                            <form:input type="text" path="cantidad"  placeholder="Ingrese cantidad de libros"/>
                            <form:errors path="cantidad" />
                        </p>
                        <p>
                            <form:label path="autor.nombre">Nombre Autor</form:label>
                            <form:input type="text" path="autor.nombre" placeholder="Ingrese nombre de el autor" />
                            <form:errors path="autor.nombre" />
                        </p>
                        <p>
                            <form:label path="autor.descripcion">Biografia Autor</form:label>
                            <form:textarea type="text" path="autor.descripcion" placeholder="Ingrese una pequeña biografia de el autor" />
                            <form:errors path="autor.descripcion" />
                        </p>
                        <p>
                            <form:label path="autor.frase">Frase Autor</form:label>
                            <form:textarea type="text" path="autor.frase" placeholder="Ingrese alguna frase importante de el autor" />
                            <form:errors path="autor.frase" />
                        </p>
                        <p>
                            <form:label path="genero.nombre">Genero</form:label>
                            <form:input type="text" path="genero.nombre" placeholder="Ingrese genero del libro" list="genero" />
                            <datalist id="genero">
                                <c:forEach var="genero" items="${listaGeneros}">
                                <option><c:out value="${genero.nombre}" /></option>
                                </c:forEach>
                              </datalist>
                            <form:errors path="genero.nombre" /> 
                        </p>
                        <div class="mt-4 mb-2">
                            <a href="" class="badge text-success p-3">Regresar</a>
                            <button class="btn btn-success p-2" type="submit">Anexar</button>
                        </div>
                        <p class="container mt-2 text-center bg-success text-warning">
                            <c:out value="${realizado}" />
                        </p>
                    </form:form>
                </div>
            </body>


            </html>
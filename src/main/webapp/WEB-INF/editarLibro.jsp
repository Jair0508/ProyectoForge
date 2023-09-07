<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ page isErrorPage="true" %> 

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Editar Libro:
                    <c:out value="${libro.nombre}" />
                </title>
                <link rel="stylesheet" href="/css/baseStyles.css">
                <link rel="stylesheet" href="/css/formStyle.css">
            </head>

            <body>
                <%@ include file="nav.jsp" %>
                    <div class="formulario">
                        <h1 class="form-title">Editar Libro:
                            <c:out value="${libro.nombre}" />
                        </h1>
                        <form:form action="/libros/${libro.id}/editar" method="post" modelAttribute="libro">
                            <input type="hidden" name="_method" value="put">

                            <form:label class="input-label" path="nombre">Nombre</form:label>
                            <form:input class="input-content" type="text" path="nombre"
                                placeholder="Ingrese nombre del libro" />
                            <form:errors class="errors" path="nombre" />

                            <form:label class="input-label" path="descripcion">descripcion</form:label>
                            <form:textarea class="input-content" type="text" path="descripcion"
                                placeholder="Ingrese descripcion del libro" />
                            <form:errors class="errors" path="descripcion" />

                            <form:label class="input-label" path="precio">precio</form:label>
                            <form:input class="input-content" type="number" min="1" step="0.01" path="precio"
                                placeholder="Ingrese precio del libro" />
                            <form:errors path="precio" />

                            <form:label class="input-label" path="cantidad">cantidad</form:label>
                            <form:input class="input-content" type="number" min="1" path="cantidad"
                                placeholder="Ingrese cantidad de libros" />
                            <form:errors path="cantidad" />
                            <p>
                                <c:out value="${realizado}" />
                            </p>
                            <div class="buttons-container">
                                <a class="button-link" href="/usuario/administrador">Cancelar</a>
                                <button class="button-link" type="submit">Anexar</button>
                            </div>
                        </form:form>
                        <div>
                            <p>
                                <c:out value="${libro.autor.nombre}" />
                            </p>
                            <a href="/autores/${autor.id}/editar">Editar Autor</a>
                        </div>
                        <div>
                            <p>
                                <c:out value="${libro.genero.nombreGenero}" />
                            </p>
                            <a href="/generos/${genero.id}/editar">Editar Genero</a>
                        </div>
                        <a href="/libros/anexar">Agregar mas Libros</a>
                    </div>
                    <div>
                        <%@ include file="footer.jsp" %>
                    </div>
            </body>

            </html>
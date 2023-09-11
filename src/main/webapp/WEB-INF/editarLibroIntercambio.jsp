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
                    <link rel="stylesheet" href="/css/tablaStyle.css">
                </head>

                <body>
                    <%@ include file="nav.jsp" %>
                        <div class="formulario">
                            <h1 class="form-title">Editar Libro:
                                <c:out value="${libro.nombre}" />
                            </h1>
                            <form:form action="" method="post" modelAttribute="libro">
                                <input type="hidden" name="_method" value="put">

                                <form:label class="input-label" path="nombre">Nombre</form:label>
                                <form:input class="input-content" type="text" path="nombre"
                                    placeholder="Ingrese nombre del libro" />
                                <form:errors class="errors" path="nombre" />

                                <form:label class="input-label" path="descripcion">escripcion</form:label>
                                <form:textarea class="input-content" type="text" path="descripcion"
                                    placeholder="Ingrese descripcion del libro" />
                                <form:errors class="errors" path="descripcion" />

                                <form:label class="input-label" path="detallesExtras">Detalles Extras</form:label>
                                <form:input class="input-content" type="text" path="detallesExtras"
                                    placeholder="Ingrese posibles inperfectos del libro" />
                                <form:errors path="detallesExtras" />

                                <form:label class="input-label" path="autor">Autor</form:label>
                                <form:select class="input-content" path="autor">
                                    <form:option value="">Selecione</form:option>
                                    <form:option value="">Si no encuentra su Autor, Anexar en Detalles extras
                                    </form:option>
                                    <c:forEach var="autores" items="${listaAutor}">

                                        <form:option value="${autores}">${autores.nombre}</form:option>
                                    </c:forEach>
                                </form:select>
                                <form:errors path="autor" />

                                <form:label class="input-label" path="genero">Genero</form:label>
                                <form:select class="input-content" path="genero">
                                    <form:option value="">Selecione</form:option>
                                    <form:option value="">Si no encuentra su Genero, Anexar en Detalles extras
                                    </form:option>
                                    <c:forEach var="genero" items="${listaGenero}">

                                        <form:option value="${genero}">${genero.nombreGenero}</form:option>
                                    </c:forEach>
                                </form:select>
                                <form:errors path="genero" />

                                <p>
                                    <c:out value="${realizado}" />
                                </p>
                                <div class="buttons-container">
                                    <a class="button-link" href="/usuario/administrador">Cancelar</a>
                                    <button class="button-link" type="submit">Anexar</button>
                                </div>
                            </form:form>

                        </div>
                        </div>
                        <%@ include file="footer.jsp" %>
                </body>

                </html>
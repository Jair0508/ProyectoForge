<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Registro - Libros Intercambios</title>
                <link rel="stylesheet" href="/css/baseStyles.css">
                <link rel="stylesheet" href="/css/formStyle.css">
                <link rel="stylesheet" href="/css/tablaStyle.css">
            </head>

            <body>
                <%@ include file="nav.jsp" %>

                    <div class="formulario">
                        <h1 class="form-title">Agregar Libro Para Intercambio</h1>
                        <form:form action="/intercambios/libro/anexar/${usuarioEmail.id}/usuario" method="post"
                            modelAttribute="libro">

                            <form:label class="input-label" path="nombre">Nombre</form:label>
                            <form:input class="input-content" type="text" path="nombre"
                                placeholder="Ingrese nombre del libro" />
                            <form:errors class="errors" path="nombre" />

                            <form:label class="input-label" path="descripcion">Descripción</form:label>
                            <form:textarea class="input-content" type="text" path="descripcion"
                                placeholder="Ingrese descripcion del libro" />
                            <form:errors class="errors" path="descripcion" />

                            <form:label class="input-label" path="detallesExtras">Detalles Extras</form:label>
                            <form:textarea class="input-content" type="text" path="detallesExtras"
                                placeholder="Ingrese descripcion del libro" />
                            <form:errors class="errors" path="detallesExtras" />

                            <form:label class="input-label" path="autor">Autor</form:label>
                            <form:select class="input-content" path="autor">
                                <form:option value="">Selecione</form:option>
                                <form:option value="">Si no encuentra su Autor, Anexar en Detalles extras</form:option>
                                <c:forEach var="autores" items="${listaFrases}">
                                    <form:option value="${autores}">${autores.nombre}</form:option>
                                </c:forEach>
                            </form:select>
                            <form:errors path="autor" />

                            <form:label class="input-label" path="genero">Genero</form:label>
                            <form:select class="input-content" path="genero">
                                <form:option value="">Selecione</form:option>
                                <form:option value="">Si no encuentra su Genero, Anexar en Detalles extras</form:option>
                                <c:forEach var="genero" items="${listaGenero}">
                                    <form:option value="${genero}">${genero.nombreGenero}</form:option>
                                </c:forEach>
                            </form:select>
                            <form:errors path="genero" />

                            <div class="buttons-container">
                                <c:if test="${not empty realizado}">
                                    <a class="button-link" href="/intercambios/libros">Regresar</a>
                                    <p class="checked">
                                        <c:out value="${realizado}" />
                                    </p>
                                </c:if>
                                <c:if test="${empty realizado}">
                                    <a class="button-link" href="javascript:history.back()">Cancelar</a>
                                </c:if>
                                <c:if test="${usuarioEmail.id >= 2}">
                                    <button class="button-link" type="submit">Agregar</button>
                                </c:if>
                                <c:if test="${usuarioEmail.id == 1}">
                                    <p class="errors">Solo puede observar el Formulario</p>
                                </c:if>
                            </div>
                            <a class="button" href="/intercambios/libros">Lista de Intercambios</a>
                        </form:form>
                    </div>
                    <%@ include file="footer.jsp" %>
            </body>

            </html>
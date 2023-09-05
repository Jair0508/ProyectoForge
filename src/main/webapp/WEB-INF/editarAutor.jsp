<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ page isErrorPage="true" %> 

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Editar Autor:
                    <c:out value="${autor.nombre}" />
                </title>
                <link rel="stylesheet" href="/css/baseStyles.css">
                <link rel="stylesheet" href="/css/formStyle.css">
            </head>

            <body>
                <%@ include file="nav.jsp" %>
                    <div class="formulario">
                        <h1 class="form-title">Editar Autor:
                            <c:out value="${autor.nombre}" />
                        </h1>
                        <form:form action="/libros/anexar/autor" method="post" modelAttribute="autor">
                            <input type="hidden" name="_method" value="put">

                            <form:label class="input-label" path="nombre">Nombre Autor</form:label>
                            <form:input class="input-content" type="text" path="nombre"
                                placeholder="Ingrese nombre de el autor" />
                            <form:errors class="errors" path="nombre" />

                            <form:label class="input-label" path="descripcion">Biografia Autor</form:label>
                            <form:textarea class="input-content" type="text" path="descripcion"
                                placeholder="Ingrese una pequeña biografia de el autor" />
                            <form:errors class="errors" path="descripcion" />

                            <form:label class="input-label" path="frase">Frase Autor</form:label>
                            <form:textarea class="input-content" type="text" path="frase"
                                placeholder="Ingrese alguna frase importante de el autor" />
                            <form:errors class="errors" path="frase" />


                            <div class="buttons-container">
                                <a class="button-link" href="javascript:history.back()">Cancelar</a>
                                <button class="button-link" type="submit">Agregar</button>
                            </div>

                            <c:out value="${realizado}" />

                        </form:form>
                        <a href="/autores/anexar/autor">Agregar mas Autores</a>
                    </div>
                    <div>
                        <%@ include file="footer.jsp" %>
                    </div>
            </body>

            </html>
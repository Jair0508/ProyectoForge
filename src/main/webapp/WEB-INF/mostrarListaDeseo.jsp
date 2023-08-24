<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Hola
                <c:out value="${usuarioEmail.name}" />
            </title>
            <link rel="stylesheet" href="/css/styleListaDeseo.css">
        </head>

        <body>
            <div>
                <%@ include file="nav.jsp" %>
            </div>
            <div id="contenedor" class="ms-5 container text-center border border-5">
                <img id="imgListDeseos" class="m-1" src="/imagenes/alumno.png" alt="Lector">
                <h1 class="w-100 bg-success fs-2 border border-black">
                    <c:out value="${usuarioEmail.name}" />
                </h1>
            </div>
        </body>

        </html>
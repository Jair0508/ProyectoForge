<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Registro - Usuario</title>
                <link rel="stylesheet" href="css/styleRegistro.css">
                
            </head>

            <body>
                <div>
                    <%@ include file="nav.jsp" %>
                </div>
                <div id="formularioLibros" class="border border-5">
                    <h1 class="text-center mb-2 bg-success">Bienvenido, puede Registrarse</h1>
                    <div class="container text-center">
                        <div class="d-flex justify-content-center">
                            <form:form action="/registro" method="post" modelAttribute="usuario">
                                
                                    <form:label path="name">Nombre</form:label>
                                    <form:input type="text" path="name" class="form-control" placeholder="Ingrese su nombre" />
                              
                              
                                    <form:label path="email">Email</form:label>
                                    <form:input type="email" path="email" class="form-control" placeholder="Ingrese su Email" />
                             
                                    <form:label path="password">Contraseña</form:label>
                                    <form:input type="password" path="password" class="form-control" placeholder="Ingrese su Clave" />
                               
                                    <form:label path="passwordConfirmation">Confirme su clave</form:label>
                                    <form:input path="passwordConfirmation" class="form-control" type="password"
                                        placeholder="Confirme Su Clave" />
                                
                                <div class="d-flex justify-content-around mt-4 mb-2">
                                    <a href="/" class="badge text-success p-3">Principal</a>
                                    <button class="btn btn-success p-2" type="submit">Registrar</button>
                                </div>
                
                            </form:form>
                        </div>
                    </div>
                </div>
                <p id="errors" class="container mt-2 text-center bg-danger text-warning ">
                    <form:errors path="usuario.*" />
                </p>
            </body>

            </html>
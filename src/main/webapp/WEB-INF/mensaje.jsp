<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Mensajes</title>
                <link rel="stylesheet" href="/css/mensajeStyle.css">
                <link rel="stylesheet" href="/css/baseStyles.css">

            </head>

            <body>
                <div class="container">
                    <h1>CHAT INTERCAMBIOS</h1>
                    <h2>
                        <c:choose>
                            <c:when test="${mensaje.id == remitente.id}">
                                <span class="user_uno">
                                    <c:out value="${remitente.name}" />
                                </span>
                                <span class="user_dos">
                                    <c:out value="${destinatario.name}" />
                                </span>
                            </c:when>
                            <c:otherwise>
                                <span class="user_uno">
                                    <c:out value="${destinatario.name}" />
                                </span>
                                <span class="user_dos">
                                    <c:out value="${remitente.name}" />
                                </span>
                            </c:otherwise>
                        </c:choose>

                    </h2>


                    <div class="chat-box">
                        <ul class="message-list">
                            <c:forEach var="mensaje" items="${mensajes}" varStatus="loop">

                                <c:set var="messageColorClass"
                                    value="${(mensaje.id == mensaje.remitente.id) ? 'message-content' : ((mensaje.id != mensaje.destinatario.id) ? 'message-content_dos' : '')}" />


                                <li class="message">
                                    <span class="message-content ${messageColorClass}">
                                        <c:out value="${mensaje.contenido}" />
                                        <p class="time">
                                            <c:out value="${mensaje.createdAt}" />
                                        </p>
                                    </span>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="message-input">
                        <form action="/mensajes/usuarios/${remitente.id}/${destinatario.id}/perfil" method="post">
                            <input type="hidden" name="remitenteId" value="${remitente.id}" />
                            <input type="hidden" name="destinatarioId" value="${destinatario.id}" />
                            <input type="text" name="contenido" placeholder="Escribe un mensaje" required />
                            <button type="submit">Enviar</button>
                        </form>

                    </div>
                </div>
            </body>

            </html>
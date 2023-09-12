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

                <div class="chat-window">
                    <h1>Chat</h1>
                    <div class="message-area">
                        <c:forEach var="remitente" items="${mensajesRemitenteADestinatario}">
                            <div class="message">
                                <strong>${remitente.remitente.name}</strong>: ${remitente.contenido}
                            </div>
                        </c:forEach>
                        <c:forEach var="destinatario" items="${mensajesDestinatarioARemitente}">
                            <div class="message">
                                <strong>${destinatario.destinatario.name}</strong>: ${destinatario.contenido}
                            </div>
                    </div>

                    <c:if test="${usuarioEmail.id == 1}">
                        <p class="errors">Solo puede observar la tabla</p>
                    </c:if>
                    <c:if test="${usuarioEmail.id >= 2}">
                        <div class="input-area">
                            <form
                                action="/mensajes/remitente/${usuarioEmail.id}/destinatario/${destinatario.destinatario.id}/perfil"
                                method="post">
                                <input type="hidden" name="remitenteId" value="${usuario.id}" />
                                <input type="hidden" name="destinatarioId" value="${destinatarioId}" />
                                <input type="text" id="message-input" name="contenido"
                                    placeholder="Escribe un mensaje" />
                                    <div class="buttons-container">
                                        <p class="checked">
                                          <c:out value="${realizado}" />
                                        </p>
                                        <p class="errors">
                                          <c:out value="${error}" />
                                        </p>
                                        <button class="send-button" type="submit">Enviar</button>
                                      </div>
                            </form>
                        </div>
                    </c:if>
                </div>
                </c:forEach>

                <script src="/javaScript/mensaje.js"></script>

            </body>

            </html>
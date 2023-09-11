<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Interactuando con </title>
                <link rel="stylesheet" href="/css/mensajeStyle.css">

            </head>

            <body>

                <div class="chat-window">
                    <div class="message-area">
                        <c:forEach var="mensaje" items="${mensajesRemitenteADestinatario}">
                            <div class="message">
                                <strong>${mensaje.remitente.name}</strong>: ${mensaje.contenido}
                            </div>
                        </c:forEach>
                        <c:forEach var="mensaje" items="${mensajesDestinatarioARemitente}">
                            <div class="message">
                                <strong>${mensaje.destinatario.name}</strong>: ${mensaje.contenido}
                            </div>
                        </c:forEach>
                    </div>
                </div>
                
                    <div class="input-area">
                        <form action="/mensajes/enviar" method="post">
                            <input type="hidden" name="remitenteId" value="${usuario.id}" />
                            <input type="hidden" name="destinatarioId" value="${destinatarioId}" />
                            <textarea type="text" id="message-input" name="contenido" placeholder="Escribe un mensaje"></textarea>
                            <button type="submit" class="send-button">Enviar</button>
                        </form>
                    </div>
                </div>

                <script src="/javaScript/mensaje.js"></script>

            </body>

            </html>
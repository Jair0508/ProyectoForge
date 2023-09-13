<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Intercambios</title>
        <link rel="stylesheet" href="/css/baseStyles.css">
        <link rel="stylesheet" href="/css/tablaStyle.css">
        <link rel="stylesheet" href="/css/intercambiosModalStyle.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      </head>

      <body>
        <%@ include file="nav.jsp" %>
          <div id="table-trade" class="tables-container">
            <table class="tables">
              <caption>
                <h2>Libros Publicados:</h2>
              </caption>
              <thead>
                <tr>
                  <th>Titulo</th>
                  <th>Usuario</th>
                  <th>Detalles</th>
                  <th>Fecha Publicacion</th>
                  <th>Accion</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="libro" items="${listalibros}">
                  <tr>
                    <td>
                      <c:out value="${libro.nombre}" />
                    </td>
                    <td>
                        <c:out value="${libro.usuario.name}" /><br>
                        <span id="emailIntercambios"><c:out value="${libro.usuario.email}" /></span>
                    </td>
                    <td>
                      <c:out value="${libro.detallesExtras}" />
                    </td>
                    <td>
                      <c:out value="${libro.createdAt}" />
                    </td>
                    <td>
                      <c:if test="${usuarioEmail.id >= 2}">
                        <c:choose>
                          <c:when test="${usuarioEmail == libro.usuario}">
                            <p class="warning">Tu Publicacion</p>
                          </c:when>
                          <c:otherwise>
                            <div class="container">
                              <div class="interior">
                                <a class="btn" href="#open-modal">Contactar</a>
                              </div>
                            </div>
                            <div id="open-modal" class="modal-window">
                              <div>
                                <a href="#" title="Close" class="modal-close">Close</a>
                                <div>

                                  <h1 class="form-title">Enviar Mensaje</h1>
                                  <form action="/mensajes/usuarios/${usuarioEmail.id}/${libro.usuario.id}/intercambios"
                                    method="post">
                                    <p class="input-label">Contenido</p>
                                    <input class="input-content" type="hidden" name="remitenteId"
                                      value="${usuarioEmail.id}" />
                                    <input class="input-content" type="hidden" name="destinatarioId"
                                      value="${libro.usuario.id}" />
                                    <input class="input-content" type="text" name="contenido"
                                      placeholder="Escribe un mensaje" required />
                                    <div class="buttons-container">
                                      <p class="checked">
                                        <c:out value="${realizado}" />
                                      </p>
                                      <p class="errors">
                                        <c:out value="${error}" />
                                      </p>
                                      <button class="button-link" type="submit">Enviar</button>
                                    </div>
                                  </form>
                                </div>
                              </div>
                            </div>
                          </c:otherwise>
                        </c:choose>
                      </c:if>
                      <c:if test="${usuarioEmail.id == 1}">
                        <p class="errors">Solo puede observar la tabla</p>
                      </c:if>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
          <%@ include file="footer.jsp" %>
      </body>

      </html>
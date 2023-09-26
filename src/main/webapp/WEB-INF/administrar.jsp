<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="/css/baseStyles.css">
      <link rel="stylesheet" href="/css/administrarStyle.css">
      <title>Administar</title>
    </head>

    <body>
      <%@ include file="nav.jsp" %>

          <h1 id="panel">
            Panel de administracion
          </h1>
          <a id="open-hide" class="open-hide">Menu</a>
          <ul id="menu" class="menu present">
            <li><a href="/libros/anexar">Anexar Libros</a></li>
            <li><a href="/autores/anexar/autor">Anexar Autor</a></li>
            <li><a href="/generos/anexar/genero">Anexar Genero</a></li>
          </ul>

          <div id="centrarTablas">
            <c:if test="${not empty listaLibro}">
              <table>
                <caption>
                  <h2 id="tituloTablas">Lista Libros:</h2>
                </caption>
                <thead>
                  <tr>
                    <th class="reducir">Titulo</th>
                    <th>Precio</th>
                    <th>Cantidad</th>
                    <th>Accion</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="libro" items="${listaLibro}">
                    <tr>
                      <td class="reducir">
                          <c:out value="${libro.nombre}" />
                      </td>
                      <td>
                        <c:out value="${libro.precio}" />
                      </td>
                      <td>
                        <c:out value="${libro.cantidad}" />
                      </td>
                      <td>
                        <c:if test="${libro.autor != null && libro.genero != null}">
                          <a class="button" href="/libros/${libro.id}/editar">Editar</a>
                        </c:if>

                        <c:if test="${libro.genero == null && libro.autor == null}">
                          <form action="/libros/eliminar/${libro.id}" method="post">
                            <input type="hidden" name="_method" value="delete" />
                            <p>
                              Su Libro no dispone de genero y Autor, Puede <input class="button" type="submit"
                                value="Borrar" /> o
                              agregarle
                              desde la tabla de generos/autor
                            </p>
                          </form>
                        </c:if>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
              <p>
                <c:out value="${LibroError}" />
              </p>
            </c:if>

            <c:if test="${not empty listaUsuarioNotNull}">
              <table>
                <caption>
                  <h2>Lista Usuarios Activos:</h2>
                </caption>
                <thead>
                  <tr>
                    <th class="reducir">Nombre</th>
                    <th>Email</th>
                    <th>Interacciones</th>
                    <th>Accion</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="usuario" items="${listaUsuarioNotNull}">
                    <tr>
                      <c:if test="${usuario.id != 1}">
                        <td class="reducir">
                          <c:out value="${usuario.name}" />
                        </td>
                        <td>
                          <c:out value="${usuario.email}" />
                        </td>
                        <td>
                          <div class="dropdown">
                            <div class="dropdown">
                              <select onchange="mostrarConversacion(this, '${usuario.id}')">
                                <option value="" disabled selected>Selecciona una conversación</option>
                                <c:set var="tempSet" value="" />
                                <c:forEach var="mensajeEnviado" items="${usuario.mensajesEnviados}">
                                  <c:set var="nombreRemitente" value="${mensajeEnviado.destinatario.name}" />
                                  <c:set var="remitenteId" value="${mensajeEnviado.destinatario.id}" />
                                  <c:if test="${not tempSet.contains(nombreRemitente)}">
                                    <option value="${remitenteId}">
                                      <c:out value="${nombreRemitente}" />
                                    </option>
                                    <c:set var="tempSet" value="${tempSet}${nombreRemitente}" />
                                  </c:if>
                                </c:forEach>
                                <c:forEach var="mensajeRecibido" items="${usuario.mensajesRecibidos}">
                                  <c:set var="nombreRemitente" value="${mensajeRecibido.remitente.name}" />
                                  <c:set var="remitenteId" value="${mensajeRecibido.remitente.id}" />
                                  <c:if test="${not tempSet.contains(nombreRemitente)}">
                                    <option value="${remitenteId}">
                                      <c:out value="${nombreRemitente}" />
                                    </option>
                                    <c:set var="tempSet" value="${tempSet}${nombreRemitente}" />
                                  </c:if>
                                </c:forEach>
                              </select>
                            </div>
                          </div>
                          <script>
                            function mostrarConversacion(selectElement, userId) {
                              var destinatarioId = selectElement.value;
                              if (destinatarioId) {
                                var url = "/mensajes/usuarios/" + userId + "/" + destinatarioId;
                                window.location.href = url;
                              }
                            }
                          </script>
                        </td>
                        <td>
                          <form action="/usuario/eliminar/${usuario.id}" method="post"
                            onsubmit="return confirm('¿Estás seguro de que deseas eliminar tu cuenta? Esta acción no se puede deshacer.')">
                            <input type="hidden" name="_method" value="delete" />
                            <input class="button" type="submit" value="Delete" />
                          </form>
                        </td>
                      </c:if>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </c:if>

            <c:if test="${not empty listaUsuarioNull}">
              <table>
                <caption>
                  <h2>Lista Usuarios Inhabilitado:</h2>
                </caption>
                <thead>
                  <tr>
                    <th class="reducir">Nombre</th>
                    <th>Email</th>
                    <th>Interacciones</th>
                    <th>Accion</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="usuario" items="${listaUsuarioNull}">
                    <tr>
                      <c:if test="${usuario.id != 1}">
                        <td class="reducir">
                          <c:out value="${usuario.name}" />
                        </td>
                        <td>
                          <c:out value="${usuario.email}" />
                        </td>
                        <td>
                          <div class="dropdown">
                            <div class="dropdown">
                              <select onchange="mostrarConversacion(this, '${usuario.id}')">
                                <option value="" disabled selected>Selecciona una conversación</option>
                                <c:set var="tempSet" value="" />
                                <c:forEach var="mensajeEnviado" items="${usuario.mensajesEnviados}">
                                  <c:set var="nombreRemitente" value="${mensajeEnviado.destinatario.name}" />
                                  <c:set var="remitenteId" value="${mensajeEnviado.destinatario.id}" />
                                  <c:if test="${not tempSet.contains(nombreRemitente)}">
                                    <option value="${remitenteId}">
                                      <c:out value="${nombreRemitente}" />
                                    </option>
                                    <c:set var="tempSet" value="${tempSet}${nombreRemitente}" />
                                  </c:if>
                                </c:forEach>
                                <c:forEach var="mensajeRecibido" items="${usuario.mensajesRecibidos}">
                                  <c:set var="nombreRemitente" value="${mensajeRecibido.remitente.name}" />
                                  <c:set var="remitenteId" value="${mensajeRecibido.remitente.id}" />
                                  <c:if test="${not tempSet.contains(nombreRemitente)}">
                                    <option value="${remitenteId}">
                                      <c:out value="${nombreRemitente}" />
                                    </option>
                                    <c:set var="tempSet" value="${tempSet}${nombreRemitente}" />
                                  </c:if>
                                </c:forEach>
                              </select>
                            </div>
                          </div>
                          <script>
                            function mostrarConversacion(selectElement, userId) {
                              var destinatarioId = selectElement.value;
                              if (destinatarioId) {
                                var url = "/mensajes/usuarios/" + userId + "/" + destinatarioId;
                                window.location.href = url;
                              }
                            }
                          </script>
                        </td>
                        <td>
                          <form action="/usuario/eliminar/${usuario.id}" method="post"
                            onsubmit="return confirm('¿Estás seguro de que deseas eliminar tu cuenta? Esta acción no se puede deshacer.')">
                            <input type="hidden" name="_method" value="delete" />
                            <input class="button" type="submit" value="Delete" />
                          </form>
                        </td>
                      </c:if>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </c:if>

            <c:if test="${not empty listaAutores}">
              <div>
                <table>
                  <caption>
                    <h2>Lista Autor:</h2>
                  </caption>
                  <thead>
                    <tr>
                      <th class="reducir">Nombre</th>
                      <th>fecha de Registro</th>
                      <th>Accion</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="autor" items="${listaAutores}">
                      <tr>
                        <td class="reducir">
                          <c:out value="${autor.nombre}" />
                        </td>
                        <td>
                          <c:out value="${autor.createdAt}" />
                        </td>
                        <td><a class="button" href="/autores/${autor.id}/editar">Editar</a></td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </c:if>

            <c:if test="${not empty listaGeneros}">
              <table>
                <caption>
                  <h2>Lista Genero:</h2>
                </caption>
                <thead>
                  <tr>
                    <th class="reducir">Nombre</th>
                    <th>fecha de Registro</th>
                    <th>Accion</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="genero" items="${listaGeneros}">
                    <tr>
                      <td class="reducir">
                        <c:out value="${genero.nombreGenero}" />
                      </td>
                      <td>
                        <c:out value="${genero.createdAt}" />
                      </td>
                      <td><a class="button" href="/generos/${genero.id}/editar">Editar</a></td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
        </c:if>
      </div>
        <%@ include file="footer.jsp" %>
          <script src="/javaScript/menu.js"></script>
    </body>

    </html>
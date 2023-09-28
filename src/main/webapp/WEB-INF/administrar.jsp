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

        <div id="primerasTablas">
          <table>
            <caption>
              <h2 id="tituloTablas">Lista Libros:</h2>
            </caption>
            <thead>
              <tr>
                <th>Libro</th>
                <th>
                  <p class="precio">Precio</p>
                </th>
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
                    <b>
                      $
                      <c:out value="${libro.precio}" />
                    </b>
                  </td>
                  <td>
                    <c:out value="${libro.cantidad}" />
                  </td>
                  <td>
                    <button class="myBtn_multi button">Detalles</button>
                    <div class="modal modal_multi">
                      <div class="modal-content">
                        <span class="close close_multi">×</span>
                        <h3 class="titulo">Nombre Libro: <span>
                            <c:out value="${libro.nombre}" />
                          </span></h3>
                        <p class="descripcion">
                          <c:out value="${libro.descripcion}" />
                        </p>
                        <div class="alinear">
                          <h6>
                            Autor: <span>
                              <c:out value="${libro.autor.nombre}" />
                            </span>
                          </h6>
                          <h6>
                            Genero: <span>
                              <c:out value="${libro.genero.nombreGenero}" />
                            </span>
                          </h6>
                        </div>
                        <div class="acciones">
                          <c:if test="${libro.autor != null && libro.genero != null}">
                            <a class="button" href="/libros/${libro.id}/editar">Editar</a>
                          </c:if>
                          <c:if test="${libro.genero == null}">
                            <p>Su libro <span>NO</span> dispone de genero, agregar en la tabla de generos</p>
                          </c:if>
                          <c:if test="${libro.autor == null}">
                            <p>Su libro <span>NO</span> dispone de autor, agregar en la tabla de autor</p>
                          </c:if>
                          <c:if test="${libro.genero == null && libro.autor == null}">
                            <form action="/libros/eliminar/${libro.id}" method="post"
                              onsubmit="return confirm('¿Estás seguro de que deseas eliminar Libro? Esta acción no se puede deshacer.')">
                              <input type="hidden" name="_method" value="delete" />
                              <p>
                                Su Libro <span>NO</span> dispone de genero/Autor, Puede <input class="button"
                                  type="submit" value="Borrar" /> o agregar en sus tablas.
                              </p>
                            </form>
                          </c:if>
                        </div>
                      </div>
                    </div>

                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
          <p>
            <c:out value="${LibroError}" />
          </p>
          <table class="tables">
            <caption>
              <h2>Ordenes de Compra:</h2>
            </caption>
            <thead>
              <tr>
                <th>Detalle</th>
                <th>Creado</th>
                <th>Producto</th>
                <th>Accion</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="ordenes" items="${listaOrdenes}">
                <tr>
                  <td class="reducir">
                    <c:out value="${ordenes.direccion}"/>
                  </td>
                  <td>
                    <c:out value="${ordenes.createdAt}" />
                  </td>
                  <td>
                    <c:out value="${ordenes.libroVenta.nombre}" />
                  </td>
                  <td>
                    <button class="myBtn_multi button">Detalles</button>
                    <div class="modal modal_multi">
                      <div class="modal-content">
                        <span class="close close_multi">×</span>
                        <div>
                          <h3 class="titulo">Detalles:</h3>
                          <p class="descripcion"><c:out value="${ordenes.direccion}, ${ordenes.departamento} / ${ordenes.municipio}" /></p>
                          <div class="alinear">
                            <h6>
                              Producto: <span>
                                <c:out value="${ordenes.libroVenta.nombre}" />
                              </span>
                            </h6>
                            <h6>
                              Costo: <span>$
                                <c:out value="${ordenes.precioTotal}" />
                              </span>
                            </h6>
                            <form action="/orden/cancelar/${ordenes.id}" method="post">
                              <input type="hidden" name="_method" value="delete" />
                              <input class="button" type="submit" value="cancelar" />
                            </form>
                          </div>
                        </div>
                      </div>
                    </div>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>

        <div id="segundasTablas">
          <table>
            <caption>
              <h2>Lista Usuarios Activos:</h2>
            </caption>
            <thead>
              <tr>
                <th>Nombre</th>
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
                            <option value="" disabled selected>Conversaciones</option>
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
                      <button class="myBtn_multi button">Detalles</button>
                      <div class="modal modal_multi">
                        <div class="modal-content">
                          <span class="close close_multi">×</span>
                          <h3 class="titulo">Nombre: <span>
                              <c:out value="${usuario.name}" />
                            </span></h3>
                          <div class="tablesModal">
                            <table class="tables">
                              <caption>
                                <h2>Ordenes de Compra:</h2>
                              </caption>
                              <thead>
                                <tr>
                                  <th>Detalle</th>
                                  <th>Creado</th>
                                  <th>Producto</th>
                                  <th>Accion</th>
                                </tr>
                              </thead>
                              <tbody>
                                <c:forEach var="ordenes" items="${nofunciona}">
                                  <tr>
                                    <td>
                                      <c:out value="${ordenes.createdAt}" />
                                    </td>
                                    <td>
                                      <c:out
                                        value="${ordenes.direccion}, ${ordenes.departamento} / ${ordenes.municipio}" />
                                    </td>
                                    <td>
                                      <c:out value="${ordenes.libroVenta.nombre}" />
                                    </td>
                                    <td>
                                      <form action="/orden/cancelar/${ordenes.id}" method="post">
                                        <input type="hidden" name="_method" value="delete" />
                                        <input class="button" type="submit" value="cancelar" />
                                      </form>
                                    </td>
                                  </tr>
                                </c:forEach>
                              </tbody>
                            </table>
                            <table class="tables">
                              <caption>
                                <h2>Libros <span>Publicados</span>:</h2>
                              </caption>
                              <thead>
                                <tr>
                                  <th>Titulo</th>
                                  <th>Detalles</th>
                                  <th>Fecha Publicacion</th>
                                </tr>
                              </thead>
                              <tbody>
                                <c:forEach var="libro" items="${usuario.librosIntercambio}">
                                  <tr>
                                    <td class="reducir">
                                      <c:out value="${libro.nombre}" />
                                    </td>
                                    <td>
                                      <div class="popover__wrapper">
                                        <a href="#" class="popover__title">Ver mas ...</a>
                                        <div class="popover__content">
                                          <div class="popover__message">
                                            <c:out value="${libro.descripcion}" />
                                          </div>
                                        </div>
                                    </td>
                                    <td>
                                      <c:out value="${libro.createdAt}" />
                                    </td>
                                  </tr>
                                </c:forEach>
                              </tbody>
                            </table>
                          </div>

                          <form action="/usuario/eliminar/${usuario.id}" method="post"
                            onsubmit="return confirm('¿Estás seguro de que deseas eliminar tu cuenta? Esta acción no se puede deshacer.')">
                            <input type="hidden" name="_method" value="delete" />
                            <input class="button" type="submit" value="Inhabilitar" />
                          </form>
                        </div>
                      </div>
                    </td>
                  </c:if>
                </tr>
              </c:forEach>
            </tbody>
          </table>
          <table>
            <caption>
              <h2>Lista Usuarios Inhabilitado:</h2>
            </caption>
            <thead>
              <tr>
                <th>Nombre</th>
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
                      Inhabilitado
                    </td>
                    <td>
                      <div class="dropdown">
                        <div class="dropdown">
                          <select onchange="mostrarConversacion(this, '${usuario.id}')">
                            <option value="" disabled selected>Conversaciones</option>
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
                      <button class="myBtn_multi button">Detalles</button>
                      <div class="modal modal_multi">
                        <div class="modal-content">
                          <span class="close close_multi">×</span>
                          <h3 class="titulo">Nombre: <span>
                              <c:out value="${usuario.name}" />
                            </span></h3>
                          <div class="tablesModal">
                            <table class="tables">
                              <caption>
                                <h2>Ordenes de Compra:</h2>
                              </caption>
                              <thead>
                                <tr>
                                  <th>Detalle</th>
                                  <th>Creado</th>
                                  <th>Producto</th>
                                  <th>Accion</th>
                                </tr>
                              </thead>
                              <tbody>
                                <c:forEach var="ordenes" items="${nofunciona}">
                                  <tr>
                                    <td>
                                      <c:out value="${ordenes.createdAt}" />
                                    </td>
                                    <td>
                                      <c:out
                                        value="${ordenes.direccion}, ${ordenes.departamento} / ${ordenes.municipio}" />
                                    </td>
                                    <td>
                                      <c:out value="${ordenes.libroVenta.nombre}" />
                                    </td>
                                    <td>
                                      <form action="/orden/cancelar/${ordenes.id}" method="post">
                                        <input type="hidden" name="_method" value="delete" />
                                        <input class="button" type="submit" value="cancelar" />
                                      </form>
                                    </td>
                                  </tr>
                                </c:forEach>
                              </tbody>
                            </table>
                            <table class="tables">
                              <caption>
                                <h2>Libros <span>Publicados</span>:</h2>
                              </caption>
                              <thead>
                                <tr>
                                  <th>Titulo</th>
                                  <th>Detalles</th>
                                  <th>Fecha Publicacion</th>
                                </tr>
                              </thead>
                              <tbody>
                                <c:forEach var="libro" items="${usuario.librosIntercambio}">
                                  <tr>
                                    <td class="reducir">
                                      <c:out value="${libro.nombre}" />
                                    </td>
                                    <td>
                                      <div class="popover__wrapper">
                                        <a href="#" class="popover__title">Ver mas ...</a>
                                        <div class="popover__content">
                                          <div class="popover__message">
                                            <c:out value="${libro.descripcion}" />
                                          </div>
                                        </div>
                                    </td>
                                    <td>
                                      <c:out value="${libro.createdAt}" />
                                    </td>
                                  </tr>
                                </c:forEach>
                              </tbody>
                            </table>
                          </div>
                          <form action="/usuario/eliminar/${usuario.id}" method="post"
                            onsubmit="return confirm('¿Estás seguro de que deseas eliminar tu cuenta? Esta acción no se puede deshacer.')">
                            <input type="hidden" name="_method" value="delete" />
                            <input class="button" type="submit" value="Inhabilitar" />
                          </form>
                        </div>
                      </div>

                    </td>
                  </c:if>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>

        <div id="tercerasTablas">
          <table>
            <caption>
              <h2>Lista Autor:</h2>
            </caption>
            <thead>
              <tr>
                <th>Nombre</th>
                <th>Fecha de Registro</th>
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
                  <td>
                    <button class="myBtn_multi button">Detalles</button>
                    <div class="modal modal_multi">
                      <div class="modal-content">
                        <span class="close close_multi">×</span>
                        <h3 class="titulo">Autor: <span>
                            <c:out value="${autor.nombre}" />
                          </span></h3>
                        <p class="descripcion">
                          <c:out value="${autor.descripcion}" />
                        </p>
                        <a class="button" href="/autores/${autor.id}/editar">Editar</a>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
          <table>
            <caption>
              <h2>Lista Genero:</h2>
            </caption>
            <thead>
              <tr>
                <th>Nombre</th>
                <th>Fecha de Registro</th>
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
                  <td>
                    <a class="button" href="/generos/${genero.id}/editar">Editar</a>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
        <%@ include file="footer.jsp" %>
          <script src="/javaScript/menu.js"></script>
          <script src="/javaScript/modalAdmin.js"></script>
    </body>

    </html>
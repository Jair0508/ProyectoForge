<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="/css/baseStyles.css">
      <link rel="stylesheet" href="/css/indexStyle.css">
      <link rel="stylesheet" href="/css/tablaStyle.css">
      <title>Administar</title>
    </head>

    <body>
      <%@ include file="nav.jsp" %>

        <div class="main-content">
          <h1>Panel de administracion</h1>

          <a id="open-hide" class="open-hide">Menu</a>
          <ul id="menu" class="menu present">
            <li><a href="/libros/anexar">Anexar Libros</a></li>
            <li><a href="/autores/anexar/autor">Anexar Autor</a></li>
          </ul>

          <div class="tables-container">
            <c:if test="${not empty listaLibro}">
            <div class="tables">
            <table>
              <caption>
                <h2>Lista Libros Ventas:</h2>
              </caption>
              <thead>
                <tr>
                  <th>Titulo</th>
                  <th>Precio</th>
                  <th>Cantidad</th>
                  <th>Accion</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="libro" items="${listaLibro}">
                  <tr>
                    <td>
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
                      <c:if test="${libro.autor == null}">
                        <p> Su Libro no dispone de autor.
                        </p>
                      </c:if>
                      <c:if test="${libro.genero == null}">
                        <p> Su Libro no dispone de genero.
                        </p>
                      </c:if>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </c:if>
          <div class="tables">
            <table>
              <caption>
                <h2>Lista Usuarios:</h2>
              </caption>
              <thead>
                <tr>
                  <th>Nombre</th>
                  <th>Email</th>
                  <th>Accion</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="usuario" items="${listaUsuario}">
                  <tr>
                    <td>
                      <c:out value="${usuario.name}" />
                    </td>
                    <td>
                      <c:out value="${usuario.email}" />
                    </td>
                    <td>
                      <a class="button" href="">Ver</a>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
          <c:if test="${not empty listaAutores}">
          <div class="tables">
            <table>
              <caption>
                <h2>Lista Autor:</h2>
              </caption>
              <thead>
                <tr>
                  <th>Nombre</th>
                  <th>fecha de Registro</th>
                  <th>Accion</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="autor" items="${listaAutores}">
                  <tr>
                    <td>
                      <c:out value="${autor.nombre}" />
                    </td>
                    <td>
                      <c:out value="${autor.createdAt}" />
                    </td>
                    <td>
                      <a class="button" href="/autores/${autor.id}/editar">Editar</a>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </c:if>
        <c:if test="${not empty listaGeneros}">
          <div class="tables">
            <table>
              <caption>
                <h2>Lista Genero:</h2>
              </caption>
              <thead>
                <tr>
                  <th>Nombre</th>
                  <th>fecha de Registro</th>
                  <th>Accion</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="genero" items="${listaGeneros}">
                  <tr>
                    <td>
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
          </div>
        </div>
      </c:if>
        <script src="/javaScript/admin.js"></script>
    </body>

    </html>
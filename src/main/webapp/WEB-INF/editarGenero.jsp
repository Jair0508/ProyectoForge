<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
      <%@ page isErrorPage="true" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>Editar genero:
            <c:out value="${genero.nombreGenero}" />
          </title>
          <link rel="stylesheet" href="/css/baseStyles.css">
          <link rel="stylesheet" href="/css/formStyle.css">
          <link rel="stylesheet" href="/css/tablaStyle.css">
        </head>

        <body>
          <%@ include file="nav.jsp" %>
            <div>
              <div class="formulario">
                <h1 class="form-title">Editar Genero:
                  <c:out value="${genero.nombreGenero}" />
                </h1>
                <form:form action="/generos/${genero.id}/editar" method="post" modelAttribute="genero">
                  <input type="hidden" name="_method" value="put">

                  <form:label class="input-label" path="nombreGenero">Nombre Genero</form:label>
                  <form:input class="input-content" type="text" path="nombreGenero"
                    placeholder="Ingrese nombre del genero" />
                  <form:errors class="errors" path="nombreGenero" />

                  <div class="buttons-container">
                    <a class="button-link" href="/usuario/administrador">Cancelar</a>
                    <button class="button-link" type="submit">Agregar</button>
                  </div>

                  <p class="checked">
                    <c:out value="${realizado}" />
                  </p>

                </form:form>
                <a class="button" href="/libros/anexar">Agregar mas Autores</a>
              </div>

              <div class="main-content">
                <div class="tables-container">
                  <c:choose>
                    <c:when test="${empty libroNoNull}">
                      <h1 class="LibroNoNull">Este Genero no tiene Libros</h1>
                    </c:when>
                    <c:otherwise>
                      <table>
                        <caption>
                          <h2>Lista Libros de
                            <c:out value="${genero.nombreGenero}" />:
                          </h2>
                        </caption>
                        <thead>
                          <tr>
                            <th>Titulo</th>
                            <th>Accion</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach var="libro" items="${libroNoNull}">
                            <tr>
                              <td>
                                <c:out value="${libro.nombre}" />
                              </td>
                              <td>
                                <form action="/generos/${genero.id}/remover/${libro.id}" method="post">
                                  <div>
                                    <button class="button" type="submit">Remover</button>
                                  </div>
                                </form>
                              </td>
                            </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                    </c:otherwise>
                  </c:choose>
                  <div id="select">
                    <h4>Lista Libros sin Genero:</h4>
                    <form action="/generos/${genero.id}/agregar" method="post">
                      <select class="input-content" name="libroId" id="libroId">
                        <c:forEach items="${libroNull}" var="libro">
                          <option value="${libro.id}">
                            <c:out value="${libro.nombre}" />
                          </option>
                        </c:forEach>
                      </select>
                      <c:choose>
                        <c:when test="${empty libroNull}">
                          <p class="errors">No hay Libros para seleccionar</p>
                        </c:when>
                        <c:otherwise>
                          <div>
                            <button class="button" type="submit">Agregar</button>
                          </div>
                        </c:otherwise>
                      </c:choose>
                    </form>
                  </div>
                </div>
                <p class="warning">
                  <c:out value="${removido}" />
                </p>
                <p class="checked">
                  <c:out value="${agregado}" />
                </p>
              </div>
            </div>
            <div>
              <%@ include file="footer.jsp" %>
            </div>
        </body>

        </html>
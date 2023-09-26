<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
      <%@ page isErrorPage="true" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>Editar Autor:
            <c:out value="${autor.nombre}" />
          </title>
          <link rel="stylesheet" href="/css/baseStyles.css">
          <link rel="stylesheet" href="/css/editarAutorStyle.css">
          <!-- <link rel="stylesheet" href="/css/tablaStyle.css"> -->
        </head>

        <body>
          <%@ include file="nav.jsp" %>
            <div>
              <div class="formulario">
                <h1 class="form-title">Editar Autor:
                  <span><c:out value="${autor.nombre}" /></span>
                </h1>
                <form:form action="/autores/${autor.id}/editar" method="post" modelAttribute="autor">
                  <input type="hidden" name="_method" value="put">

                  <form:label class="input-label" path="nombre">Nombre Autor</form:label>
                  <form:input class="input-content" type="text" path="nombre"
                    placeholder="Ingrese nombre de el autor" />
                  <form:errors class="errors" path="nombre" />

                  <form:label class="input-label" path="descripcion">Biografia Autor</form:label>
                  <form:textarea class="input-content" type="text" path="descripcion"
                    placeholder="Ingrese una pequeña biografia de el autor" />
                  <form:errors class="errors" path="descripcion" />

                  <form:label class="input-label" path="frase">Frase Autor</form:label>
                  <form:textarea class="input-content" type="text" path="frase"
                    placeholder="Ingrese alguna frase importante de el autor" />
                  <form:errors class="errors" path="frase" />

                  <div class="buttons-container">
                    <a class="button-link" href="/usuario/administrador">Cancelar</a>
                    <button class="button-link" type="submit">Agregar</button>
                  </div>

                  <p class="checked">
                    <c:out value="${realizado}" />
                  </p>

                </form:form>
                <a class="button" href="/autores/anexar/autor">Agregar mas Autores</a>
              </div>


              <div class="main-content">
                <div class="tables-container">
                  <c:choose>
                    <c:when test="${empty libroNoNull}">
                      <h1 class="LibroNoNull">
                        Este Autor no tiene Libros
                        <!-- boton de eliminar -->
                        <form action="/autores/eliminar/${autor.id}" method="post">
                          <input type="hidden" name="_method" value="delete" />
                          <input type="submit" value="Delete" />
                        </form>
                      </h1>
                    </c:when>
                    <c:otherwise>
                      <table class="tables">
                        <caption>
                          <h2>Lista Libros de:
                            <span><c:out value="${autor.nombre}" /></span>
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
                                <form action="/autores/${autor.id}/remover/${libro.id}" method="post">
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
                    <h4>Lista Libros sin Autor:</h4>
                    <form action="/autores/${autor.id}/agregar" method="post">
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
                      <p class="warning">
                        <c:out value="${removido}" />
                      </p>
                      <p class="checked">
                        <c:out value="${agregado}" />
                      </p>
                    </form>
                  </div>
                </div>
              </div>
            </div>
            <%@ include file="footer.jsp" %>
        </body>

        </html>
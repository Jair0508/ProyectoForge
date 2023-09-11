<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/css/baseStyles.css">
        <link rel="stylesheet" href="/css/tablaStyle.css">
        <title>Document</title>
      </head>

      <body>
        <%@ include file="nav.jsp" %>

          <div class="main-content">
            <h1 style="display: flex; align-items: center; justify-content: center; margin-bottom: 0.5em;">
              ${usuarioEmail.name}
              <svg viewBox="0 0 48 48" width="40" xmlns="http://www.w3.org/2000/svg" fill="#6fa2dd">
                <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                <g id="SVGRepo_iconCarrier">
                  <title>user-data-solid</title>
                  <g id="Layer_2" data-name="Layer 2">
                    <g id="invisible_box" data-name="invisible box">
                      <rect width="48" height="48" fill="none"></rect>
                    </g>
                    <g id="Q3_icons" data-name="Q3 icons">
                      <path
                        d="M41,2H7A2.9,2.9,0,0,0,4,5V43a2.9,2.9,0,0,0,3,3H41a2.9,2.9,0,0,0,3-3V5A2.9,2.9,0,0,0,41,2ZM24,5a6,6,0,1,1-6,6A6,6,0,0,1,24,5ZM13,23a18,18,0,0,1,11-4,18,18,0,0,1,11,4v3a2,2,0,0,1-2,2H15a2,2,0,0,1-2-2Zm1,19a2,2,0,1,1,2-2A2,2,0,0,1,14,42Zm0-6a2,2,0,1,1,2-2A2,2,0,0,1,14,36Zm20,6H22a2,2,0,0,1,0-4H34a2,2,0,0,1,0,4Zm0-6H22a2,2,0,0,1,0-4H34a2,2,0,0,1,0,4Z">
                      </path>
                    </g>
                  </g>
                </g>
              </svg>
            </h1>
            <form action="/usuario/editar/${usuario.id}" method="post">
              <label>cambiar nombre:</label>
              <input name="nombre" type="text">
              <button class="button" type="submit">enviar</button>
            </form>

            <div class="tables-container">
              <table class="tables">
                <caption>
                  <h2>tabla ordenes de compra:</h2>
                </caption>
                <thead>
                  <tr>
                    <th>detalle</th>
                    <th>creado</th>
                    <th>producto</th>
                    <th>Accion</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="ordenes" items="${listOrdenes}">
                    <tr>
                      <td>
                        <c:out value="${ordenes.createdAt}" />
                      </td>
                      <td>
                        <c:out value="${ordenes.direccion}, ${ordenes.departamento} / ${ordenes.municipio}" />
                      </td>
                      <td>
                        <c:out value="${ordenes.libroVenta.nombre}" />
                      </td>
                      <td>

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
                  <h2>tabla libros publicados por ${usuario.name}</h2>
                </caption>
                <thead>
                  <tr>
                    <th>libro</th>
                    <th>descripcion</th>
                    <th>creado</th>
                    <th>Accion</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="libro" items="${usuario.librosIntercambio}">
                    <tr>
                      <td>
                        <c:out value="${libro.nombre}" />
                      </td>
                      <td>
                        <c:out value="${libro.descripcion}" />
                      </td>
                      <td>
                        <c:out value="${libro.createdAt}" />
                      </td>
                      <td>
                        <a class="button" href="/intercambios/${libro.id}/editar">Editar</a>
                        <form action="/orden/cancelar/${ordenes.id}" method="post">
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>

          </div>

      </body>

      </html>
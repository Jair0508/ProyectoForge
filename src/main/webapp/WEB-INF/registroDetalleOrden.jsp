<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="/css/baseStyles.css">
      <link rel="stylesheet" href="/css/formStyle.css">
      <title>Document</title>
    </head>

    <body>

      <%@ include file="nav.jsp" %>

        <div class="formulario">
          <h1 class="form-title">Ingrese sus datos</h1>
          <form:form action="" method="post" modelAttribute="detalleOrden">

            <form:label class="input-label" path="nombre">Nombre</form:label>
            <form:input class="input-content" type="text" path="nombre" />
            <form:errors class="errors" path="nombre" />

            <form:label class="input-label" path="departamento">Departamento</form:label>
            <form:input class="input-content" type="text" path="departamento" />
            <form:errors class="errors" path="departamento" />

            <form:label class="input-label" path="municipio">Municipio</form:label>
            <form:input class="input-content" type="text" path="municipio" />
            <form:errors class="errors" path="municipio" />

            <form:label class="input-label" path="direccion">Dirección</form:label>
            <form:input class="input-content" type="text" path="direccion" />
            <form:errors class="errors" path="direccion" />

            <form:label class="input-label" path="detalle">Detalle</form:label>
            <form:input class="input-content" type="text" path="detalle" />
            <form:errors class="errors" path="detalle" />

            <form:label class="input-label" path="cantidad">Cantidad</form:label>
            <form:input class="input-content" type="number" path="cantidad" />
            <form:errors class="errors" path="cantidad" />

            <div>
              <button type="submit">Anexar</button>
              <a href="javascript:history.back()">Cancelar</a>
            </div>
          </form:form>
        </div>
        <%@ include file="footer.jsp" %>
    </body>

    </html>
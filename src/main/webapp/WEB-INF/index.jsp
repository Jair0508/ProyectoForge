<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/baseStyles.css">
  <link rel="stylesheet" href="/css/indexStyle.css">
  <title>TuLibro - Principal</title>
</head>
<body>
  <div class="first-view">
    <!-- header -->
    <%@ include file="nav.jsp" %>
  
    <!-- carrousel -->
    <%@ include file="carrusel.jsp" %>
  </div>

  <div class="main-content">
    <div class="main-title">
      <h1>
        UNA FORMA SUSTENTABLE DE <span>NUTRIR</span> TU MENTE 
      </h1>
    </div>
    <h3>MIRA NUESTRA <span>LIBRERIA</span></h3>
    <div>
      <c:forEach var="libro" items="${listaLibros}" begin="0" end="3">
        <div>
          <img src="imagenes/mundo-perdido.jpg" alt="img">
          <div class="card-body">
            <h5 class="card-title text-success">
              <c:out value="${libro.nombre}" />
            </h5>
            <h3>

            </h3>
            <p class="card-text">
              <c:out value="${libro.descripcion}" />
            </p>
            <a href="#" class="btn btn-success">Ver mas...</a>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
  <div>
    <%@ include file="footer.jsp" %>
  </div>
</body>

</html>
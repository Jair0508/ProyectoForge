<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TuLibro - Principal</title>
    
</head>

<body>
    <div>
        <%@ include file="nav.jsp" %>
    </div>
    <div>
        <%@ include file="carrusel.jsp" %>
    </div>

    <div class="p-3 mt-5 text-center border border-5 mb-5">
        <h1>
            <em>
                {QUEREMOS DARTE LOS MEJORES PRECIO PARA <span class="text-warning">NUTRIR</span> TU MENTE}
            </em>
        </h1>
    </div>
    <div class="mt-2 pb-2 bg-success border border-5">
        <h3 class="text-center pt-2 pb-2"><span class="fs-1 text-light">{</span>MIRA NUESTRA <span
                class="text-warning text-decoration-underline">LIBRERIA</span><span
                class="fs-1 text-light">}</span>
        </h3>
        <div class="d-flex justify-content-around">
            <c:forEach var="libro" items="${listaLibros}" begin="0" end="3">
                <div class="card" style="width: 18rem;">
                    <img src="imagenes/TuLibro.png" class="card-img-top m-1 border border-success-subtle"
                        style="height: 80px; width: 280px;" alt="img">
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
        <div class="mt-3">
            <%@ include file="footer.jsp" %>
        </div>
</body>

</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


      <link rel="stylesheet" href="/css/styleNav.css">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
      <nav class="d-inline-block navbar navbar-expand-lg bg-success fixed-top">
        <h4 class="mt-1 mb-3 text-center"><a class="text-decoration-none text-warning" href="#">APROVECHA LAS SEGUNGAS OPORTUNIDADES</a></h4>
        <div class="d-flex justify-content-between">
          <a href="/"><img src="/imagenes/TuLibro.png" class="ms-2 mt-1" style="width: 100px;" alt="Tulibro"></a>
          <div class="d-flex flex-column align-items-center">
            <form class="d-flex me-2" role="search">
              <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success" type="submit"><img class="h-auto d-inline-block"
                  style="width: 25px" src="/imagenes/lupa.png" alt="Lupa"></button>
            </form>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/principal">Inicio</a>
              </li>
              <li class="nav-item dropdown btn-group">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                  aria-expanded="false">
                  Categorias
                </a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="#">Lo Nuevo en la Libreria</a></li>
                  <li><a class="dropdown-item" href="#">Autores</a></li>
                  <li><a class="dropdown-item" href="#">Generos</a></li>
                </ul>
              </li>
              <li class="nav-item">
                <a class="nav-link active" href="#">Intercambios</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" href="#">¿Quienes somos?</a>
              </li>
            </ul>
          </div>
          <div id="button" class="btn-group dropstart me-3">
            <button type="button" class="w-25 btn btn-success dropdown-toggle p-1" data-bs-toggle="dropdown"
              aria-expanded="false" >
              <img id="user"src="/imagenes/users.png" alt="user">
            </button>
            <ul class="dropdown-menu">

              <c:if test="${usuarioEmail == null}">
                <div class="border border-5">
                  <h1 class="text-center fs-6 mb-2 bg-success">Inicio Sesion</h1>
                  <div class="container text-center">
                    <div class="d-flex justify-content-center">
                      <form action="/login" method="post">
                        <p class="mb-2">
                          <label name="email">Email</label>
                          <input type="email" name="email" class="form-control" placeholder="Ingrese Email" />
                        </p>
                        <p class="mb-2">
                          <label name="password">Contraseña</label>
                          <input type="password" name="password" class="form-control" placeholder="Ingrese Clave" />
                        </p>

                        <div class="d-flex justify-content-around mt-4">
                          <a href="/registro" class="badge text-success p-3">Registro</a>
                          <button class="btn btn-success p-2" type="submit">Iniciar</button>
                        </div>
                        <p id="errors" class="mt-2 bg-danger text-warning">
                          <c:out value="${error}" />
                        </p>
                      </form>
                    </div>
                  </div>
                </div>
              </c:if>
              <c:if test="${not empty usuarioEmail}">
                <h3 class="text-center bg-success text-dark fs-5">
                 <c:out value="${usuarioEmail.name}" />
                </h3>
                <div id="imgModal" class=" d-flex justify-content-around">
                  <a href="/lista_deseos/${usuarioEmail.id}" class="btn btn-success">
                    <img class="" src="/imagenes/carrito.png" alt="carrito">
                  </a>
                  <a href="/logout" class="btn btn-success">
                    <img class="" src="/imagenes/logout.png" alt="Cerrar Sesion">
                  </a>
                </div>
              </c:if>
            </ul>
          </div>

        </div>
      </nav>
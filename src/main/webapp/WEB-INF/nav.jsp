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
  <h4 class="mt-1 mb-3 text-center"><a class="text-decoration-none text-warning" href="#">APROVECHA LAS SEGUNDAS
      OPORTUNIDADES</a></h4>
  <div class="d-flex justify-content-between">
    <a href="/"><img src="/imagenes/TuLibro.png" class="ms-2 mt-1" style="width: 100px;" alt="Tulibro"></a>
    <div class="d-flex flex-column align-items-center">
      <form class="d-flex me-2" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">
          <img class="h-auto d-inline-block" style="width: 25px" src="/imagenes/lupa.png" alt="Lupa">
        </button>
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
    <!-- En esta zona estoy editando cosas(Jair) -->
    <div id="button" class="btn-group dropstart me-3">
      <button type="button" class="w-25 btn btn-success dropdown-toggle p-1" data-bs-toggle="dropdown"
        aria-expanded="false">
        <img id="user" src="/imagenes/users.png" alt="user">
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
          <div class="border border-5">
            <div class="d-flex justify-content-center align-items-center">
              <svg  class="d-block"  height="25px" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 393.051 393.051" xml:space="preserve" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path style="fill:#FF667C;" d="M262.109,218.505H130.618c-60.251,0-109.253,49.002-109.253,109.253v65.293h350.319v-65.228 C371.362,267.248,322.683,218.505,262.109,218.505z"></path> <path style="fill:#C19D7B;" d="M237.737,0H154.99c-31.677,0-57.406,25.665-57.406,57.406v63.16h198.077v-63.16 C295.402,25.665,269.737,0,237.737,0z"></path> <g> <circle style="fill:#EEB490;" cx="196.364" cy="208.549" r="49.002"></circle> <circle style="fill:#EEB490;" cx="126.416" cy="120.824" r="28.832"></circle> <circle style="fill:#EEB490;" cx="266.828" cy="120.824" r="28.832"></circle> </g> <path style="fill:#FACCB4;" d="M157.317,63.16c-18.877,0-34.327,14.933-34.586,33.81v0.259v52.105 c0,40.081,31.418,73.891,71.499,75.184c41.632,1.034,75.701-32.259,75.701-73.632V97.164V96.97c0-18.877-15.709-33.81-34.586-33.81 H157.317z"></path> </g></svg>
            </div>
            <h3 class="text-center bg-success text-dark fs-5">
              <c:out value="${usuarioEmail.name}"/>
            </h3>
            <div id="imgModal" class=" d-flex justify-content-around">
              <a href="/lista_deseos/${usuarioEmail.id}" class="btn btn-success btn-sm">
                <svg viewBox="0 0 48 48" width="25" xmlns="http://www.w3.org/2000/svg" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><title>70 Basic icons by Xicons.co</title><circle cx="20" cy="40" r="4" fill="#525057"></circle><path d="M12.3,17.3A2,2,0,0,1,10.41,16L7.59,8H3A2,2,0,0,1,3,4H9a2,2,0,0,1,1.88,1.33l3.3,9.3A2,2,0,0,1,12.3,17.3Z" fill="#c8c8c8"></path><path d="M41.42,33H16.51a2,2,0,0,1-1.92-1.45L9,12H45.47a2,2,0,0,1,1.95,2.46l-4,17A2,2,0,0,1,41.42,33Z" fill="#4dbe86"></path><circle cx="38" cy="40" r="4" fill="#525057"></circle></g></svg>
              </a>
              <a href="/logout" class="btn btn-success btn-sm">
                <svg width="25px" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="-51.2 -51.2 614.40 614.40" xml:space="preserve" fill="#157347" stroke="#157347" stroke-width="0.00512" transform="matrix(-1, 0, 0, 1, 0, 0)rotate(0)"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round" stroke="#CCCCCC" stroke-width="4.096"></g><g id="SVGRepo_iconCarrier"> <polygon style="fill:#F4A026;" points="20.677,256 188.13,383.348 175.002,294.072 371.856,294.072 371.856,215.303 175.002,215.303 188.13,128.652 "></polygon> <path style="fill:#61ACD2;" d="M121.108,446.359H438.81V65.641H121.108V13.128h344.027c14.501,0,26.188,11.755,26.188,26.256 v433.231c0,14.501-11.687,26.256-26.188,26.256H121.108V446.359z"></path> <path d="M188.131,396.476c2.299,0,4.607-0.603,6.673-1.824c4.595-2.712,7.091-7.936,6.315-13.215L190.201,307.2h182.311 c7.249,0,12.472-5.879,12.472-13.128v-78.769c0-7.249-5.222-13.128-12.472-13.128H190.268l10.841-71.555 c0.801-5.285-1.683-10.53-6.281-13.258c-4.597-2.725-10.39-2.395-14.646,0.842L12.729,245.55c-3.264,2.484-5.18,6.349-5.18,10.45 c0,4.101,1.917,7.966,5.18,10.45l167.453,127.348C182.519,395.574,185.319,396.476,188.131,396.476z M162.013,295.982l8.447,57.433 L42.365,256l127.933-97.293l-8.276,54.629c-0.574,3.782,0.53,7.626,3.026,10.526c2.493,2.901,6.128,4.569,9.954,4.569h183.727 v52.513H175.002c-3.815,0-7.441,1.661-9.935,4.548C162.572,288.378,161.457,292.208,162.013,295.982z"></path> <path d="M465.135,0H121.764c-7.249,0-13.785,5.879-13.785,13.128v52.513c0,7.249,6.535,13.128,13.785,13.128h303.918v354.462 H121.764c-7.249,0-13.785,5.879-13.785,13.128v52.513c0,7.249,6.535,13.128,13.785,13.128h343.371 c22.041,0,39.316-17.668,39.316-39.385V39.385C504.451,17.668,487.176,0,465.135,0z M478.195,472.615 c0,7.117-5.625,13.128-13.06,13.128H134.236v-26.256h305.231c7.249,0,12.472-5.879,12.472-13.128V65.641 c0-7.249-5.222-13.128-12.472-13.128H134.236V26.256h330.899c7.435,0,13.06,6.011,13.06,13.128V472.615z"></path> </g></svg>
              </a>
            </div>
          </div>
        </c:if>
      </ul>
    </div>

  </div>
</nav>
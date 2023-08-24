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
          <!-- <svg height="30px" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 512 512" xml:space="preserve" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path style="fill:#56545A;" d="M113.68,324.523l-98.396,98.396c-20.379,20.379-20.379,53.419,0,73.797 c20.379,20.379,53.42,20.379,73.797,0l98.398-98.396L113.68,324.523z"></path> <path style="fill:#424144;" d="M150.58,361.421L15.284,496.716c20.379,20.379,53.42,20.379,73.797,0l98.398-98.396L150.58,361.421z"></path> <circle style="fill:#88888F;" cx="285.875" cy="226.125" r="226.125"></circle> <path style="fill:#56545A;" d="M445.77,66.23L125.98,386.02c88.307,88.307,231.483,88.307,319.79,0S534.077,154.538,445.77,66.23z"></path> <circle style="fill:#B4D8F1;" cx="285.875" cy="226.125" r="139.154"></circle> <path style="fill:#7AB9E8;" d="M384.272,127.728L187.479,324.523c54.343,54.343,142.45,54.343,196.793,0 S438.615,182.071,384.272,127.728z"></path> </g></svg> -->
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
          <h3 class="text-center bg-success text-dark fs-5">
            <div class="d-flex justify-content-center align-items-center">
              <svg  class="d-block"  height="25px" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 393.051 393.051" xml:space="preserve" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path style="fill:#FF667C;" d="M262.109,218.505H130.618c-60.251,0-109.253,49.002-109.253,109.253v65.293h350.319v-65.228 C371.362,267.248,322.683,218.505,262.109,218.505z"></path> <path style="fill:#C19D7B;" d="M237.737,0H154.99c-31.677,0-57.406,25.665-57.406,57.406v63.16h198.077v-63.16 C295.402,25.665,269.737,0,237.737,0z"></path> <g> <circle style="fill:#EEB490;" cx="196.364" cy="208.549" r="49.002"></circle> <circle style="fill:#EEB490;" cx="126.416" cy="120.824" r="28.832"></circle> <circle style="fill:#EEB490;" cx="266.828" cy="120.824" r="28.832"></circle> </g> <path style="fill:#FACCB4;" d="M157.317,63.16c-18.877,0-34.327,14.933-34.586,33.81v0.259v52.105 c0,40.081,31.418,73.891,71.499,75.184c41.632,1.034,75.701-32.259,75.701-73.632V97.164V96.97c0-18.877-15.709-33.81-34.586-33.81 H157.317z"></path> </g></svg>
            </div>
            <c:out value="${usuarioEmail.name}"/>
          </h3>
          <div id="imgModal" class=" d-flex justify-content-around">
            <a href="/lista_deseos/${usuarioEmail.id}" class="btn btn-success btn-sm">
              <img class="img-fluid" style="max-width: 20px; max-height: 20px;" src="/imagenes/carrito.png" alt="carrito">
            </a>
            <a href="/logout" class="btn btn-success btn-sm">
              <img class="img-fluid" style="max-width: 20px; max-height: 20px;" src="/imagenes/logout.png" alt="Cerrar Sesion">
            </a>
          </div>
        </c:if>
      </ul>
    </div>

  </div>
</nav>
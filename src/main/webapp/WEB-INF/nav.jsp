<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

      <link rel="stylesheet" href="/css/styleNav.css">


      <header>

        <a href="/" id="logo">
          <svg viewBox="2 0 24 24" width="50" fill="none">
            <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
            <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
            <g id="SVGRepo_iconCarrier">
              <path
                d="M21 5L19 12H7.37671M20 16H8L6 3H3M13.5 3V9M13.5 3L11.5 5M13.5 3L15.5 5M9 20C9 20.5523 8.55228 21 8 21C7.44772 21 7 20.5523 7 20C7 19.4477 7.44772 19 8 19C8.55228 19 9 19.4477 9 20ZM20 20C20 20.5523 19.5523 21 19 21C18.4477 21 18 20.5523 18 20C18 19.4477 18.4477 19 19 19C19.5523 19 20 19.4477 20 20Z"
                stroke="#94C0A0" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
            </g>
          </svg>
          <h2>Tu<span>Libro</span></h2>
        </a>

        <div class="middleHeader">

          <form role="search" action="/libros/buscar" method="post">
            <input type="search" placeholder="Search" label="Search" name="search" />
            <button type="submit">
              <svg viewBox="0 0 24 24" width="24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                <g id="SVGRepo_iconCarrier">
                  <path
                    d="M11 6C13.7614 6 16 8.23858 16 11M16.6588 16.6549L21 21M19 11C19 15.4183 15.4183 19 11 19C6.58172 19 3 15.4183 3 11C3 6.58172 6.58172 3 11 3C15.4183 3 19 6.58172 19 11Z"
                    stroke="#6fa2dd" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                </g>
              </svg>
            </button>
          </form>
          <p>
            <c:out value="${noPresente}" />
          </p>


          <div class="navbar">
            <a href="/principal">Inicio</a>

            <div class="dropdown">
              <button class="dropbtn">Categorias</button>
              <div class="dropdown-content">
                <a href="/libros/1">Lo nuevo en la libreria</a>
                <a href="/generos/1">Generos</a>
                <a href="/autores/1">Autores</a>
              </div>
            </div>

            <c:if test="${usuarioEmail.id == 1}">
              <div class="dropdown">
                <button class="dropbtn">Observar</button>
                <div class="dropdown-content">
                  <a href="/intercambios/libro/anexar/${usuarioEmail.id}">Publicar Para Intercambiar</a>
                  <a href="/intercambios/libros">Lista Libros Intercambios</a>
                </div>
              </div>
            </c:if>
            <c:if test="${usuarioEmail.id >= 2}">
              <div class="dropdown">
                <button class="dropbtn">Intercambios</button>
                <div class="dropdown-content">
                  <a href="/intercambios/libro/anexar/${usuarioEmail.id}">Publicar Para Intercambiar</a>
                  <a href="/intercambios/libros">Lista Libros Intercambios</a>
                </div>
              </div>
            </c:if>
            <a href="/usuario/quienesSomos">¿Quienes somos?</a>
          </div>
        </div>

        <div class="dropdown">
          <button type="button" class="dropbtn">
            <svg viewBox="0 0 24 24" width="60" fill="none">
              <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
              <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
              <g id="SVGRepo_iconCarrier">
                <path opacity="0.5"
                  d="M22 12C22 17.5228 17.5228 22 12 22C6.47715 22 2 17.5228 2 12C2 6.47715 6.47715 2 12 2C17.5228 2 22 6.47715 22 12Z"
                  fill="#6fa2dd"></path>
                <path
                  d="M16.807 19.0112C15.4398 19.9504 13.7841 20.5 12 20.5C10.2159 20.5 8.56023 19.9503 7.193 19.0111C6.58915 18.5963 6.33109 17.8062 6.68219 17.1632C7.41001 15.8302 8.90973 15 12 15C15.0903 15 16.59 15.8303 17.3178 17.1632C17.6689 17.8062 17.4108 18.5964 16.807 19.0112Z"
                  fill="#6fa2dd"></path>
                <path
                  d="M12 12C13.6569 12 15 10.6569 15 9C15 7.34315 13.6569 6 12 6C10.3432 6 9.00004 7.34315 9.00004 9C9.00004 10.6569 10.3432 12 12 12Z"
                  fill="#6fa2dd"></path>
              </g>
            </svg>
          </button>

          <c:if test="${usuarioEmail == null}">
            <div class="dropdown-content userDropdown">
              <h3>Iniciar Sesion</h3>
              <form action="/usuario/login" method="post">
                <table>
                  <tr>
                    <td>
                      <svg viewBox="0 0 24 24" width="24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                        <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                        <g id="SVGRepo_iconCarrier">
                          <path
                            d="M16 12C16 14.2091 14.2091 16 12 16C9.79086 16 8 14.2091 8 12C8 9.79086 9.79086 8 12 8C14.2091 8 16 9.79086 16 12ZM16 12V13.5C16 14.8807 17.1193 16 18.5 16V16C19.8807 16 21 14.8807 21 13.5V12C21 7.02944 16.9706 3 12 3C7.02944 3 3 7.02944 3 12C3 16.9706 7.02944 21 12 21H16"
                            stroke="#6fa2dd" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                        </g>
                      </svg>
                      <label name="email">Correo</label>
                    </td>
                    <td><input type="email" name="email" placeholder="Ingrese Email" /></td>
                  </tr>
                  <tr>
                    <td>
                      <svg viewBox="0 0 24 24" width="24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                        <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                        <g id="SVGRepo_iconCarrier">
                          <path opacity="0.5"
                            d="M2 12C2 8.22876 2 6.34315 3.17157 5.17157C4.34315 4 6.22876 4 10 4H14C17.7712 4 19.6569 4 20.8284 5.17157C22 6.34315 22 8.22876 22 12C22 15.7712 22 17.6569 20.8284 18.8284C19.6569 20 17.7712 20 14 20H10C6.22876 20 4.34315 20 3.17157 18.8284C2 17.6569 2 15.7712 2 12Z"
                            fill="#6fa2dd"></path>
                          <path
                            d="M12.7504 10C12.7504 9.58579 12.4146 9.25 12.0004 9.25C11.5861 9.25 11.2504 9.58579 11.2504 10V10.7012L10.6429 10.3505C10.2842 10.1434 9.82553 10.2663 9.61842 10.625C9.41131 10.9837 9.53422 11.4424 9.89294 11.6495L10.4999 11.9999L9.8927 12.3505C9.53398 12.5576 9.41108 13.0163 9.61818 13.375C9.82529 13.7337 10.284 13.8566 10.6427 13.6495L11.2504 13.2987V14C11.2504 14.4142 11.5861 14.75 12.0004 14.75C12.4146 14.75 12.7504 14.4142 12.7504 14V13.2993L13.357 13.6495C13.7158 13.8566 14.1745 13.7337 14.3816 13.375C14.5887 13.0163 14.4658 12.5576 14.107 12.3505L13.4999 11.9999L14.1068 11.6495C14.4655 11.4424 14.5884 10.9837 14.3813 10.625C14.1742 10.2663 13.7155 10.1434 13.3568 10.3505L12.7504 10.7006V10Z"
                            fill="#6fa2dd"></path>
                          <path
                            d="M6.73278 9.25C7.147 9.25 7.48278 9.58579 7.48278 10V10.7006L8.08923 10.3505C8.44795 10.1434 8.90664 10.2663 9.11375 10.625C9.32085 10.9837 9.19795 11.4424 8.83923 11.6495L8.23229 11.9999L8.83946 12.3505C9.19818 12.5576 9.32109 13.0163 9.11398 13.375C8.90687 13.7337 8.44818 13.8566 8.08946 13.6495L7.48278 13.2993V14C7.48278 14.4142 7.147 14.75 6.73278 14.75C6.31857 14.75 5.98278 14.4142 5.98278 14V13.2987L5.37513 13.6495C5.01641 13.8566 4.55771 13.7337 4.35061 13.375C4.1435 13.0163 4.26641 12.5576 4.62513 12.3505L5.23229 11.9999L4.62536 11.6495C4.26664 11.4424 4.14373 10.9837 4.35084 10.625C4.55795 10.2663 5.01664 10.1434 5.37536 10.3505L5.98278 10.7012V10C5.98278 9.58579 6.31857 9.25 6.73278 9.25Z"
                            fill="#6fa2dd"></path>
                          <path
                            d="M18.0182 10C18.0182 9.58579 17.6824 9.25 17.2682 9.25C16.854 9.25 16.5182 9.58579 16.5182 10V10.7012L15.9108 10.3505C15.552 10.1434 15.0934 10.2663 14.8863 10.625C14.6791 10.9837 14.802 11.4424 15.1608 11.6495L15.7677 11.9999L15.1605 12.3505C14.8018 12.5576 14.6789 13.0163 14.886 13.375C15.0931 13.7337 15.5518 13.8566 15.9105 13.6495L16.5182 13.2987V14C16.5182 14.4142 16.854 14.75 17.2682 14.75C17.6824 14.75 18.0182 14.4142 18.0182 14V13.2993L18.6249 13.6495C18.9836 13.8566 19.4423 13.7337 19.6494 13.375C19.8565 13.0163 19.7336 12.5576 19.3749 12.3505L18.7677 11.9999L19.3746 11.6495C19.7334 11.4424 19.8563 10.9837 19.6492 10.625C19.442 10.2663 18.9834 10.1434 18.6246 10.3505L18.0182 10.7006V10Z"
                            fill="#6fa2dd"></path>
                        </g>
                      </svg>
                      <label name="password">Contraseña</label>
                    </td>
                    <td><input type="password" name="password" placeholder="Ingrese Clave" /></td>
                  </tr>
                </table>
                <div class="userLinks">
                  <a href="/usuario/registro">
                    <svg fill="#6fa2dd" viewBox="0 0 36 36" width="24" version="1.1" preserveAspectRatio="xMidYMid meet"
                      xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                      <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                      <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                      <g id="SVGRepo_iconCarrier">
                        <title>form-line</title>
                        <path
                          d="M21,12H7a1,1,0,0,1-1-1V7A1,1,0,0,1,7,6H21a1,1,0,0,1,1,1v4A1,1,0,0,1,21,12ZM8,10H20V7.94H8Z"
                          class="clr-i-outline clr-i-outline-path-1"></path>
                        <path
                          d="M21,14.08H7a1,1,0,0,0-1,1V19a1,1,0,0,0,1,1H18.36L22,16.3V15.08A1,1,0,0,0,21,14.08ZM20,18H8V16H20Z"
                          class="clr-i-outline clr-i-outline-path-2"></path>
                        <path
                          d="M11.06,31.51v-.06l.32-1.39H4V4h20V14.25L26,12.36V3a1,1,0,0,0-1-1H3A1,1,0,0,0,2,3V31a1,1,0,0,0,1,1h8A3.44,3.44,0,0,1,11.06,31.51Z"
                          class="clr-i-outline clr-i-outline-path-3"></path>
                        <path d="M22,19.17l-.78.79A1,1,0,0,0,22,19.17Z" class="clr-i-outline clr-i-outline-path-4">
                        </path>
                        <path d="M6,26.94a1,1,0,0,0,1,1h4.84l.3-1.3.13-.55,0-.05H8V24h6.34l2-2H7a1,1,0,0,0-1,1Z"
                          class="clr-i-outline clr-i-outline-path-5"></path>
                        <path
                          d="M33.49,16.67,30.12,13.3a1.61,1.61,0,0,0-2.28,0h0L14.13,27.09,13,31.9a1.61,1.61,0,0,0,1.26,1.9,1.55,1.55,0,0,0,.31,0,1.15,1.15,0,0,0,.37,0l4.85-1.07L33.49,19a1.6,1.6,0,0,0,0-2.27ZM18.77,30.91l-3.66.81L16,28.09,26.28,17.7l2.82,2.82ZM30.23,19.39l-2.82-2.82L29,15l2.84,2.84Z"
                          class="clr-i-outline clr-i-outline-path-6"></path>
                        <rect x="0" y="0" width="36" height="36" fill-opacity="0"></rect>
                      </g>
                    </svg>
                    Registro
                  </a>
                  <button type="submit">
                    <svg fill="#6fa2dd" viewBox="0 0 96 96" width="24" xmlns="http://www.w3.org/2000/svg">
                      <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                      <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                      <g id="SVGRepo_iconCarrier">
                        <title></title>
                        <g>
                          <path
                            d="M43.7578,61.7578a5.9994,5.9994,0,1,0,8.4844,8.4844l18-18a5.9979,5.9979,0,0,0,0-8.4844l-18-18a5.9994,5.9994,0,0,0-8.4844,8.4844L51.5156,42H6A6,6,0,0,0,6,54H51.5156Z">
                          </path>
                          <path
                            d="M90,0H30a5.9966,5.9966,0,0,0-6,6V18a6,6,0,0,0,12,0V12H84V84H36V78a6,6,0,0,0-12,0V90a5.9966,5.9966,0,0,0,6,6H90a5.9966,5.9966,0,0,0,6-6V6A5.9966,5.9966,0,0,0,90,0Z">
                          </path>
                        </g>
                      </g>
                    </svg>
                    Entrar
                  </button>
                </div>

                <p class="errors">
                  <c:out value="${error}" />
                </p>
              </form>
            </div>
          </c:if>

          <c:if test="${not empty usuarioEmail}">
            <div class="dropdown-content userDropdown">
              <div>
                <svg height="25px" version="1.1" id="Layer_1" xmlns:xlink="http://www.w3.org/1999/xlink"
                  viewBox="0 0 393.051 393.051" xml:space="preserve" fill="#000000">
                  <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                  <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                  <g id="SVGRepo_iconCarrier">
                    <path style="fill:#FF667C;"
                      d="M262.109,218.505H130.618c-60.251,0-109.253,49.002-109.253,109.253v65.293h350.319v-65.228 C371.362,267.248,322.683,218.505,262.109,218.505z">
                    </path>
                    <path style="fill:#C19D7B;"
                      d="M237.737,0H154.99c-31.677,0-57.406,25.665-57.406,57.406v63.16h198.077v-63.16 C295.402,25.665,269.737,0,237.737,0z">
                    </path>
                    <g>
                      <circle style="fill:#EEB490;" cx="196.364" cy="208.549" r="49.002"></circle>
                      <circle style="fill:#EEB490;" cx="126.416" cy="120.824" r="28.832"></circle>
                      <circle style="fill:#EEB490;" cx="266.828" cy="120.824" r="28.832"></circle>
                    </g>
                    <path style="fill:#FACCB4;"
                      d="M157.317,63.16c-18.877,0-34.327,14.933-34.586,33.81v0.259v52.105 c0,40.081,31.418,73.891,71.499,75.184c41.632,1.034,75.701-32.259,75.701-73.632V97.164V96.97c0-18.877-15.709-33.81-34.586-33.81 H157.317z">
                    </path>
                  </g>
                </svg>
              </div>
              <h3>
                <c:choose>
                  <c:when test="${usuarioEmail.id == 1}">
                    <c:out value="${usuarioEmail.name}" />
                  </c:when>
                  <c:when test="${usuarioEmail.id >= 2}">
                <a id="perfil" href="/usuario/perfil/${usuarioEmail.id}">
                  <c:out value="${usuarioEmail.name}" />
                </a>
              </c:when>
              </c:choose>
              </h3>
              <div class="userLinks">
                <c:choose>
                  <c:when test="${usuarioEmail.id == 1}">
                    <a href="/usuario/administrador">
                      <svg fill="#248b63" width="25" viewBox="0 0 1920 1920" xmlns="http://www.w3.org/2000/svg"
                        stroke="#248b63">
                        <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                        <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                        <g id="SVGRepo_iconCarrier">
                          <path
                            d="M983.727 5.421 1723.04 353.62c19.765 9.374 32.414 29.252 32.414 51.162v601.525c0 489.6-424.207 719.774-733.779 887.943l-34.899 18.975c-8.47 4.517-17.731 6.889-27.105 6.889-9.262 0-18.523-2.372-26.993-6.89l-34.9-18.974C588.095 1726.08 164 1495.906 164 1006.306V404.78c0-21.91 12.65-41.788 32.414-51.162L935.727 5.42c15.134-7.228 32.866-7.228 48 0ZM757.088 383.322c-176.075 0-319.285 143.323-319.285 319.398 0 176.075 143.21 319.285 319.285 319.285 1.92 0 3.84 0 5.76-.113l58.504 58.503h83.689v116.781h116.781v83.803l91.595 91.482h313.412V1059.05l-350.57-350.682c.114-1.807.114-3.727.114-5.647 0-176.075-143.21-319.398-319.285-319.398Zm0 112.942c113.732 0 206.344 92.724 205.327 216.62l-3.953 37.271 355.426 355.652v153.713h-153.713l-25.412-25.299v-149.986h-116.78v-116.78H868.108l-63.812-63.7-47.209 5.309c-113.732 0-206.344-92.5-206.344-206.344 0-113.732 92.612-206.456 206.344-206.456Zm4.98 124.98c-46.757 0-84.705 37.948-84.705 84.706s37.948 84.706 84.706 84.706c46.757 0 84.706-37.948 84.706-84.706s-37.949-84.706-84.706-84.706Z"
                            fill-rule="evenodd"></path>
                        </g>
                      </svg>
                      Administración
                    </a>
                  </c:when>
                  <c:when test="${usuarioEmail.id >= 2}">
                    <a href="/lista_deseos/${usuarioEmail.id}">
                      <svg viewBox="0 0 48 48" width="25" fill="#000000">
                        <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                        <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                        <g id="SVGRepo_iconCarrier">
                          <title>70 Basic icons by Xicons.co</title>
                          <circle cx="20" cy="40" r="4" fill="#525057"></circle>
                          <path
                            d="M12.3,17.3A2,2,0,0,1,10.41,16L7.59,8H3A2,2,0,0,1,3,4H9a2,2,0,0,1,1.88,1.33l3.3,9.3A2,2,0,0,1,12.3,17.3Z"
                            fill="#c8c8c8"></path>
                          <path
                            d="M41.42,33H16.51a2,2,0,0,1-1.92-1.45L9,12H45.47a2,2,0,0,1,1.95,2.46l-4,17A2,2,0,0,1,41.42,33Z"
                            fill="#4dbe86"></path>
                          <circle cx="38" cy="40" r="4" fill="#525057"></circle>
                        </g>
                      </svg>
                      Carrito
                    </a>
                  </c:when>
                </c:choose>
                <a href="/usuario/logout">
                  <svg width="25px" version="1.1" id="Layer_1" xmlns:xlink="http://www.w3.org/1999/xlink"
                    viewBox="-51.2 -51.2 614.40 614.40" xml:space="preserve" fill="#157347" stroke="#157347"
                    stroke-width="0.00512" transform="matrix(-1, 0, 0, 1, 0, 0)rotate(0)">
                    <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                    <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round" stroke="#CCCCCC"
                      stroke-width="4.096"></g>
                    <g id="SVGRepo_iconCarrier">
                      <polygon style="fill:#F4A026;"
                        points="20.677,256 188.13,383.348 175.002,294.072 371.856,294.072 371.856,215.303 175.002,215.303 188.13,128.652 ">
                      </polygon>
                      <path style="fill:#61ACD2;"
                        d="M121.108,446.359H438.81V65.641H121.108V13.128h344.027c14.501,0,26.188,11.755,26.188,26.256 v433.231c0,14.501-11.687,26.256-26.188,26.256H121.108V446.359z">
                      </path>
                      <path
                        d="M188.131,396.476c2.299,0,4.607-0.603,6.673-1.824c4.595-2.712,7.091-7.936,6.315-13.215L190.201,307.2h182.311 c7.249,0,12.472-5.879,12.472-13.128v-78.769c0-7.249-5.222-13.128-12.472-13.128H190.268l10.841-71.555 c0.801-5.285-1.683-10.53-6.281-13.258c-4.597-2.725-10.39-2.395-14.646,0.842L12.729,245.55c-3.264,2.484-5.18,6.349-5.18,10.45 c0,4.101,1.917,7.966,5.18,10.45l167.453,127.348C182.519,395.574,185.319,396.476,188.131,396.476z M162.013,295.982l8.447,57.433 L42.365,256l127.933-97.293l-8.276,54.629c-0.574,3.782,0.53,7.626,3.026,10.526c2.493,2.901,6.128,4.569,9.954,4.569h183.727 v52.513H175.002c-3.815,0-7.441,1.661-9.935,4.548C162.572,288.378,161.457,292.208,162.013,295.982z">
                      </path>
                      <path
                        d="M465.135,0H121.764c-7.249,0-13.785,5.879-13.785,13.128v52.513c0,7.249,6.535,13.128,13.785,13.128h303.918v354.462 H121.764c-7.249,0-13.785,5.879-13.785,13.128v52.513c0,7.249,6.535,13.128,13.785,13.128h343.371 c22.041,0,39.316-17.668,39.316-39.385V39.385C504.451,17.668,487.176,0,465.135,0z M478.195,472.615 c0,7.117-5.625,13.128-13.06,13.128H134.236v-26.256h305.231c7.249,0,12.472-5.879,12.472-13.128V65.641 c0-7.249-5.222-13.128-12.472-13.128H134.236V26.256h330.899c7.435,0,13.06,6.011,13.06,13.128V472.615z">
                      </path>
                    </g>
                  </svg>
                  Salir
                </a>
              </div>
            </div>
          </c:if>

        </div>
      </header>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrusel</title>
    <link rel="stylesheet" href="css/styleCarrusel.css">
</head>
<body>
    <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <a href="#">
                    <img src="imagenes/amoPerdido.jpg" class="carouselImg d-block w-100 rounded-pill"
                         alt="img">
                </a>
            </div>
            <div class="carousel-item">
                <a href="#">
                    <img src="imagenes/principito.jpg" class="carouselImg d-block w-100 rounded-pill"
                         alt="img">
                </a>
            </div>
            <div class="carousel-item">
                <a href="#">
                    <img src="imagenes/sherlock holmes.jpg" class="carouselImg d-block w-100 rounded-pill" style="height: 350px;"
                        alt="img">
                </a>
            </div>
            <div class="carousel-item">
                <a href="#">
                    <img src="imagenes/don quijote.jpg" class="carouselImg d-block w-100 rounded-pill"
                        alt="img">
                </a>
            </div>
            <div class="carousel-item">
                <a href="#">
                    <img src="imagenes/casas muertas.jpg" class="carouselImg d-block w-100 rounded-pill"
                        alt="img">
                </a>
            </div>
            <div class="carousel-item">
                <a href="#">
                    <img src="imagenes/Canterville.jpg" class="carouselImg d-block w-100 rounded-pill"
                        alt="img">
                </a>
            </div>
            <div class="carousel-item">
                <a href="#">
                    <img src="imagenes/la iliada.jpg" class="carouselImg d-block w-100 rounded-pill"
                         alt="img">
                </a>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying"
            data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying"
            data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</body>
</html>
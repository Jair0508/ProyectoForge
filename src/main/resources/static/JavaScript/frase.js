$(document).ready(function () {
    $(".frase-con-autor .frase").each(function () {
        var frase = $(this).data("text");
        $(this).empty(); // Vacía el contenido del elemento
        var i = 0;
        var interval = setInterval(function () {
            if (i < frase.length) {
                $(this).text($(this).text() + frase.charAt(i));
                i++;
            } else {
                clearInterval(interval);
            }
        }.bind(this), 50);
    });
});
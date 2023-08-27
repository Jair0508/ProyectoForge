package com.grupo8.tulibroapp.validaciones;

import org.springframework.validation.Errors;

public class Util {

    public static void validarSoloTexto(String campo, String textoaValidar, Errors errors) {
        if (!textoaValidar.matches("^[a-zA-ZáéíóúÁÉÍÓÚñÑ,.\\s]*$")) {
            errors.rejectValue(campo, "SoloTexto");
        }
    }

    public static void validarNoNUll(String campo, String textoaValidar, Errors errors) {
        String cadena = textoaValidar;
        if (cadena == null || cadena.trim().isEmpty()) {
            errors.rejectValue(campo, "Notnull");
        }
    }

    public static void validarNoNUll(String campo, Object obj, Errors errors) {
        if (obj == null) {
            errors.rejectValue(campo, "Notnull");
        }
    }

    public static void validarMax_Y_Min(String campo, int max, int min, String textoaValidar, Errors errors) {
        if (textoaValidar.length() < min || textoaValidar.length() > max) {
            errors.rejectValue(campo, "MinYMax", "minimo " + min + " y maximo " + max + "carecteres posibles.");
            ;
        }
    }

    public static void validarSoloDecimales(String campo, String textoaValidar, Errors errors) {
        if (!textoaValidar.matches("^\\d+\\.\\d{2}$")) {
            errors.rejectValue(campo, "SoloDecimales");
        }
    }

    public static void validarSoloEnteros(String campo, String textoaValidar, Errors errors) {
        if (!textoaValidar.matches("^\\d+$")) {
            errors.rejectValue(campo, "SoloEnteros");
        }
    }
}

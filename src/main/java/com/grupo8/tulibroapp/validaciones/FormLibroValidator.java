package com.grupo8.tulibroapp.validaciones;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.grupo8.tulibroapp.Modelos.FormLibro;

@Component
public class FormLibroValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return FormLibro.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        FormLibro formlibro = (FormLibro) target;
        Util.validarNoNUll("nombreLibro", formlibro.getNombreLibro(), errors);
        Util.validarNoNUll("descripcionLibro", formlibro.getDescripcionLibro(), errors);
        Util.validarNoNUll("precioLibro", formlibro.getPrecioLibro(), errors);
        Util.validarNoNUll("cantidadLibro", formlibro.getCantidadLibro(), errors);
        Util.validarNoNUll("nombreGenero", formlibro.getNombreGenero(), errors);
        Util.validarNoNUll("nombreAutor", formlibro.getNombreAutor(), errors);
        Util.validarNoNUll("descripcionAutor", formlibro.getDescripcionAutor(), errors);
        Util.validarNoNUll("fraseAutor", formlibro.getFraseAutor(), errors);

        Util.validarSoloTexto("nombreLibro", formlibro.getNombreLibro(), errors);
        Util.validarSoloTexto("descripcionLibro", formlibro.getDescripcionLibro(), errors);
        Util.validarSoloTexto("nombreGenero", formlibro.getNombreGenero(), errors);
        Util.validarSoloTexto("nombreAutor", formlibro.getNombreAutor(), errors);
        Util.validarSoloTexto("descripcionAutor", formlibro.getDescripcionAutor(), errors);
        Util.validarSoloTexto("fraseAutor", formlibro.getFraseAutor(), errors);

        Util.validarSoloDecimales("precioLibro", formlibro.getPrecioLibro(), errors);
        Util.validarSoloEnteros("cantidadLibro", formlibro.getCantidadLibro(), errors);
    }

}

package com.grupo8.tulibroapp.validaciones;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.grupo8.tulibroapp.Modelos.Libro;

@Component
public class LibroValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return Libro.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Libro libro = (Libro) target;
        Util.validarNoNUll("nombre", libro.getNombre(), errors);
        Util.validarNoNUll("descripcion", libro.getDescripcion(), errors);
        Util.validarNoNUll("precio", libro.getPrecio(), errors);
        Util.validarNoNUll("cantidad", libro.getCantidad(), errors);
        // Util.validarNoNUll("autor", libro.getAutor(), errors);
        // Util.validarNoNUll("genero", libro.getGenero(), errors);
        Util.validarSoloTexto("nombre", libro.getNombre(), errors);
        Util.validarSoloTexto("descripcion", libro.getDescripcion(), errors);
    }

}

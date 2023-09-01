package com.grupo8.tulibroapp.validaciones;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.grupo8.tulibroapp.Modelos.DetalleOrden;

@Component
public class DetalleOrdenVlidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return DetalleOrden.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        DetalleOrden orden = (DetalleOrden) target;
        Util.validarNoNUll("nombre", orden.getNombre(), errors);
        Util.validarNoNUll("departamento", orden.getDepartamento(), errors);
        Util.validarNoNUll("municipio", orden.getMunicipio(), errors);
        Util.validarNoNUll("direccion", orden.getDireccion(), errors);
        Util.validarNoNUll("cantidad", orden.getCantidad(), errors);

        Util.validarSoloTexto("nombre", orden.getNombre(), errors);
        Util.validarSoloTexto("departamento", orden.getDepartamento(), errors);
        Util.validarSoloTexto("municipio", orden.getMunicipio(), errors);

    }

}

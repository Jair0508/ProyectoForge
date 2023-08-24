package com.grupo8.tulibroapp.validaciones;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.grupo8.tulibroapp.Modelos.Usuario;
import com.grupo8.tulibroapp.Servicio.ServicioUsuario;



@Component
public class UserValidator implements Validator {


    @Autowired private ServicioUsuario servicioUsuario;

    @Override
    public boolean supports(Class<?> clazz) {
        return Usuario.class.equals(clazz);
    }

    // 2
    @Override
    public void validate(Object target, Errors errors) {
        Usuario usuario = (Usuario) target;
        Util.validarNoNUll("name", usuario.getName(), errors);
        Util.validarNoNUll("email", usuario.getEmail(), errors);
        Util.validarNoNUll("password", usuario.getPassword(), errors);
        Util.validarNoNUll("passwordConfirmation", usuario.getPasswordConfirmation(), errors);
        Util.validarSoloTexto("name", usuario.getName(), errors);
        Util.validarMax_Y_Min("name", 30, 2, usuario.getName(), errors);
        Util.validarMax_Y_Min("password", 30, 2, usuario.getPassword(), errors);
        validarEmail(usuario, errors);
        validarPassword(usuario, errors);
    }

    private void validarPassword(Usuario usuario, Errors errors) {
        if (!usuario.getPassword().equals(usuario.getPasswordConfirmation())) {
            errors.rejectValue("passwordConfirmation", "PasswordInvalido");
        }
    }

    private void validarEmail(Usuario usuario, Errors errors) {
        Usuario usuarioEmail = servicioUsuario.findByEmail(usuario.getEmail());
        if (usuarioEmail != null) {
            errors.rejectValue("email", "EmailOcuapdo");
        }
    }
}

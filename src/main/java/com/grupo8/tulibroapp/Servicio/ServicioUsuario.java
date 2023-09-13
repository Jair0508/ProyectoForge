package com.grupo8.tulibroapp.Servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import com.grupo8.tulibroapp.Modelos.Usuario;
import com.grupo8.tulibroapp.Repositorio.RepositorioUsuario;

@Service
public class ServicioUsuario extends ServicioBase<Usuario>{

    @Autowired private RepositorioUsuario repositorioUsuario;
    
    public Usuario registerUser(Usuario usuario) {
        String hashed = BCrypt.hashpw(usuario.getPassword(), BCrypt.gensalt());
        usuario.setPassword(hashed);
        return repositorioUsuario.save(usuario);
    }

    public Usuario findByEmail(String email) {
        return repositorioUsuario.findByEmail(email);
    }

    public boolean authenticateUser(String email, String password) {
        Usuario usuario = repositorioUsuario.findByEmail(email);
        if (usuario == null) {
            return false;
        } else {
            if (BCrypt.checkpw(password, usuario.getPassword())) {
                return true;
            } else {
                return false;
            }
        }
    }

    public List<Usuario> findByEmailIsNotNull() {
        return repositorioUsuario.findByEmailIsNotNull();
    }

    public List<Usuario> findByEmailIsNull() {
        return repositorioUsuario.findByEmailIsNull();
    }

}

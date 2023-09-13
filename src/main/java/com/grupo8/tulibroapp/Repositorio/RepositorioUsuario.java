package com.grupo8.tulibroapp.Repositorio;


import java.util.List;

import com.grupo8.tulibroapp.Modelos.Usuario;


public interface RepositorioUsuario extends RepositorioBase<Usuario> {

    Usuario findByEmail(String email);

    List<Usuario> findByEmailIsNotNull();
   
    List<Usuario> findByEmailIsNull();
}

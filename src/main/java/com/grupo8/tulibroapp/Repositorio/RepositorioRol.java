package com.grupo8.tulibroapp.Repositorio;

import com.grupo8.tulibroapp.Modelos.Rol;

public interface RepositorioRol extends RepositorioBase<Rol>{
    
    Rol findByNombreContaining(String nombre);

}

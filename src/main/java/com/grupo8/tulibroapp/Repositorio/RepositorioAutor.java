package com.grupo8.tulibroapp.Repositorio;

import com.grupo8.tulibroapp.Modelos.Autor;

public interface RepositorioAutor extends RepositorioBase<Autor>{
    
    Autor findByNombre(String nombre);
}

package com.grupo8.tulibroapp.Repositorio;

import com.grupo8.tulibroapp.Modelos.Genero;

public interface RepositorioGenero extends RepositorioBase<Genero>{

    Genero findByNombreGenero(String nombreGenero);
    
}

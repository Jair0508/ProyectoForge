package com.grupo8.tulibroapp.Servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo8.tulibroapp.Modelos.Libro;
import com.grupo8.tulibroapp.Repositorio.RepositorioLibro;

@Service
public abstract class ServicioLibro extends ServicioBase<Libro> {

    @Autowired
    RepositorioLibro repositorioLibro;

    
}


package com.grupo8.tulibroapp.Servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo8.tulibroapp.Modelos.Autor;
import com.grupo8.tulibroapp.Repositorio.RepositorioAutor;

@Service
public class ServicioAutor extends ServicioBase<Autor>{

    @Autowired
    private RepositorioAutor repositorioAutor;

    
}
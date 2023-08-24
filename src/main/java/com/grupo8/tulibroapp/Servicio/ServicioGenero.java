package com.grupo8.tulibroapp.Servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo8.tulibroapp.Modelos.Genero;
import com.grupo8.tulibroapp.Repositorio.RepositorioGenero;

@Service
public class ServicioGenero extends ServicioBase<Genero>{
    
    @Autowired 
    private RepositorioGenero repositorioGenero;
}

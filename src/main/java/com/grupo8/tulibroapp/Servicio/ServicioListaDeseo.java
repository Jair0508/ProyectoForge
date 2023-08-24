package com.grupo8.tulibroapp.Servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo8.tulibroapp.Modelos.ListaDeseo;
import com.grupo8.tulibroapp.Repositorio.RepositorioListaDeseo;



@Service
public class ServicioListaDeseo extends ServicioBase<ListaDeseo> {

    @Autowired
    private RepositorioListaDeseo repositorioListaDeseo;
}

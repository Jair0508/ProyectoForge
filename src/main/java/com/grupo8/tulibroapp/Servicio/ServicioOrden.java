package com.grupo8.tulibroapp.Servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo8.tulibroapp.Modelos.Orden;
import com.grupo8.tulibroapp.Repositorio.RepositorioOrden;

@Service
public class ServicioOrden extends ServicioBase<Orden> {

    @Autowired
    private RepositorioOrden repositorioOrden;
}

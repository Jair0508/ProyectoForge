package com.grupo8.tulibroapp.Servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo8.tulibroapp.Modelos.DetalleOrden;
import com.grupo8.tulibroapp.Repositorio.RepositorioDetalleOrden;

@Service
public class ServicioDetalleOrden extends ServicioBase<DetalleOrden> {

    @Autowired
    private RepositorioDetalleOrden repositorioDetalleOrden;

}

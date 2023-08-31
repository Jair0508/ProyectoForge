package com.grupo8.tulibroapp.Servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo8.tulibroapp.Modelos.DetalleOrden;
import com.grupo8.tulibroapp.Repositorio.RepositorioDetalleOrden;

@Service
public class ServicioDetalleOrden extends ServicioBase<DetalleOrden> {

    @Autowired
    private RepositorioDetalleOrden repositorioDetalleOrden;

    public List<DetalleOrden> getDetalleOrdenesByUsuarioId(Long usuarioId) {
        return repositorioDetalleOrden.findAllByUsuarioId(usuarioId);
    }
}

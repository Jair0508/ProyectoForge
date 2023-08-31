package com.grupo8.tulibroapp.Repositorio;

import java.util.List;

import com.grupo8.tulibroapp.Modelos.DetalleOrden;

public interface RepositorioDetalleOrden extends RepositorioBase<DetalleOrden> {

    List<DetalleOrden> findAllByUsuarioId(Long usuarioId);
}

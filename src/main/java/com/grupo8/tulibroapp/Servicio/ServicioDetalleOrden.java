package com.grupo8.tulibroapp.Servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo8.tulibroapp.Modelos.DetalleOrden;
import com.grupo8.tulibroapp.Modelos.LibroVenta;
import com.grupo8.tulibroapp.Modelos.Usuario;
import com.grupo8.tulibroapp.Repositorio.RepositorioDetalleOrden;

@Service
public class ServicioDetalleOrden extends ServicioBase<DetalleOrden> {

    @Autowired
    private RepositorioDetalleOrden repositorioDetalleOrden;

    @Autowired
    private ServicioLibroVenta servicioLibroVenta;

    public List<DetalleOrden> getDetalleOrdenesByUsuarioId(Long usuarioId) {
        return repositorioDetalleOrden.findAllByUsuarioId(usuarioId);
    }

    public void eliminarDetalleOrden(Long ordenId) {
        DetalleOrden detalleOrden = repositorioDetalleOrden.findById(ordenId).orElse(null);
        if (detalleOrden != null) {
            LibroVenta libroVenta = detalleOrden.getLibroVenta();
            Usuario usuario = detalleOrden.getUsuario();

            // Eliminar la referencia en LibroVenta
            // libroVenta.getUsuariosOrdenes().remove(usuario);
            // servicioLibroVenta.save(libroVenta);

            // Finalmente, eliminar el DetalleOrden
            repositorioDetalleOrden.delete(detalleOrden);
        }
    }
}

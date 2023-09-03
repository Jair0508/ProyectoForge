package com.grupo8.tulibroapp.Servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import com.grupo8.tulibroapp.Modelos.LibroVenta;
import com.grupo8.tulibroapp.Repositorio.RepositorioLibroVenta;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class ServicioLibroVenta extends ServicioBase<LibroVenta> {

    @Autowired
    private RepositorioLibroVenta repositorioLibroVenta;

    public LibroVenta findByNombre(String nombre) {
        LibroVenta nombreLibro = repositorioLibroVenta.findByNombre(nombre);
        return nombreLibro;
    }

    private static final int PAGE_SIZE = 3; // aqui se implementaas los cambios del contenido, si ver 5 libros o 3

    public Page<LibroVenta> libroVentaPerPage(int pageNumber) {
        PageRequest pageRequest = PageRequest.of(pageNumber, PAGE_SIZE);
        Page<LibroVenta> libroVenta = repositorioLibroVenta.findAll(pageRequest);
        return libroVenta;
    }

    public LibroVenta findByNombreContainingIgnoreCase(String nombre) {
        LibroVenta libro = repositorioLibroVenta.findByNombreContainingIgnoreCase(nombre);
        return libro;
    }

    // Consulta Random
    public List<LibroVenta> findAllRandomOrder() {
        return repositorioLibroVenta.findAllRandomOrder();
    }

    public Page<LibroVenta> obtenerLibrosPorGenero(Long generoId, int pageNumber, int pageSize) {
        PageRequest pageable = PageRequest.of(pageNumber, pageSize);
        return repositorioLibroVenta.findByGeneroId(generoId, pageable);
    }
}

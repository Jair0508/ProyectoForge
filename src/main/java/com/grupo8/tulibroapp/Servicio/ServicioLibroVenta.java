package com.grupo8.tulibroapp.Servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.grupo8.tulibroapp.Modelos.Autor;
import com.grupo8.tulibroapp.Modelos.Genero;
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

    private static final int PAGE_SIZE = 15; // aqui se implementaas los cambios del contenido, si ver 5 libros o 3

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

    public Page<LibroVenta> obtenerLibroPorAutor(Long autorId, int pageNumber, int pageSize) {
        PageRequest pageable = PageRequest.of(pageNumber, pageSize);
        return repositorioLibroVenta.findByAutorId(autorId, pageable);
    }

    public List<LibroVenta> findByAutorIsNull() {
        return repositorioLibroVenta.findByAutorIsNull();
    }

    public List<LibroVenta> findByAutor(Autor autor) {
        return repositorioLibroVenta.findByAutor(autor);
    }

    public List<LibroVenta> findByGeneroIsNull() {
        return repositorioLibroVenta.findByGeneroIsNull();
    }

    public List<LibroVenta> findByGenero(Genero genero) {
        return repositorioLibroVenta.findByGenero(genero);
    }
}

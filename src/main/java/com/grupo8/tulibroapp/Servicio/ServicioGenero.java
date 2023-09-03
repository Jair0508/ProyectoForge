package com.grupo8.tulibroapp.Servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.grupo8.tulibroapp.Modelos.Genero;
import com.grupo8.tulibroapp.Repositorio.RepositorioGenero;

@Service
public class ServicioGenero extends ServicioBase<Genero> {

    @Autowired
    private RepositorioGenero repositorioGenero;

    public Genero findByNombreGenero(String nombreGenero) {
        Genero nombre = repositorioGenero.findByNombreGenero(nombreGenero);
        return nombre;
    }

    private static final int PAGE_SIZE = 1; // aqui se implementaas los cambios del contenido, si ver 5 libros o 3

    public Page<Genero> generoPorPage(int pageNumber) {
        PageRequest pageRequest = PageRequest.of(pageNumber, PAGE_SIZE);
        Page<Genero> genero = repositorioGenero.findAll(pageRequest);
        return genero;
    }
}

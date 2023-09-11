package com.grupo8.tulibroapp.Servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.grupo8.tulibroapp.Modelos.Autor;
import com.grupo8.tulibroapp.Repositorio.RepositorioAutor;

@Service
public class ServicioAutor extends ServicioBase<Autor> {

    @Autowired
    private RepositorioAutor repositorioAutor;

    public Autor findByNombre(String autor) {
        Autor autorNombre = repositorioAutor.findByNombre(autor);
        return autorNombre;
    }

    private static final int PAGE_SIZE = 15; // aqui se implementaas los cambios del contenido, si ver 5 libros o 3

    public Page<Autor> autorPorPage(int pageNumber) {
        PageRequest pageRequest = PageRequest.of(pageNumber, PAGE_SIZE);
        Page<Autor> autor = repositorioAutor.findAll(pageRequest);
        return autor;
    }

    public List<Autor> findAllRandomOrder() {
        return repositorioAutor.findAllRandomOrder();
    }
}
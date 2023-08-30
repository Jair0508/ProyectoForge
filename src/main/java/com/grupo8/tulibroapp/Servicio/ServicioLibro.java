package com.grupo8.tulibroapp.Servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.grupo8.tulibroapp.Modelos.Libro;
import com.grupo8.tulibroapp.Repositorio.RepositorioLibro;

@Service
public class ServicioLibro extends ServicioBase<Libro> {

    @Autowired
    private RepositorioLibro repositorioLibro;

    public Page<Libro> findAll(Pageable pageable){
        Page<Libro> pagesLibro = repositorioLibro.findAll(pageable);
        return pagesLibro;
    }
}

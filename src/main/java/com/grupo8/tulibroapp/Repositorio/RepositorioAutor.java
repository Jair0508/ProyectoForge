package com.grupo8.tulibroapp.Repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.grupo8.tulibroapp.Modelos.Autor;

public interface RepositorioAutor extends RepositorioBase<Autor>{
    
    Autor findByNombre(String nombre);

    @Query(value = "SELECT * FROM autores ORDER BY RAND() LIMIT 1", nativeQuery = true)
    List<Autor> findAllRandomOrder();
}

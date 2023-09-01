package com.grupo8.tulibroapp.Repositorio;


import org.springframework.data.repository.NoRepositoryBean;

import com.grupo8.tulibroapp.Modelos.Libro;

@NoRepositoryBean
public interface RepositorioLibro extends RepositorioBase<Libro> {

    
}

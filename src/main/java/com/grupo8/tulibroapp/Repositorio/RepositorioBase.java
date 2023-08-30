package com.grupo8.tulibroapp.Repositorio;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface RepositorioBase<T> extends CrudRepository<T, Long>{
 
    //Funcionando

    List<T> findAll();

    Page<T> findAll(Pageable pageable);
}

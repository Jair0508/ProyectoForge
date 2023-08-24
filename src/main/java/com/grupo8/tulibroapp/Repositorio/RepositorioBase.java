package com.grupo8.tulibroapp.Repositorio;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface RepositorioBase<T> extends CrudRepository<T, Long>{
 
    //Funcionando

    List<T> findAll();

}

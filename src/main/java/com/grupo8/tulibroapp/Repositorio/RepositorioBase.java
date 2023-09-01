package com.grupo8.tulibroapp.Repositorio;

import java.util.List;


import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.data.repository.PagingAndSortingRepository;


@NoRepositoryBean
public interface RepositorioBase<T> extends CrudRepository<T, Long>,  PagingAndSortingRepository<T, Long> {
 
 

    List<T> findAll();

}

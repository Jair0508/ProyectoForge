package com.grupo8.tulibroapp.Repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.grupo8.tulibroapp.Modelos.LibroIntercambio;

public interface RepositorioLibroIntercambio  extends RepositorioBase<LibroIntercambio>{

    @Query("SELECT l FROM LibroIntercambio l ORDER BY l.createdAt DESC")
    List<LibroIntercambio> findAllOrderByCreatedAtDesc();
    
}

package com.grupo8.tulibroapp.Repositorio;


import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.grupo8.tulibroapp.Modelos.LibroVenta;

public interface RepositorioLibroVenta extends RepositorioBase<LibroVenta>{
    
    LibroVenta findByNombre(String nombre);

    LibroVenta findByNombreContainingIgnoreCase(String nombre);

    @Query("SELECT lv.genero.nombreGenero FROM LibroVenta lv WHERE lv.genero = :genero")
    List<String> findGeneroNombreByGenero(@Param("genero") String genero);


}

package com.grupo8.tulibroapp.Repositorio;

import com.grupo8.tulibroapp.Modelos.LibroVenta;

public interface RepositorioLibroVenta extends RepositorioBase<LibroVenta>{
    
    LibroVenta findByNombre(String nombre);
}

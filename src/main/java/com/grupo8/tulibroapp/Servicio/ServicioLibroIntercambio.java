package com.grupo8.tulibroapp.Servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo8.tulibroapp.Modelos.LibroIntercambio;
import com.grupo8.tulibroapp.Repositorio.RepositorioLibroIntercambio;

@Service
public class ServicioLibroIntercambio  extends ServicioBase<LibroIntercambio>{
    
    @Autowired
    private RepositorioLibroIntercambio repositorioLibroIntercambio;

    public List<LibroIntercambio> findAllOrderByCreatedAtDesc(){
        return repositorioLibroIntercambio.findAllOrderByCreatedAtDesc();
    }
}

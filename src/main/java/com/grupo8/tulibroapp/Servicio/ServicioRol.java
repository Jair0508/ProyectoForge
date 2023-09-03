package com.grupo8.tulibroapp.Servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo8.tulibroapp.Modelos.Rol;
import com.grupo8.tulibroapp.Repositorio.RepositorioRol;

@Service
public class ServicioRol extends ServicioBase<Rol> {

    @Autowired
    private RepositorioRol repositorioRol;

    public Rol findByNombreContaining(String nombre){
        Rol rol = repositorioRol.findByNombreContaining(nombre);
        return rol;
    }

    public void saveAll(List<Rol> rol){
        repositorioRol.saveAll(rol);
    }

}

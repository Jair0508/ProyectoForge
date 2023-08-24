package com.grupo8.tulibroapp.Servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo8.tulibroapp.Repositorio.RepositorioBase;

@Service
public abstract class ServicioBase<T> {
    
    @Autowired private RepositorioBase<T> repositorioBase;

    

    public List<T> findAll() {
        return repositorioBase.findAll();
    }

    public T save(T object) {
        return repositorioBase.save(object);
    }

    public T findById(Long Id) {
        Optional<T> optional = repositorioBase.findById(Id);
        if (optional.isPresent()) {
            return optional.get();
        } else {
            return null;
        }
    }

    public T update(T object) {
        return save(object);
    }

    public void delete(Long Id) {
        repositorioBase.deleteById(Id);
    }
}

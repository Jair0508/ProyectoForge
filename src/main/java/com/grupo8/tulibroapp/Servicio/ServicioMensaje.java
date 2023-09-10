package com.grupo8.tulibroapp.Servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo8.tulibroapp.Modelos.Mensaje;
import com.grupo8.tulibroapp.Repositorio.RepositorioMensaje;

@Service
public class ServicioMensaje extends ServicioBase<Mensaje> {

  @Autowired
  RepositorioMensaje repositorioMensaje;

}
package com.grupo8.tulibroapp.Servicio;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grupo8.tulibroapp.Modelos.Mensaje;
import com.grupo8.tulibroapp.Modelos.Usuario;
import com.grupo8.tulibroapp.Repositorio.RepositorioMensaje;

@Service
public class ServicioMensaje extends ServicioBase<Mensaje> {

    @Autowired
    private RepositorioMensaje repositorioMensaje;
    
    public List<Mensaje> findMensajesByRemitenteYDestinatario(Long remitenteId, Long destinatarioId) {
        return repositorioMensaje.findMensajesByRemitenteYDestinatario(remitenteId, destinatarioId);
    }

    public Set<Usuario> findByRemitenteAndDestinatario(Usuario remitente) {
        // Obtener mensajes entre el remitente y cualquier destinatario
        List<Mensaje> mensajes = repositorioMensaje.findByRemitenteAndDestinatario(remitente, remitente);

        // Extraer destinatarios únicos de los mensajes
        Set<Usuario> destinatarios = mensajes.stream()
                .map(Mensaje::getDestinatario)
                .collect(Collectors.toSet());

        return destinatarios;
    }
}

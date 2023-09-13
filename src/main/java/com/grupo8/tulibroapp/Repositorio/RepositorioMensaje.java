package com.grupo8.tulibroapp.Repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.grupo8.tulibroapp.Modelos.Mensaje;
import com.grupo8.tulibroapp.Modelos.Usuario;

public interface RepositorioMensaje extends RepositorioBase<Mensaje> {

        @Query("SELECT m FROM Mensaje m " +
                        "WHERE (m.remitente.id = :remitenteId AND m.destinatario.id = :destinatarioId) " +
                        "OR (m.remitente.id = :destinatarioId AND m.destinatario.id = :remitenteId) " +
                        "ORDER BY m.createdAt ASC")
        List<Mensaje> findMensajesByRemitenteYDestinatario(
                        @Param("remitenteId") Long remitenteId,
                        @Param("destinatarioId") Long destinatarioId);


        // Trae los usuarios con quien interactuo
        @Query("SELECT DISTINCT u FROM Usuario u WHERE u IN " +
                        "(SELECT m.remitente FROM Mensaje m WHERE m.destinatario = :usuarioActual) " +
                        "OR u IN (SELECT m.destinatario FROM Mensaje m WHERE m.remitente = :usuarioActual)")
        List<Usuario> findUsuariosInteractuados(@Param("usuarioActual") Usuario usuarioActual);

        List<Mensaje> findByRemitenteAndDestinatario(Usuario remitente, Usuario destinatario);

        List<Mensaje> findByDestinatarioAndRemitente(Usuario destinatario, Usuario remitente);

        

}

package com.grupo8.tulibroapp.Repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.grupo8.tulibroapp.Modelos.Mensaje;

public interface RepositorioMensaje extends RepositorioBase<Mensaje> {

        @Query("SELECT m FROM Mensaje m " +
                        "WHERE (m.remitente.id = :remitenteId AND m.destinatario.id = :destinatarioId) " +
                        "OR (m.remitente.id = :destinatarioId AND m.destinatario.id = :remitenteId) " +
                        "ORDER BY m.id ASC")
        List<Mensaje> findMensajesByRemitenteYDestinatario(
                        @Param("remitenteId") Long remitenteId,
                        @Param("destinatarioId") Long destinatarioId);

        @Query("SELECT m FROM Mensaje m WHERE m.destinatario.id = :usuarioId")
        List<Mensaje> findMensajesRecibidosPorUsuario(@Param("usuarioId") Long usuarioId);

        @Query("SELECT m FROM Mensaje m WHERE m.remitente.id = :usuarioId")
        List<Mensaje> findMensajesEnviadosPorUsuario(@Param("usuarioId") Long usuarioId);

}

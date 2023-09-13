package com.grupo8.tulibroapp.Modelos;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "mensajes")
@Getter
@Setter
@NoArgsConstructor
public class Mensaje extends ModeloBase{
    
    @Size(min = 1)
    @NotBlank(message = "No debe tener mensajes en blanco")
    @NotNull
    private String contenido;
 
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "remitente_id")
    private Usuario remitente;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "destinatario_id")
    private Usuario destinatario;

}

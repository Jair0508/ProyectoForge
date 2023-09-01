package com.grupo8.tulibroapp.Modelos;

import java.util.List;
import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.Table;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@MappedSuperclass
@Getter
@Setter
@NoArgsConstructor
public abstract class Libro extends ModeloBase {

    @Size(min = 2, max = 15, message = "No debe ser mayor a 15 caracteres ni menor a 2 caracteres")
    @NotBlank(message = "No debe tener espacios en blanco")
    @NotNull
    private String nombre;

    @NotBlank(message = "No debe tener espacios en blanco")
    @NotNull
    @Size(min=5, max=70, message="Solo se aceptan 5 caracteres minimos y 70 caracteres maximos")
    private String descripcion;

    // @ManyToMany(fetch = FetchType.LAZY)
    // @JoinTable(name = "lista_deseo", joinColumns = @JoinColumn(name = "libro_id"), inverseJoinColumns = @JoinColumn(name = "usuario_id"))
    // private Set<Usuario> usuarios;

    // @ManyToMany(fetch = FetchType.LAZY)
    // @JoinTable(name = "detalle_orden_compra", joinColumns = @JoinColumn(name = "libro_id"), inverseJoinColumns = @JoinColumn(name = "usuario_id"))
    // private List<Usuario> usuariosOrdenes;

    // @Valid
    // @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    // @JoinColumn(name = "autor_id")
    // private Autor autor;

    // @Valid
    // @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    // @JoinColumn(name = "genero_id")
    // private Genero genero;
}

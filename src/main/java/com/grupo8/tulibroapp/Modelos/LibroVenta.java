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
import jakarta.persistence.Table;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "libros_ventas")
@Getter
@Setter
@NoArgsConstructor
public class LibroVenta extends Libro {

    @NotNull(message = "No debe estar vacio")
    @Min(value = 1, message = "Precio mínimo permitida es 1")
    private Double precio;

    @NotNull(message = "No debe estar vacio")
    @Min(value = 1, message = "La cantidad mínima permitida es 1")
    private Integer cantidad;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "lista_deseo", joinColumns = @JoinColumn(name = "libro_venta_id"), inverseJoinColumns = @JoinColumn(name = "usuario_id"))
    private Set<Usuario> usuarios;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "detalle_orden_compra", joinColumns = @JoinColumn(name = "libro_venta_id"), inverseJoinColumns = @JoinColumn(name = "usuario_id"))
    private List<Usuario> usuariosOrdenes;

    @Valid
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "autor_id")
    private Autor autor;

    @Valid
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "genero_id")
    private Genero genero;
}

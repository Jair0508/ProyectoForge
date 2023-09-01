package com.grupo8.tulibroapp.Modelos;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "detalle_orden_compra")
public class DetalleOrden extends ModeloBase {

    @Size(min = 10, max = 50, message = "No debe ser mayor a 50 caracteres ni menor a 10 caracteres")
    @NotBlank(message = "No debe tener espacios en blanco")
    @NotNull
    private String nombre;

    @Size(min = 2, max = 20, message = "No debe ser mayor a 20 caracteres ni menor a 2 caracteres")
    @NotBlank(message = "No debe tener espacios en blanco")
    @NotNull
    private String departamento;

    @Size(min = 2, max = 20, message = "No debe ser mayor a 20 caracteres ni menor a 2 caracteres")
    @NotBlank(message = "No debe tener espacios en blanco")
    @NotNull
    private String municipio;

    @NotBlank(message = "No debe tener espacios en blanco")
    @NotNull
    private String direccion;

    @Min(value = 1, message = "La cantidad mínima permitida es 1")
    private Integer cantidad;

    private String detalle;

    private Double precioUnitario;

    private Double precioTotal;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "libro_venta_id")
    private LibroVenta libroVenta;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "usuario_id")
    private Usuario usuario;

}

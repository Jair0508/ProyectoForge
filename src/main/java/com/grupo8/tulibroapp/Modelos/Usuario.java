package com.grupo8.tulibroapp.Modelos;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "usuarios")
public class Usuario extends ModeloBase {

    @Size(min = 2, max = 50, message = "No debe ser mayor a 50 caracteres ni menor a 2 caracteres")
    @NotBlank(message = "No debe tener espacios en blanco")
    @NotNull
    private String name;

    @Email
    @Column(name = "email", unique = true)
    @NotBlank(message = "No debe tener espacios en blanco")
    @NotNull
    private String email;

    @Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*\\d).{8,}$", message = "Solo 8 caracteres que contenga letras y numeros")
    @Size(min = 8, message = "Solo 8 caracteres que contenga letras y numeros")
    private String password;

    @Transient
    private String passwordConfirmation;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "detalle_orden_compra", joinColumns = @JoinColumn(name = "usuario_id"), inverseJoinColumns = @JoinColumn(name = "libro_venta_id"))
    private List<LibroVenta> librosOrdenes;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "lista_deseo", joinColumns = @JoinColumn(name = "usuario_id"), inverseJoinColumns = @JoinColumn(name = "libro_venta_id"))
    private List<LibroVenta> libroVenta;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "rol_id")
    private Rol rol;

    public void agregarLibro(LibroVenta libro) {
        libroVenta.add(libro);
    }

    public void quitarLibro(LibroVenta libro) {
        libroVenta.remove(libro);
    }
}
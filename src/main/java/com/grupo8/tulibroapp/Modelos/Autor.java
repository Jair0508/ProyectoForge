package com.grupo8.tulibroapp.Modelos;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "autores")
@Getter
@Setter
@NoArgsConstructor
public class Autor extends ModeloBase {

    @NotBlank(message = "Campo no debe estar vacio")
    @NotNull
    private String nombre;

    @Size(min = 2, max = 500, message = "No debe ser mayor a 500 caracteres ni menor a 2 caracteres")
    @NotBlank(message = "Campo no debe estar vacio")
    @NotNull
    private String descripcion;

    @NotBlank(message = "Campo no debe estar vacio")
    @NotNull
    private String frase;

    @OneToMany(mappedBy = "autor", fetch = FetchType.LAZY)
    private List<LibroVenta> libroVentas;

    @OneToMany(mappedBy = "autor", fetch = FetchType.LAZY)
    private List<LibroIntercambio> libroIntercambios;
}

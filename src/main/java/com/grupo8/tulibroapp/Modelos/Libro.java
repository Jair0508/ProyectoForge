package com.grupo8.tulibroapp.Modelos;

import jakarta.persistence.MappedSuperclass;
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

    @Size(min = 2, max = 25, message = "No debe ser mayor a 25 caracteres ni menor a 2 caracteres")
    @NotBlank(message = "No debe tener espacios en blanco")
    @NotNull
    @Pattern(regexp = "^[^\\p{P}\\p{S}]+$", message = "Solo expresiones numericas o letras")
    private String nombre;

    @NotBlank(message = "No debe tener espacios en blanco")
    @NotNull
    @Size(min = 5, max = 500, message = "Solo se aceptan 5 caracteres minimos y 500 caracteres maximos")
    private String descripcion;

}

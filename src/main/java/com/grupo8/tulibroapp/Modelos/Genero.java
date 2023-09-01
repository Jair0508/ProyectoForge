package com.grupo8.tulibroapp.Modelos;

import java.util.List;


import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "generos")
@Getter
@Setter
@NoArgsConstructor
public class Genero extends ModeloBase{

    @NotBlank(message = "Campo no debe estar vacio")
    @NotNull
    private String nombreGenero;

    @OneToMany(mappedBy="genero", fetch = FetchType.LAZY)
    private List<LibroVenta> libroVentas;

    @OneToMany(mappedBy="genero", fetch = FetchType.LAZY)
    private List<LibroIntercambio> libroIntercambios;
}

package com.grupo8.tulibroapp.Modelos;

import java.util.List;

import jakarta.persistence.Column;
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

    @Column(name = "nombre", unique = true)
    // @NotBlank(message = "Campo no debe estar vacio")
    // @NotNull
    private String nombre;

    @OneToMany(mappedBy="genero", fetch = FetchType.LAZY)
    private List<Libro> libro;
}

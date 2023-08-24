package com.grupo8.tulibroapp.Modelos;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "generos")
@Getter
@Setter
@NoArgsConstructor
public class Genero extends ModeloBase{

    private String nombre;

    @OneToMany(mappedBy="genero", fetch = FetchType.LAZY)
    private List<Libro> libro;
}

package com.grupo8.tulibroapp.Modelos;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "autores")
@Getter
@Setter
@NoArgsConstructor
public class Autor  extends ModeloBase{
    
    private String nombre;
    
    private String descripcion;

    private String frase;

    @OneToOne(mappedBy="autor", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
    private Libro libro;
}

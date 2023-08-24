package com.grupo8.tulibroapp.Modelos;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class FormLibro {
    
    private String nombreLibro;

    private String descripcionLibro;

    private String precioLibro;

    private String cantidadLibro;

    private String nombreGenero;

    private String nombreAutor;

    private String descripcionAutor;

    private String fraseAutor;
}

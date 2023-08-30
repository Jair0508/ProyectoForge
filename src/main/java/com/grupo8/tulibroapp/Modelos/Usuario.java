package com.grupo8.tulibroapp.Modelos;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "usuarios")
public class Usuario extends ModeloBase {

    private String name;

    @Email
    @Column(name = "email", unique = true)
    private String email;

    private String password;

    @Transient
    private String passwordConfirmation;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "lista_deseo", joinColumns = @JoinColumn(name = "usuario_id"), inverseJoinColumns = @JoinColumn(name = "libro_id"))
    private List<Libro> libros;

    public void agregarLibro(Libro libro) {
        libros.add(libro);
    }

    public void quitarLibro(Libro libro) {
        libros.remove(libro);
    }
}
package com.grupo8.tulibroapp.Controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grupo8.tulibroapp.Modelos.Autor;
import com.grupo8.tulibroapp.Modelos.FormLibro;
import com.grupo8.tulibroapp.Modelos.Genero;
import com.grupo8.tulibroapp.Modelos.Libro;
import com.grupo8.tulibroapp.Servicio.ServicioAutor;
import com.grupo8.tulibroapp.Servicio.ServicioGenero;
import com.grupo8.tulibroapp.Servicio.ServicioLibro;
import com.grupo8.tulibroapp.validaciones.FormLibroValidator;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/libros")
public class ControladorLibro {

    @Autowired
    private ServicioLibro servicioLibro;

    @Autowired
    private FormLibroValidator formLibroValidator;

    @Autowired
    private ServicioAutor servicioAutor;

    @Autowired
    private ServicioGenero servicioGenero;

    @GetMapping("")
    public String venta() {
        return "libros.jsp";
    }

    @GetMapping("/anexar")
    public String anexarLibroAutorGenero(@ModelAttribute("formLibro") FormLibro formLibro) {
        return "registroLibros.jsp";
    }

    @PostMapping("/anexar/libro")
    public String libroAnexado(
            RedirectAttributes redirectAttributes,
            @Valid @ModelAttribute("formLibro") FormLibro formLibro, BindingResult result) {
        formLibroValidator.validate(formLibro, result);
        if (result.hasErrors()) {
            return "registroLibros.jsp";
        } else {

            Autor autor = new Autor();
            autor.setNombre(formLibro.getNombreAutor());
            autor.setDescripcion(formLibro.getDescripcionAutor());
            autor.setFrase(formLibro.getFraseAutor());

            Genero genero = new Genero();
            genero.setNombre(formLibro.getNombreGenero());

            Libro libro = new Libro();
            libro.setNombre(formLibro.getNombreLibro());
            libro.setDescripcion(formLibro.getDescripcionLibro());
            libro.setPrecio(formLibro.getPrecioLibro());
            libro.setCantidad(formLibro.getCantidadLibro());
            libro.setAutor(autor);
            libro.setGenero(genero);

            servicioGenero.save(genero);
            servicioAutor.save(autor);
            servicioLibro.save(libro);

            redirectAttributes.addFlashAttribute("realizado", "Anexado con exito");
            return "redirect:/libros/anexar";
        }
    }
}

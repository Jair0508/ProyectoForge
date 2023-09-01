package com.grupo8.tulibroapp.Controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grupo8.tulibroapp.Modelos.Autor;
import com.grupo8.tulibroapp.Modelos.Genero;
import com.grupo8.tulibroapp.Modelos.LibroVenta;
import com.grupo8.tulibroapp.Servicio.ServicioAutor;
import com.grupo8.tulibroapp.Servicio.ServicioGenero;
import com.grupo8.tulibroapp.Servicio.ServicioLibroVenta;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/libros")
public class ControladorLibro {

    @Autowired
    private ServicioLibroVenta servicioLibroVenta;

    @Autowired
    private ServicioAutor servicioAutor;

    @Autowired
    private ServicioGenero servicioGenero;


    @GetMapping("/{pageNumber}")
    public String venta(Model model, @PathVariable("pageNumber") int pageNumber, HttpSession session) {
        Page<LibroVenta> paginaLibros = servicioLibroVenta.libroVentaPerPage(pageNumber - 1);
        
        
        int totalPages = paginaLibros.getTotalPages();
        // Long usuarioId = (Long) session.getAttribute("userId");
        // if(usuarioId != null){
        //     return "redirect:/libros/" + pageNumber;
        // }
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("paginaLibros", paginaLibros);

        return "libros.jsp";
    }

    @GetMapping("/anexar")
    public String formLibroGenero(@ModelAttribute("libro") LibroVenta libro,
            @ModelAttribute("genero") Genero genero, HttpSession session, Model model) {
        Long usuarioId = (Long) session.getAttribute("userId");
        if (usuarioId == null) {
            return "redirect:/login";
        }
        List<Genero> listaGeneros = servicioGenero.findAll();
        List<Autor> listaAutores = servicioAutor.findAll();
        model.addAttribute("listaGeneros", listaGeneros);
        model.addAttribute("listaAutores", listaAutores);
        return "registroLibros.jsp";
    }

    @PostMapping("/anexar")
    public String anexarLibro(@Valid @ModelAttribute("libro") LibroVenta libro, BindingResult result, Model model,
            RedirectAttributes redirectAttributes) {

        if (libro.getAutor() == null || libro.getAutor().getId() == null) {
            FieldError error = new FieldError("libro", "autor", "Debe seleccionar un autor.");
            result.addError(error);
            List<Genero> listaGeneros = servicioGenero.findAll();
            List<Autor> listaAutores = servicioAutor.findAll();
            model.addAttribute("listaGeneros", listaGeneros);
            model.addAttribute("listaAutores", listaAutores);
            return "registroLibros.jsp";
        }

        if (result.hasErrors()) {
            List<Genero> listaGeneros = servicioGenero.findAll();
            List<Autor> listaAutores = servicioAutor.findAll();
            model.addAttribute("listaGeneros", listaGeneros);
            model.addAttribute("listaAutores", listaAutores);
            return "registroLibros.jsp";
        }

        LibroVenta unicoLibro = servicioLibroVenta.findByNombre(libro.getNombre());
        if (unicoLibro != null) {
            FieldError error = new FieldError("libro", "libro",
                    libro.getNombre() + " ya se encuentra registrado en la base de datos.");
            result.addError(error);
            return "registroLibro.jsp";
        }

        Genero unicoGenero = servicioGenero.findByNombreGenero(libro.getGenero().getNombreGenero());
        if (unicoGenero != null) {
            libro.setGenero(unicoGenero);
        }

        redirectAttributes.addFlashAttribute("realizado", "Libro guardado");
        servicioLibroVenta.save(libro);
        servicioGenero.save(libro.getGenero());
        return "redirect:/libros/anexar";
    }

    @GetMapping("/anexar/autor")
    public String formAutor(@ModelAttribute("autor") Autor autor) {

        return "registroAutor.jsp";
    }

    @PostMapping("/anexar/autor")
    public String anexarAutor(@Valid @ModelAttribute("autor") Autor autor, BindingResult result, Model model,
            RedirectAttributes redirectAttributes) {

        if (result.hasErrors()) {
            return "registroAutor.jsp";
        }

        Autor unico = servicioAutor.findByNombre(autor.getNombre());
        if (unico != null) {
            FieldError error = new FieldError("nombre", "nombre",
                    autor.getNombre() + " ya se encuentra registrado en la base de datos.");
            result.addError(error);
            return "registroAutor.jsp";
        }

        redirectAttributes.addFlashAttribute("realizado", "Autor guardado");
        servicioAutor.save(autor);
        return "redirect:/libros/anexar/autor";
    }

}
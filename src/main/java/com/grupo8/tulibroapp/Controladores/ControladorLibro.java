package com.grupo8.tulibroapp.Controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grupo8.tulibroapp.Modelos.Autor;
import com.grupo8.tulibroapp.Modelos.Genero;
import com.grupo8.tulibroapp.Modelos.Libro;
import com.grupo8.tulibroapp.Servicio.ServicioAutor;
import com.grupo8.tulibroapp.Servicio.ServicioGenero;
import com.grupo8.tulibroapp.Servicio.ServicioLibro;
import com.grupo8.tulibroapp.validaciones.LibroValidator;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/libros")
public class ControladorLibro {

    @Autowired
    private ServicioLibro servicioLibro;
    @Autowired
    private LibroValidator libroValidator;

    @Autowired
    private ServicioAutor servicioAutor;

    @Autowired
    private ServicioGenero servicioGenero;

    @GetMapping("")
    public String venta(
            @RequestParam(defaultValue = "0") int page, // desde donde parte la pagina
            @RequestParam(defaultValue = "12") int size, // cantidad de libros o contenido de la variable que se quiere
                                                        // vizualizar en la pagina
            Model model) {
        // paginacion
        Pageable pageable = PageRequest.of(page, size);
        Page<Libro> libroPage = servicioLibro.findAll(pageable);
        model.addAttribute("libroPage", libroPage);

        List<Libro> listaLibro = servicioLibro.findAll();
        model.addAttribute("listaLibro", listaLibro);
        return "libros.jsp";
    }

    @GetMapping("/anexar")
    public String formLibroGenero(@ModelAttribute("libro") Libro libro,
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

    @PostMapping("/anexar/genero")
    public String anexarGenero(@Valid @ModelAttribute("genero") Genero genero, BindingResult result, Model model,
            RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            List<Genero> listaGeneros = servicioGenero.findAll();
            List<Autor> listaAutores = servicioAutor.findAll();
            model.addAttribute("listaGeneros", listaGeneros);
            model.addAttribute("listaAutores", listaAutores);
            return "registroLibros.jsp";
        }

        servicioGenero.save(genero);
        return "redirect:/libros/anexar";
    }

    @PostMapping("/anexar")
    public String anexarLibro(@Valid @ModelAttribute("libro") Libro libro, BindingResult result, Model model,
            RedirectAttributes redirectAttributes) {
        libroValidator.validate(libro, result);
        if (result.hasErrors()) {
            List<Genero> listaGeneros = servicioGenero.findAll();
            List<Autor> listaAutores = servicioAutor.findAll();
            model.addAttribute("listaGeneros", listaGeneros);
            model.addAttribute("listaAutores", listaAutores);
            return "registroLibros.jsp";
        }

        Genero unico = servicioGenero.findByNombreGenero(libro.getGenero().getNombreGenero());
        if (unico != null) {
            libro.setGenero(unico);
        }

        redirectAttributes.addFlashAttribute("realizado", "Libro guardado");
        servicioLibro.save(libro);
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
            autor.setNombre(unico.getNombre());
        }
        redirectAttributes.addFlashAttribute("realizado", "Autor guardado");
        servicioAutor.save(autor);
        return "redirect:/libros/anexar/autor";
    }

}
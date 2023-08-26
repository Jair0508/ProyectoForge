package com.grupo8.tulibroapp.Controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grupo8.tulibroapp.Modelos.Autor;
import com.grupo8.tulibroapp.Modelos.Genero;
import com.grupo8.tulibroapp.Modelos.Libro;
import com.grupo8.tulibroapp.Servicio.ServicioAutor;
import com.grupo8.tulibroapp.Servicio.ServicioGenero;
import com.grupo8.tulibroapp.Servicio.ServicioLibro;

import jakarta.servlet.http.HttpSession;

@Controller
public class ControladorLibro {

    @Autowired
    private ServicioLibro servicioLibro;

    @Autowired
    private ServicioAutor servicioAutor;

    @Autowired
    private ServicioGenero servicioGenero;

    @GetMapping("")
    public String venta() {
        return "libros.jsp";
    }

    @GetMapping("libros/anexar")
    public String mostrarLibroAutorGenero(@ModelAttribute("libro") Libro libro, HttpSession session, Model model) {
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
    public String anexarGenero(@RequestParam("nombre") String nombre) {
        Genero genero = new Genero();
        genero.setNombre(nombre);
        servicioGenero.save(genero);
        return "redirect:/libros/anexar";
    }

    @PostMapping("/anexar/autor")
    public String anexarAutor(@RequestParam("nombre") String nombre, @RequestParam("descripcion") String descripcion,
            @RequestParam("frase") String frase) {

        Autor autor = new Autor();
        autor.setNombre(nombre);
        autor.setDescripcion(descripcion);
        autor.setFrase(frase);

        servicioAutor.save(autor);
        return "redirect:/libros/anexar";
    }

    @PostMapping("libros/anexar/libro")
    public String anexarLibro(@ModelAttribute("libro") Libro libro, @RequestParam("genero") Long generoId,
            @RequestParam("autor") Long autorId) {

        Genero genero = servicioGenero.findById(generoId);
        Autor autor = servicioAutor.findById(autorId);

        libro.setGenero(genero);
        libro.setAutor(autor);
        servicioLibro.save(libro);
        return "redirect:/principal";
    }
}
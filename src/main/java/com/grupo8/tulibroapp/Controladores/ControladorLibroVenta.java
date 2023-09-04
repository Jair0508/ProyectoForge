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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grupo8.tulibroapp.Modelos.Autor;
import com.grupo8.tulibroapp.Modelos.Genero;
import com.grupo8.tulibroapp.Modelos.LibroVenta;
import com.grupo8.tulibroapp.Modelos.Usuario;
import com.grupo8.tulibroapp.Servicio.ServicioAutor;
import com.grupo8.tulibroapp.Servicio.ServicioGenero;
import com.grupo8.tulibroapp.Servicio.ServicioLibroVenta;
import com.grupo8.tulibroapp.Servicio.ServicioUsuario;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/libros")
public class ControladorLibroVenta {

    @Autowired
    private ServicioUsuario servicioUsuario;

    @Autowired
    private ServicioLibroVenta servicioLibroVenta;

    @Autowired
    private ServicioAutor servicioAutor;

    @Autowired
    private ServicioGenero servicioGenero;

    @GetMapping("/{pageNumber}")
    public String venta(Model model, @PathVariable("pageNumber") int pageNumber, HttpSession session) {
        Page<LibroVenta> paginaLibros = servicioLibroVenta.libroVentaPerPage(pageNumber - 1);
        // el -1 resta un pagina al tamaño del totalpage, lo cual qiota el que se
        // muestra vacio

        int totalPages = paginaLibros.getTotalPages();
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("paginaLibros", paginaLibros);

        Long usuarioId = (Long) session.getAttribute("userId");
        if (usuarioId == null) {
            return "libreria.jsp";
        } else {
            Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
            model.addAttribute("usuarioEmail", usuarioEmail);
            return "libreria.jsp";
        }
    }

    @GetMapping("/anexar")
    public String formLibroGenero(@ModelAttribute("libro") LibroVenta libro,
            @ModelAttribute("genero") Genero genero, HttpSession session, Model model) {
        Long usuarioId = (Long) session.getAttribute("userId");
        List<Genero> listaGeneros = servicioGenero.findAll();
        List<Autor> listaAutores = servicioAutor.findAll();

        if (usuarioId != null && usuarioId != 1) {
            return "redirect:/principal";
        }

        if (usuarioId == null) {
            return "redirect:/login";
        }
        Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
        model.addAttribute("listaGeneros", listaGeneros);
        model.addAttribute("listaAutores", listaAutores);
        model.addAttribute("usuarioEmail", usuarioEmail);
        return "registroLibros.jsp";

    }

    @PostMapping("/anexar")
    public String anexarLibro(@Valid @ModelAttribute("libro") LibroVenta libro, BindingResult result, Model model,
            RedirectAttributes redirectAttributes) {
        List<Genero> listaGeneros = servicioGenero.findAll();
        List<Autor> listaAutores = servicioAutor.findAll();

        if (libro.getAutor() == null || libro.getAutor().getId() == null) {
            FieldError error = new FieldError("autor", "autor", "Debe seleccionar un autor.");
            result.addError(error);
            model.addAttribute("listaGeneros", listaGeneros);
            model.addAttribute("listaAutores", listaAutores);
            return "registroLibros.jsp";
        }

        if (result.hasErrors()) {
            model.addAttribute("listaGeneros", listaGeneros);
            model.addAttribute("listaAutores", listaAutores);
            return "registroLibros.jsp";
        }

        LibroVenta unicoLibro = servicioLibroVenta.findByNombre(libro.getNombre());
        if (unicoLibro != null) {
            FieldError error = new FieldError("nombre", "nombre",
                    libro.getNombre() + " ya se encuentra registrado.");
            result.addError(error);
            model.addAttribute("listaGeneros", listaGeneros);
            model.addAttribute("listaAutores", listaAutores);
            return "registroLibros.jsp";
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
    public String formAutor(@ModelAttribute("autor") Autor autor, HttpSession session) {
        Long usuarioId = (Long) session.getAttribute("userId");

        if (usuarioId != null && usuarioId != 1) {
            return "redirect:/principal";
        }

        if (usuarioId == null) {
            return "redirect:/login";
        }

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
                    autor.getNombre() + " ya se encuentra registrado.");
            result.addError(error);
            return "registroAutor.jsp";
        }

        redirectAttributes.addFlashAttribute("realizado", "Autor guardado");
        servicioAutor.save(autor);
        return "redirect:/libros/anexar/autor";
    }

    @GetMapping("/{libroId}/libro")
    public String showLibro(@PathVariable("libroId") Long libroId, HttpSession session, Model model) {
        Long usuarioId = (Long) session.getAttribute("userId");
        LibroVenta libroVenta = servicioLibroVenta.findById(libroId);
        model.addAttribute("usuarioId", usuarioId);
        model.addAttribute("libro", libroVenta);
        return "libro.jsp";
    }

    @PostMapping("/buscar")
    public String buscar(@RequestParam(value = "search", required = false) String search, Model model,
            RedirectAttributes redirectAttributes, HttpSession session) {
        Long usuarioId = (Long) session.getAttribute("userId");

        if (search.isBlank()) {
            model.addAttribute("usuarioEmail", usuarioId);
            redirectAttributes.addFlashAttribute("noPresente", "No presente");
            return "redirect:/principal";
        }

        LibroVenta libro = servicioLibroVenta.findByNombreContainingIgnoreCase(search);
        if (libro == null) {
            model.addAttribute("usuarioEmail", usuarioId);
            redirectAttributes.addFlashAttribute("noPresente", "No presente");
            return "redirect:/principal";
        } else {
            model.addAttribute("libro", libro);
            return "libro.jsp";
        }

        // Por implementar
        // // List<String> listaLibroGenero =
        // servicioLibroVenta.findGeneroNombreByGenero(search);
        // // if(listaLibroGenero.isEmpty()){
        // // redirectAttributes.addFlashAttribute("noPresente", "No presente");
        // // } else {
        // // model.addAttribute("listaLibroGenero", listaLibroGenero);
        // // return "libroGenero.jsp";
        // // }

        // return "redirect:/principal";
    }
}
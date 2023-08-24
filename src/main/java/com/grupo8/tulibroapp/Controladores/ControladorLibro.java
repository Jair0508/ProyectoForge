package com.grupo8.tulibroapp.Controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grupo8.tulibroapp.Modelos.Autor;
import com.grupo8.tulibroapp.Modelos.Genero;
import com.grupo8.tulibroapp.Modelos.Libro;
import com.grupo8.tulibroapp.Servicio.ServicioAutor;
import com.grupo8.tulibroapp.Servicio.ServicioLibro;
import com.grupo8.tulibroapp.validaciones.LibroValidator;

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

    @GetMapping("")
    public String venta() {
        return "libros.jsp";
    }

    @GetMapping("/anexar")
    public String anexarLibroAutorGenero(@ModelAttribute("libro") Libro libro, @ModelAttribute Genero genero,
            @ModelAttribute("autor") Autor autor, Model model) {
        List<Autor> listAutor = servicioAutor.findAll();
        model.addAttribute("autor", new Autor());
        model.addAttribute("listAutor", listAutor);
        return "registroLibros.jsp";
    }

    @PostMapping("/anexar/libro")
    public String libroAnexado(
            RedirectAttributes redirectAttributes,
            @Valid @ModelAttribute("libro") Libro libro, BindingResult result) {
        // libroValidator.validate(libro, result);
        if (result.hasErrors()) {
            return "registroLibros.jsp";
        } else {
            servicioLibro.save(libro);
            redirectAttributes.addFlashAttribute("realizadoLibro", "Registro con exito!!");
            return "redirect:/libros/anexar";
        }
    }

    @PostMapping("/anexar/autor")
    public String autorAnexado(
            RedirectAttributes redirectAttributes,
            @Valid @ModelAttribute("autor") Autor autor, BindingResult result) {
        if (result.hasErrors()) {
            return "registroLibros.jsp";
        } else {
            servicioAutor.save(autor);
            redirectAttributes.addFlashAttribute("realizadoAutor", "Registro con exito!!");
            return "redirect:/libros/anexar";
        }
    }

}

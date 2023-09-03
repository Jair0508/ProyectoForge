package com.grupo8.tulibroapp.Controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grupo8.tulibroapp.Modelos.Autor;
import com.grupo8.tulibroapp.Modelos.LibroVenta;
import com.grupo8.tulibroapp.Modelos.Usuario;
import com.grupo8.tulibroapp.Servicio.ServicioAutor;
import com.grupo8.tulibroapp.Servicio.ServicioLibroVenta;
import com.grupo8.tulibroapp.Servicio.ServicioUsuario;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/autores")
public class ControladorAutor {
    @Autowired
    private ServicioLibroVenta servicioLibroVenta;

    @Autowired
    private ServicioUsuario servicioUsuario;

    @Autowired
    private ServicioAutor servicioAutor;

    @GetMapping("/{pageNumber}")
    public String listAutor(@PathVariable("pageNumber") int pageNumber, Model model, HttpSession session) {
        Page<Autor> paginaAutor = servicioAutor.autorPorPage(pageNumber - 1);
        Long usuarioId = (Long) session.getAttribute("userId");
        int totalPages = paginaAutor.getTotalPages();
        if (usuarioId == null) {
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("paginaAutor", paginaAutor);
            return "redirect:/login";
        }
        Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
        model.addAttribute("usuarioEmail", usuarioEmail);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("paginaAutor", paginaAutor);
        return "listaAutores.jsp";
    }

    @GetMapping("/{autorId}/libros")
    public String mostrarListaDeLibrosPorAutor(@PathVariable("autorId") Long autorId,
            @RequestParam(name = "page", defaultValue = "0") int pageNumber, Model model, HttpSession session,
            RedirectAttributes redirectAttributes) {
        Page<LibroVenta> paginaLibrosPorAutor = servicioLibroVenta.obtenerLibroPorAutor(autorId, pageNumber, 2);
        Long usuarioId = (Long) session.getAttribute("userId");
        Autor autor = servicioAutor.findById(usuarioId);
        if (usuarioId == null) {
            model.addAttribute("paginaLibrosPorAutor", paginaLibrosPorAutor);
            model.addAttribute("autor", autor);
            return "redirect:/login";
        } else {
            Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
            model.addAttribute("usuarioEmail", usuarioEmail);
            model.addAttribute("paginaLibrosPorAutor", paginaLibrosPorAutor);
            model.addAttribute("autor", autor);
            return "libreriaAutor.jsp";
        }
    }
}

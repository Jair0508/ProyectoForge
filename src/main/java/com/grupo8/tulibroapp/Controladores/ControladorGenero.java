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

import com.grupo8.tulibroapp.Modelos.Genero;
import com.grupo8.tulibroapp.Modelos.LibroVenta;
import com.grupo8.tulibroapp.Modelos.Usuario;
import com.grupo8.tulibroapp.Servicio.ServicioGenero;
import com.grupo8.tulibroapp.Servicio.ServicioLibroVenta;
import com.grupo8.tulibroapp.Servicio.ServicioUsuario;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/generos")
public class ControladorGenero {

    @Autowired
    private ServicioLibroVenta servicioLibroVenta;

    @Autowired
    private ServicioUsuario servicioUsuario;

    @Autowired
    private ServicioGenero servicioGenero;

    @GetMapping("/{pageNumber}")
    public String listGenero(@PathVariable("pageNumber") int pageNumber, Model model, HttpSession session) {
        Page<Genero> paginaGenero = servicioGenero.generoPorPage(pageNumber - 1);
        Long usuarioId = (Long) session.getAttribute("userId");
        int totalPages = paginaGenero.getTotalPages();
        if (usuarioId == null) {
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("paginaGenero", paginaGenero);
            return "listaGenero.jsp";
        }
        Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
        model.addAttribute("usuarioEmail", usuarioEmail);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("paginaGenero", paginaGenero);
        return "listaGenero.jsp";
    }


    //Tuve que aplicar algo distinto al Coding Dojo para traer los Libros por genero.
    @GetMapping("/{generoId}/libros")
    public String mostrarListaDeLibrosPorGenero(
            @PathVariable("generoId") Long generoId,
            @RequestParam(name = "page", defaultValue = "0") int pageNumber,
            Model model, HttpSession session,
            RedirectAttributes redirectAttributes,
            HttpServletRequest request) {

        Page<LibroVenta> paginaLibrosPorGenero = servicioLibroVenta.obtenerLibrosPorGenero(generoId, pageNumber, 2);
        Long usuarioId = (Long) session.getAttribute("userId");
        Genero genero = servicioGenero.findById(generoId);
        if (usuarioId == null) {
            model.addAttribute("paginaLibrosPorGenero", paginaLibrosPorGenero);
            model.addAttribute("genero", genero);
            String referer = request.getHeader("referer");
            return "redirect:" + referer;
        } else {
            Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
            model.addAttribute("usuarioEmail", usuarioEmail);
            model.addAttribute("genero", genero);
            model.addAttribute("paginaLibrosPorGenero", paginaLibrosPorGenero);
            return "libreriaGenero.jsp";
        }

    }

}

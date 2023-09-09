package com.grupo8.tulibroapp.Controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
@RequestMapping("/generos")
public class ControladorGenero {

    @Autowired
    private ServicioAutor servicioAutor;

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
        List<Autor> listaFrases = servicioAutor.findAllRandomOrder();
        model.addAttribute("listaFrases", listaFrases);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("paginaGenero", paginaGenero);

        if (usuarioId != null) {
            Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
            model.addAttribute("usuarioEmail", usuarioEmail);
            return "listaGenero.jsp";
        }

        return "listaGenero.jsp";
    }

    @GetMapping("/{generoId}/libros")
    public String mostrarListaDeLibrosPorGenero(
            @PathVariable("generoId") Long generoId,
            @RequestParam(name = "page", defaultValue = "0") int pageNumber,
            Model model, HttpSession session,
            RedirectAttributes redirectAttributes) {

        Page<LibroVenta> paginaLibrosPorGenero = servicioLibroVenta.obtenerLibrosPorGenero(generoId, pageNumber, 2);
        Long usuarioId = (Long) session.getAttribute("userId");
        Genero genero = servicioGenero.findById(generoId);
        List<Autor> listaFrases = servicioAutor.findAllRandomOrder();
        model.addAttribute("listaFrases", listaFrases);
        model.addAttribute("paginaLibrosPorGenero", paginaLibrosPorGenero);
        model.addAttribute("genero", genero);

        if (usuarioId != null) {
            Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
            model.addAttribute("usuarioEmail", usuarioEmail);
            return "libreriaGenero.jsp";
        }

        return "libreriaGenero.jsp";
    }

    @GetMapping("/{generoId}/editar")
    public String editarGenero(@PathVariable("generoId") Long generoId, Model model, HttpSession session) {
        Long usuarioId = (Long) session.getAttribute("userId");

        if (usuarioId == null) {
            return "redirect:/usuario/login";

        } else if (usuarioId != null && usuarioId != 1) {
            return "redirect:/principal";

        } else {
            List<Autor> listaFrases = servicioAutor.findAllRandomOrder();
            model.addAttribute("listaFrases", listaFrases);
            Genero genero = servicioGenero.findById(generoId);
            model.addAttribute("genero", genero);
            List<LibroVenta> libroNull = servicioLibroVenta.findByGeneroIsNull();
            List<LibroVenta> libroNoNull = servicioLibroVenta.findByGenero(genero);
            Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
            model.addAttribute("libroNoNull", libroNoNull);
            model.addAttribute("libroNull", libroNull);
            model.addAttribute("usuarioEmail", usuarioEmail);
            return "editarGenero.jsp";
        }
    }

    @PutMapping("/{generoId}/editar")
    public String generoEditado(@Valid @ModelAttribute("genero") Genero genero, BindingResult result,
            @PathVariable("generoId") Long generoId, Model model, RedirectAttributes redirectAttributes,
            HttpSession session) {
        Long usuarioId = (Long) session.getAttribute("userId");
        Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
        model.addAttribute("usuarioEmail", usuarioEmail);

        Genero unicoGenero = servicioGenero.findByNombreGenero(genero.getNombreGenero());
        if (unicoGenero != null) {
            unicoGenero.setNombreGenero(genero.getNombreGenero());
        }

        if (result.hasErrors()) {
            List<Autor> listaFrases = servicioAutor.findAllRandomOrder();
            List<LibroVenta> libroNull = servicioLibroVenta.findByGeneroIsNull();
            List<LibroVenta> libroNoNull = servicioLibroVenta.findByGenero(genero);
            model.addAttribute("libroNoNull", libroNoNull);
            model.addAttribute("listaFrases", listaFrases);
            model.addAttribute("libroNull", libroNull);
            model.addAttribute("usuarioEmail", usuarioEmail);
            model.addAttribute("genero", genero);
            return "editarGenero.jsp";
        }

        Genero editarGenero = servicioGenero.findById(generoId);
        if (editarGenero != null) {
            editarGenero.setNombreGenero(genero.getNombreGenero());
            servicioGenero.update(editarGenero);
        }
        redirectAttributes.addFlashAttribute("realizado", "Se actualizo Correctamente");
        return "redirect:/generos/" + generoId + "/editar";
    }

    @PostMapping("/{generoId}/remover/{libroId}")
    public String remover(@PathVariable("generoId") Long generoId, @PathVariable("libroId") Long libroId,
            RedirectAttributes redirectAttributes) {
        LibroVenta removerLibro = servicioLibroVenta.findById(libroId);
        removerLibro.setGenero(null);
        servicioLibroVenta.save(removerLibro);
        redirectAttributes.addFlashAttribute("removido", "Se removio del Genero");
        return "redirect:/generos/" + generoId + "/editar";
    }

    @PostMapping("/{generoId}/agregar")
    public String agregar(@PathVariable("generoId") Long generoId, @RequestParam("libroId") Long libroId,
            RedirectAttributes redirectAttributes) {
        Genero agregarGenero = servicioGenero.findById(generoId);
        LibroVenta agregueLibro = servicioLibroVenta.findById(libroId);
        List<LibroVenta> libroList = agregarGenero.getLibroVentas();
        libroList.add(agregueLibro);
        agregarGenero.setLibroVentas(libroList);
        agregueLibro.setGenero(agregarGenero);
        servicioGenero.save(agregarGenero);
        redirectAttributes.addFlashAttribute("agregado", "Se agrego al autor");
        return "redirect:/generos/" + generoId + "/editar";
    }
}

package com.grupo8.tulibroapp.Controladores;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.grupo8.tulibroapp.Modelos.Libro;
import com.grupo8.tulibroapp.Modelos.Usuario;
import com.grupo8.tulibroapp.Servicio.ServicioLibro;
import com.grupo8.tulibroapp.Servicio.ServicioUsuario;

import jakarta.servlet.http.HttpSession;

@Controller
public class ControladorListaDeseo {

    @Autowired
    private ServicioUsuario servicioUsuario;

    @Autowired
    private ServicioLibro servicioLibro;

    @GetMapping("/lista_deseos/{usuarioId}")
    public String mostrarUsuario(@PathVariable("usuarioId") Long id, Model model, HttpSession session) {
        Long usuarioId = (Long) session.getAttribute("userId");
        if (usuarioId == null) {
            return "redirect:/login";
        } else if (id != usuarioId) {
            return "redirect:/lista_deseos/" + usuarioId;
        } else {
            Usuario usuarioEmail = servicioUsuario.findById(id);
            model.addAttribute("usuarioEmail", usuarioEmail);
            return "mostrarListaDeseo.jsp";
        }
    }

    @PostMapping("/lista_deseos/anexar_libro/{libroId}")
    public String agregarLibro_ListaDeseos(@PathVariable("libroId") Long LibroId,
            HttpSession session) {
        Long usuarioId = (Long) session.getAttribute("userId");
        Usuario usuario = servicioUsuario.findById(usuarioId);

        Libro libro = servicioLibro.findById(LibroId);
        usuario.agregarLibro(libro);
        servicioLibro.save(libro);
        return "redirect:/lista_deseos/" + usuarioId;
    }

    @PostMapping("/lista_deseos/quitarLibro/{libroId}")
    public String quitarLibro_ListaDeseos(@PathVariable("libroId") Long LibroId,
            HttpSession session) {
        Long usuarioId = (Long) session.getAttribute("userId");
        Usuario usuario = servicioUsuario.findById(usuarioId);

        Libro libro = servicioLibro.findById(LibroId);
        usuario.quitarLibro(libro);
        servicioLibro.save(libro);

        return "redirect:/lista_deseos/" + usuarioId;
    }
}
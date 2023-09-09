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
import com.grupo8.tulibroapp.Modelos.LibroIntercambio;
import com.grupo8.tulibroapp.Modelos.Usuario;
import com.grupo8.tulibroapp.Servicio.ServicioAutor;
import com.grupo8.tulibroapp.Servicio.ServicioGenero;
import com.grupo8.tulibroapp.Servicio.ServicioLibroIntercambio;
import com.grupo8.tulibroapp.Servicio.ServicioUsuario;


import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/intercambios")
public class ControladorIntercambios {

    @Autowired
    private ServicioUsuario servicioUsuario;

    @Autowired
    private ServicioLibroIntercambio servicioLibroIntercambio;

    @Autowired
    private ServicioAutor servicioAutor;

    @Autowired
    private ServicioGenero servicioGenero;
    
    @GetMapping("/lista")
    public String lista(Model model, HttpSession session){

        return "intercambios.jsp";
    }

    @GetMapping("/libro/anexar")
    public String librosIntercambiosAnexar(@ModelAttribute("libro") LibroIntercambio libro, HttpSession session, Model model){
        Long usuarioId = (Long) session.getAttribute("userId");
        
        if(usuarioId == null){
            return "redirect:/usuario/login";
        } else {
            Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
            List<Genero> listaGenero = servicioGenero.findAll();
            List<Autor> listaAutores  = servicioAutor.findAll();
            model.addAttribute("listaAutores", listaAutores);
            model.addAttribute("listaGenero", listaGenero);
            model.addAttribute("usuarioEmail", usuarioEmail);
        }
        return "registroIntercambios.jsp";
    }

    @PostMapping("/libro/anexar")
    public String librosIntercambiosAnexados(@Valid @ModelAttribute("libro") LibroIntercambio libro, BindingResult result, Model model, RedirectAttributes redirectAttributes){
        List<Genero> listaGeneros = servicioGenero.findAll();
        List<Autor> listaAutores = servicioAutor.findAll();

        if (result.hasErrors()) {
            model.addAttribute("listaGeneros", listaGeneros);
            model.addAttribute("listaAutores", listaAutores);
            return "registroLibros.jsp";
        }

        redirectAttributes.addFlashAttribute("realizado", "Libro guardado");
        servicioLibroIntercambio.save(libro);
        return "redirect:/intercambios/libro/anexar";
    }
}

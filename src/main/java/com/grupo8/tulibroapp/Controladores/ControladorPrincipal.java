package com.grupo8.tulibroapp.Controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.grupo8.tulibroapp.Modelos.LibroVenta;
import com.grupo8.tulibroapp.Modelos.Usuario;
import com.grupo8.tulibroapp.Servicio.ServicioLibroVenta;
import com.grupo8.tulibroapp.Servicio.ServicioUsuario;

import jakarta.servlet.http.HttpSession;

@Controller
public class ControladorPrincipal {

    @Autowired
    private ServicioLibroVenta servicioLibroVenta;

    @Autowired ServicioUsuario servicioUsuario;

    @GetMapping("/")
    public String raiz(){
        return "redirect:/principal";
    }

    @GetMapping("/principal")
    public String principal(Model model, HttpSession session) {
        List<LibroVenta> libro = servicioLibroVenta.findAll();
        model.addAttribute("listaLibros", libro);
        
        Long usuarioId = (Long) session.getAttribute("userId");
        if(usuarioId == null){
            return "index.jsp";
        } else { 
        Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
        model.addAttribute("usuarioEmail", usuarioEmail);
        return "index.jsp";
        }
    }
}

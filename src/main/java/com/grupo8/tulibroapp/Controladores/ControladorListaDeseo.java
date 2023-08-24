package com.grupo8.tulibroapp.Controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.grupo8.tulibroapp.Modelos.Usuario;
import com.grupo8.tulibroapp.Servicio.ServicioUsuario;

import jakarta.servlet.http.HttpSession;

@Controller
public class ControladorListaDeseo {

    @Autowired
    private ServicioUsuario servicioUsuario;

    @GetMapping("/lista_deseos/{usuarioId}")
    public String mostrarUsuario(Model model, HttpSession session) {
        Long usuarioId = (Long) session.getAttribute("userId");
        if (usuarioId != null) {
            Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
            model.addAttribute("usuarioEmail", usuarioEmail);
            return "mostrarListaDeseo.jsp";
        } else {
            return "redirect:/lista_deseos/" + usuarioId;
        }
     }

}
package com.grupo8.tulibroapp.Controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grupo8.tulibroapp.Modelos.Usuario;
import com.grupo8.tulibroapp.Servicio.ServicioUsuario;
import com.grupo8.tulibroapp.validaciones.UserValidator;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorUsuario {

    @Autowired
    private ServicioUsuario servicioUsuario;

    @Autowired
    private UserValidator userValidator;

    @GetMapping("/registro")
    public String mostrarCrudUsuario(@ModelAttribute("usuario") Usuario usuario) {
        return "registroUsuario.jsp";
    }

    @PostMapping("/registro")
    public String registroUsuario(@Valid @ModelAttribute("usuario") Usuario usuario, BindingResult result,
            HttpSession session) {
        userValidator.validate(usuario, result);
        if (result.hasErrors()) {
            return "registroUsuario.jsp";
        }
        servicioUsuario.registerUser(usuario);
        Long userId = usuario.getId();
        session.setAttribute("userId", userId);
        return "redirect:/principal";
    }

    @GetMapping("/login")
    public String showLogin(@ModelAttribute("usuario") Usuario usuario) {
        return "index.jsp";
    }

    @PostMapping("/login")
    public String loginUser(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            Model model,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        boolean autenticado = servicioUsuario.authenticateUser(email, password);
        if (autenticado != false) {
            Usuario usuarioEmail = servicioUsuario.findByEmail(email);
            Long userId = usuarioEmail.getId();
            session.setAttribute("userId", userId);
            model.addAttribute("usuarioEmail", usuarioEmail);
            return "redirect:/principal";
        } else {
            redirectAttributes.addFlashAttribute("error", "correo o contraseña inválidos");
            return "redirect:/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("userId");
        return "redirect:/login";
    }
}

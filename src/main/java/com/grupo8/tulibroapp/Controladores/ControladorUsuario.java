package com.grupo8.tulibroapp.Controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grupo8.tulibroapp.Modelos.LibroVenta;
import com.grupo8.tulibroapp.Modelos.Usuario;
import com.grupo8.tulibroapp.Servicio.ServicioLibroVenta;
import com.grupo8.tulibroapp.Servicio.ServicioUsuario;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorUsuario {

    @Autowired
    private ServicioLibroVenta servicioLibroVenta;

    @Autowired
    private ServicioUsuario servicioUsuario;

    @GetMapping("/registro")
    public String mostrarCrudUsuario(@ModelAttribute("usuario") Usuario usuario) {
        return "registroUsuario.jsp";
    }

    @PostMapping("/registro")
    public String registroUsuario(@Valid @ModelAttribute("usuario") Usuario usuario,
            BindingResult result,
            HttpSession session) {

        // Verifica el Email sea unico
        Usuario unico = servicioUsuario.findByEmail(usuario.getEmail());
        if (unico != null) {
            FieldError error = new FieldError("email", "email", "Email ya se encuentra registrado.");
            result.addError(error);
            return "registroUsuario.jsp";
        }

        // Verifica las contraseñas sean la misma
        if (!usuario.getPassword().contentEquals(usuario.getPasswordConfirmation())) {
            FieldError error = new FieldError("passwordConfirmation", "passwordConfirmation",
                    "Contraseñas no coinciden.");
            result.addError(error);
            return "registroUsuario.jsp";
        }

        // Validaciones Jakarta
        if (result.hasErrors()) {
            return "registroUsuario.jsp";
        }

        // Registro y anexacion de ID
        servicioUsuario.registerUser(usuario);
        Long userId = usuario.getId();
        session.setAttribute("userId", userId);
        return "redirect:/principal";
    }

    @GetMapping("/login")
    public String showLogin(@ModelAttribute("usuario") Usuario usuario, Model model, HttpSession session) {
        List<LibroVenta> libro = servicioLibroVenta.findAll();
        model.addAttribute("listaLibros", libro);
        Long usuarioId = (Long) session.getAttribute("userId");

        if (usuarioId == null) {
            return "index.jsp";
        } 
            Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
            model.addAttribute("usuarioEmail", usuarioEmail);
            return "index.jsp";
        
        
    }

    @PostMapping("/login")
    public String loginUser(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            Model model,
            HttpSession session,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes) {

        boolean autenticado = servicioUsuario.authenticateUser(email, password);
        if (autenticado != false) {
            Usuario usuarioEmail = servicioUsuario.findByEmail(email);
            Long userId = usuarioEmail.getId();
            session.setAttribute("userId", userId);
            model.addAttribute("usuarioEmail", usuarioEmail);

            // Me trae la URl de donde se envio la peticion.
            String referer = request.getHeader("referer");
            return "redirect:" + referer;
        } else {
            redirectAttributes.addFlashAttribute("error", "correo o contraseña inválidos");
            String referer = request.getHeader("referer");
            return "redirect:" + referer;
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session,
            HttpServletRequest request) {
        session.removeAttribute("userId");
        String referer = request.getHeader("referer");
        return "redirect:" + referer;
    }
}

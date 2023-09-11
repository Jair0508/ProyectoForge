package com.grupo8.tulibroapp.Controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grupo8.tulibroapp.Modelos.Autor;
import com.grupo8.tulibroapp.Modelos.DetalleOrden;
import com.grupo8.tulibroapp.Modelos.Genero;
import com.grupo8.tulibroapp.Modelos.LibroVenta;
import com.grupo8.tulibroapp.Modelos.Mensaje;
import com.grupo8.tulibroapp.Modelos.Usuario;
import com.grupo8.tulibroapp.Servicio.ServicioAutor;
import com.grupo8.tulibroapp.Servicio.ServicioDetalleOrden;
import com.grupo8.tulibroapp.Servicio.ServicioGenero;
import com.grupo8.tulibroapp.Servicio.ServicioLibroVenta;
import com.grupo8.tulibroapp.Servicio.ServicioMensaje;
import com.grupo8.tulibroapp.Servicio.ServicioUsuario;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/usuario")
public class ControladorUsuario {

    @Value("${rol_usuario}")
    private String USER;

    @Value("${rol_administrador}")
    private String ADMIN;

    @Autowired
    private ServicioAutor servicioAutor;

    @Autowired
    private ServicioGenero servicioGenero;

    @Autowired
    private ServicioLibroVenta servicioLibroVenta;

    @Autowired
    private ServicioUsuario servicioUsuario;

    @Autowired
    private ServicioDetalleOrden servicioDetalleOrden;

    @GetMapping("/registro")
    public String mostrarCrudUsuario(@ModelAttribute("usuario") Usuario usuario, Model model, HttpSession session) {
        Long usuarioId = (Long) session.getAttribute("userId");

        if(usuarioId != null){
            return "redirect:/";
        }

        List<Autor> listaFrases = servicioAutor.findAllRandomOrder();
        model.addAttribute("listaFrases", listaFrases);
        return "registroUsuario.jsp";
    }

    @PostMapping("/registro")
    public String registroUsuario(@Valid @ModelAttribute("usuario") Usuario usuario,
            BindingResult result,
            HttpSession session,
            Model model) {

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
            List<Autor> listaFrases = servicioAutor.findAllRandomOrder();
            model.addAttribute("listaFrases", listaFrases);
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
        Long usuarioId = (Long) session.getAttribute("userId");

        if (usuarioId == null) {
            return "redirect:/";
        }

        if (usuarioId == 1) {
            session.removeAttribute("userId");
            return "redirect:/principal";
        }
        session.removeAttribute("userId");
        String referer = request.getHeader("referer");
        return "redirect:" + referer;
    }

    @GetMapping("/administrador")
    public String administrador(Model model, HttpSession session) {
        Long usuarioId = (Long) session.getAttribute("userId");
        List<Autor> listaFrases = servicioAutor.findAllRandomOrder();
        model.addAttribute("listaFrases", listaFrases);

        if (usuarioId == null) {
            return "redirect:/usuario/login";
        } else if (usuarioId != null && usuarioId != 1) {
            return "redirect:/principal";
        } else {
            Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
            model.addAttribute("usuarioEmail", usuarioEmail);
            List<LibroVenta> listaLibro = servicioLibroVenta.findAll();
            List<Usuario> listaUsuario = servicioUsuario.findAll();
            List<Genero> listaGeneros = servicioGenero.findAll();
            List<Autor> listaAutores = servicioAutor.findAll();
            model.addAttribute("listaUsuario", listaUsuario);
            model.addAttribute("listaLibro", listaLibro);
            model.addAttribute("listaAutores", listaAutores);
            model.addAttribute("listaGeneros", listaGeneros);
            return "administrar.jsp";
        }
    }

    @GetMapping("/perfil/{userId}")
    public String verPerfilUsuario(@PathVariable("userId") Long userId, HttpSession session, Model model) {
        Long usuarioId = (Long) session.getAttribute("userId");
        if (usuarioId == null || userId == null) {
            return "redirect:/usuario/login";
        } else if (usuarioId != userId && usuarioId != 1) {
            return "redirect:/principal";

        } else {
            Usuario usuario = servicioUsuario.findById(userId);
            List<DetalleOrden> listOrdenes = servicioDetalleOrden.getDetalleOrdenesByUsuarioId(userId);
            model.addAttribute("usuario", usuario);
            model.addAttribute("listOrdenes", listOrdenes);
            return "perfilUsuario.jsp";
        }
    }

    @PostMapping("/editar/{userId}")
    public String editarNombreUsuario(@PathVariable("userId") Long userId, @RequestParam("nombre") String nombre,
            HttpSession session) {
        Long usuarioId = (Long) session.getAttribute("userId");
        if (usuarioId == null) {
            return "redirect:/usuario/login";
        } else if (usuarioId != userId && usuarioId != 1) {
            return "redirect:/principal";

        } else {
            Usuario usuario = servicioUsuario.findById(userId);
            usuario.setName(nombre);
            servicioUsuario.update(usuario);
            return "redirect:/usuario/perfil/" + userId;
        }
    }

    @DeleteMapping("/eliminar/{userId}")
    public String eliminarUser(@PathVariable("userId") Long userId, HttpSession session, HttpServletRequest request) {
        Long usuarioId = (Long) session.getAttribute("userId");
        if (usuarioId == null) {
            return "redirect:/usuario/login";
        } else if (usuarioId != null && usuarioId != 1) {
            return "redirect:/principal";
        } else {
            servicioUsuario.delete(userId);
            String referer = request.getHeader("referer");
            return "redirect:" + referer;
        }
    }
}

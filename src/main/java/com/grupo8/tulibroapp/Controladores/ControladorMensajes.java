package com.grupo8.tulibroapp.Controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grupo8.tulibroapp.Modelos.Autor;
import com.grupo8.tulibroapp.Modelos.LibroIntercambio;
import com.grupo8.tulibroapp.Modelos.Mensaje;
import com.grupo8.tulibroapp.Modelos.Usuario;
import com.grupo8.tulibroapp.Servicio.ServicioAutor;
import com.grupo8.tulibroapp.Servicio.ServicioLibroIntercambio;
import com.grupo8.tulibroapp.Servicio.ServicioMensaje;
import com.grupo8.tulibroapp.Servicio.ServicioUsuario;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/mensajes")
public class ControladorMensajes {

    @Autowired
    private ServicioAutor servicioAutor;

    @Autowired
    private ServicioUsuario servicioUsuario;

    @Autowired
    private ServicioLibroIntercambio servicioLibroIntercambio;

    @Autowired
    private ServicioMensaje servicioMensaje;

    @PostMapping("/remitente/{remitenteId}/destinatario/{destinatarioId}/intercambios")
    public String mensajeEnviadoIntercambios(@Valid @ModelAttribute("mensaje") Mensaje mensaje, BindingResult result,
            @PathVariable("destinatarioId") Long destinatarioId, HttpSession session, Model model,
            RedirectAttributes redirectAttributes) {
        Long usuarioId = (Long) session.getAttribute("userId");
        Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
        List<Autor> listaFrases = servicioAutor.findAll();
        List<LibroIntercambio> listalibros = servicioLibroIntercambio.findAll();

        if (usuarioId == null) {
            return "redirect:/usuario/login";
        }

        if (result.hasErrors()) {
            model.addAttribute("listalibros", listalibros);
            model.addAttribute("usuarioEmail", usuarioEmail);
            model.addAttribute("listaFrases", listaFrases);
            redirectAttributes.addFlashAttribute("error", "El campo no debe estar vacio y debe tener mas de 4 caracteres");
            return "redirect:/intercambios/libros#open-modal";
        }

        // Guarda a quien envia
        Usuario usuarioEnvia = new Usuario();
        usuarioEnvia.setId(usuarioId);
        mensaje.setRemitente(usuarioEnvia);

        // Guarda a quien recibe
        Usuario usuarioRecibe = new Usuario();
        usuarioRecibe.setId(destinatarioId);
        mensaje.setDestinatario(usuarioRecibe);

        redirectAttributes.addFlashAttribute("realizado", "Mensaje enviado con exito");
        servicioMensaje.save(mensaje);
            return "redirect:/intercambios/libro";
    }

    @PostMapping("/remitente/{remitenteId}/destinatario/{destinatarioId}/perfil")
    public String mensajeEnviadoPerfil(@Valid @ModelAttribute("mensaje") Mensaje mensaje, BindingResult result,
            @PathVariable("destinatarioId") Long destinatarioId, HttpSession session, Model model,
            RedirectAttributes redirectAttributes) {
        Long usuarioId = (Long) session.getAttribute("userId");

        if (usuarioId == null) {
            return "redirect:/usuario/login";
        }

        if (result.hasErrors()) {
            redirectAttributes.addFlashAttribute("error", "El campo no debe estar vacio y debe tener mas de 4 caracteres");
            return "redirect:/intercambios/libros#open-modal";
        }

        // Guarda a quien envia
        Usuario usuarioEnvia = new Usuario();
        usuarioEnvia.setId(usuarioId);
        mensaje.setRemitente(usuarioEnvia);

        // Guarda a quien recibe
        Usuario usuarioRecibe = new Usuario();
        usuarioRecibe.setId(destinatarioId);
        mensaje.setDestinatario(usuarioRecibe);

        redirectAttributes.addFlashAttribute("realizado", "Mensaje enviado con exito");
        servicioMensaje.save(mensaje);
        return "redirect:/mensajes/interacciones/remitente="+ usuarioId + "/destinatario=" + destinatarioId;
    }

    @GetMapping("/interacciones/remitente={remitenteId}/destinatario={destinatarioId}")
    public String interacciones(Model model, HttpSession session,@PathVariable("remitenteId") Long remitenteId, @PathVariable("destinatarioId") Long destinatarioId){
        Long usuarioId = (Long) session.getAttribute("userId");
        Usuario usuarioEmail = servicioUsuario.findById(usuarioId);

        if(usuarioId == null){
            return "redirect:/";
        }


        List<Mensaje> mensajesRemitenteADestinatario = servicioMensaje.findMensajesByRemitenteYDestinatario(remitenteId, destinatarioId);
        List<Mensaje> mensajesDestinatarioARemitente = servicioMensaje.findMensajesByRemitenteYDestinatario(destinatarioId, remitenteId);
        model.addAttribute("usuarioEmail", usuarioEmail);
        model.addAttribute("mensajesDestinatarioARemitente", mensajesDestinatarioARemitente);
        model.addAttribute("mensajesRemitenteADestinatario", mensajesRemitenteADestinatario);
        return "mensaje.jsp";
    }

}

package com.grupo8.tulibroapp.Controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    @PostMapping("/usuarios/{remitenteId}/{destinatarioId}/intercambios")
    public String enviarMensajeIntercarbios(@RequestParam("remitenteId") Long remitenteId,
            @RequestParam("destinatarioId") Long destinatarioId,
            @RequestParam("contenido") String contenido,
            HttpSession session, RedirectAttributes redirectAttributes, Model model) {
        Long usuarioId = (Long) session.getAttribute("userId");
        Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
        List<Autor> listaFrases = servicioAutor.findAll();
        List<LibroIntercambio> listalibros = servicioLibroIntercambio.findAll();
        model.addAttribute("usuarioEmail", usuarioEmail);
        model.addAttribute("listaFrases", listaFrases);
        model.addAttribute("listalibros", listalibros);

        if (usuarioId == null) {
            return "redirect:/usuario/login";
        }

        if (contenido == null || contenido.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "Campo invalido");
            return "redirect:/intercambios/libros#open-modal";
        }

        Usuario remitente = servicioUsuario.findById(remitenteId);
        Usuario destinatario = servicioUsuario.findById(destinatarioId);

        Mensaje mensaje = new Mensaje();
        mensaje.setRemitente(remitente);
        mensaje.setDestinatario(destinatario);
        mensaje.setContenido(contenido);

        redirectAttributes.addFlashAttribute("realizado", "Mensaje enviado con exito");
        servicioMensaje.save(mensaje);
        return "redirect:/intercambios/libros";
    }

    @PostMapping("/usuarios/{remitenteId}/{destinatarioId}/perfil")
    public String enviarMensajePerfil(@RequestParam("remitenteId") Long remitenteId,
            @RequestParam("destinatarioId") Long destinatarioId,
            @RequestParam("contenido") String contenido,
            HttpSession session, RedirectAttributes redirectAttributes) {
        Usuario remitente = servicioUsuario.findById(remitenteId);
        Usuario destinatario = servicioUsuario.findById(destinatarioId);

         if (contenido == null || contenido.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "Campo Invalido");
            return "redirect:/mensajes/usuarios/" + remitenteId + "/" + destinatarioId;
        }

        Mensaje mensaje = new Mensaje();
        mensaje.setRemitente(remitente);
        mensaje.setDestinatario(destinatario);
        mensaje.setContenido(contenido);

        servicioMensaje.save(mensaje);

        return "redirect:/mensajes/usuarios/" + remitenteId + "/" + destinatarioId;
    }

    @GetMapping("/usuarios/{remitenteId}/{destinatarioId}")
    public String interacciones(Model model, HttpSession session, @PathVariable("remitenteId") Long remitenteId,
            @PathVariable("destinatarioId") Long destinatarioId) {
        Long usuarioId = (Long) session.getAttribute("userId");
        Usuario usuarioEmail = servicioUsuario.findById(usuarioId);

        if (usuarioId == null && usuarioId != remitenteId) {
            return "redirect:/";
        }

        Usuario remitente = servicioUsuario.findById(remitenteId);
        Usuario destinatario = servicioUsuario.findById(destinatarioId);

        List<Mensaje> uniqueMessages = servicioMensaje.findMensajesByRemitenteYDestinatario(remitenteId, destinatarioId);
    
        model.addAttribute("remitente", remitente);
        model.addAttribute("destinatario", destinatario);
        model.addAttribute("mensajes", uniqueMessages);
        model.addAttribute("usuarioEmail", usuarioEmail);
        return "mensaje.jsp";
    }

}

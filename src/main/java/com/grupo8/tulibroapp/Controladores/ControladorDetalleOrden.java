package com.grupo8.tulibroapp.Controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.grupo8.tulibroapp.Modelos.DetalleOrden;
import com.grupo8.tulibroapp.Modelos.Libro;
import com.grupo8.tulibroapp.Modelos.Usuario;
import com.grupo8.tulibroapp.Servicio.ServicioDetalleOrden;
import com.grupo8.tulibroapp.Servicio.ServicioLibro;
import com.grupo8.tulibroapp.Servicio.ServicioUsuario;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorDetalleOrden {

    @Autowired
    private ServicioDetalleOrden servicioDetalleOrden;

    @Autowired
    private ServicioLibro servicioLibro;

    @Autowired
    private ServicioUsuario servicioUsuario;

    @GetMapping("/orden/confrimar/{libro}")
    public String showConfirmarCompra(@PathVariable("libro") Long libroId, Model model) {
        Libro libro = servicioLibro.findById(libroId);
        model.addAttribute("libro", libro);
        return "confrimarCompra.jsp";
    }

    @GetMapping("/orden/compra/{libroId}")
    public String crudDestalleOrden(@ModelAttribute("detalleOrden") DetalleOrden orden,
            @PathVariable("libroId") Long libroId, Model model) {
        return "crudDetalleOrden.jsp";
    }

    @PostMapping("/orden/compra/{libroId}")
    public String comprarProducto(@Valid @ModelAttribute("detalleOrden") DetalleOrden orden,
            @PathVariable("libroId") Long libroId, HttpSession session) {
        Long usuarioId = (Long) session.getAttribute("userId");
        Usuario usuario = servicioUsuario.findById(usuarioId);

        Libro libro = servicioLibro.findById(libroId);

        orden.setLibro(libro);
        orden.setUsuario(usuario);

        servicioDetalleOrden.save(orden);
        return "redirect:/principal";
    }

    @GetMapping("/orden/lista")
    public String historial_ordenes(HttpSession session, Model model) {
        Long usuarioId = (Long) session.getAttribute("userId");
        List<DetalleOrden> listOrdenes = servicioDetalleOrden.getDetalleOrdenesByUsuarioId(usuarioId);
        model.addAttribute("listOrdenes", listOrdenes);
        return "historialDeOrdenes.jsp";
    }

    @PostMapping("/orden/cancelar/{libroId}")
    public String cancelarProducto(@PathVariable("libroId") Long libroId, HttpSession session) {
        Long usuarioId = (Long) session.getAttribute("userId");
        Usuario usuario = servicioUsuario.findById(usuarioId);
        Libro libro = servicioLibro.findById(libroId);
        usuario.getLibrosOrdenes().remove(libro);
        return "redirect:/principal";
    }

}

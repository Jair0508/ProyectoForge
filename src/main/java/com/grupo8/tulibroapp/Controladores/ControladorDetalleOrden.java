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

import com.grupo8.tulibroapp.Modelos.DetalleOrden;
import com.grupo8.tulibroapp.Modelos.LibroVenta;
import com.grupo8.tulibroapp.Modelos.Usuario;
import com.grupo8.tulibroapp.Servicio.ServicioDetalleOrden;
import com.grupo8.tulibroapp.Servicio.ServicioLibroVenta;
import com.grupo8.tulibroapp.Servicio.ServicioUsuario;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/orden")
public class ControladorDetalleOrden {

    @Autowired
    private ServicioDetalleOrden servicioDetalleOrden;

    @Autowired
    private ServicioLibroVenta servicioLibroVenta;

    @Autowired
    private ServicioUsuario servicioUsuario;

    @GetMapping("/confirmar/{libro}")
    public String showConfirmarCompra(@PathVariable("libro") Long libroId, HttpSession session, Model model) {
        Long usuarioId = (Long) session.getAttribute("userId");
        if (usuarioId == null) {
            return "redirect:/registro";
        }
        LibroVenta libro = servicioLibroVenta.findById(libroId);
        model.addAttribute("libro", libro);
        return "confirmarCompra.jsp";
    }

    @GetMapping("/compra/{libroId}")
    public String crudDestalleOrden(@ModelAttribute("detalleOrden") DetalleOrden orden,
            @PathVariable("libroId") Long libroId, HttpSession session, RedirectAttributes redirectAttributes,
            Model model) {
        Long usuarioId = (Long) session.getAttribute("userId");
        if (usuarioId == null) {

            return "redirect:/registro";
        }
        return "registroDetalleOrden.jsp";
    }

    @PostMapping("/compra/{libroId}")
    public String comprarProducto(@Valid @ModelAttribute("detalleOrden") DetalleOrden orden,
            @PathVariable("libroId") Long libroId, BindingResult result, HttpSession session) {
        if (result.hasErrors()) {
            return "registroDetalleOrden.jsp";
        }
        Long usuarioId = (Long) session.getAttribute("userId");
        Usuario usuario = servicioUsuario.findById(usuarioId);

        LibroVenta libro = servicioLibroVenta.findById(libroId);

        orden.setPrecioUnitario(libro.getPrecio());
        orden.setPrecioTotal(orden.getCantidad() * libro.getPrecio());
        orden.setLibroVenta(libro);
        orden.setUsuario(usuario);

        libro.setCantidad(libro.getCantidad() - orden.getCantidad());

        servicioLibroVenta.save(libro);
        servicioDetalleOrden.save(orden);
        return "redirect:/principal";
    }

    @GetMapping("/lista")
    public String historial_ordenes(HttpSession session, Model model) {
        Long usuarioId = (Long) session.getAttribute("userId");
        List<DetalleOrden> listOrdenes = servicioDetalleOrden.getDetalleOrdenesByUsuarioId(usuarioId);
        model.addAttribute("listOrdenes", listOrdenes);
        return "historialDeOrdenes.jsp";
    }

    @PostMapping("/cancelar/{libroId}")
    public String cancelarProducto(@PathVariable("libroId") Long libroId, HttpSession session) {
        Long usuarioId = (Long) session.getAttribute("userId");
        Usuario usuario = servicioUsuario.findById(usuarioId);
        LibroVenta libro = servicioLibroVenta.findById(libroId);
        usuario.getLibrosOrdenes().remove(libro);
        return "redirect:/principal";
    }

}
